import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rentoshare/routes/app_routes.dart' show AppRoutes;

class AuthController extends GetxController {
  static const _baseUrl = 'http://127.0.0.1:8000/auth';
  final _storage = const FlutterSecureStorage();

  RxBool isAuthenticated = false.obs;
  RxMap<String, dynamic> userInfo = <String, dynamic>{}.obs;

  String? _accessToken;
  String? _refreshToken;

  @override
  void onInit() {
    super.onInit();
    _loadTokens();
  }

  Future<void> _loadTokens() async {
    _accessToken = await _storage.read(key: 'accessToken');
    _refreshToken = await _storage.read(key: 'refreshToken');
    isAuthenticated.value = _accessToken != null;
    if (isAuthenticated.value) await getInfo();
  }

  Future<void> login(String email, String password) async {
    final url = Uri.parse('$_baseUrl/jwt/create/');
    final response = await http.post(
      url,
      body: {'email': email, 'password': password},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      _accessToken = data['access'];
      _refreshToken = data['refresh'];

      await _storage.write(key: 'accessToken', value: _accessToken);
      await _storage.write(key: 'refreshToken', value: _refreshToken);

      isAuthenticated.value = true;
      await getInfo();
      // goToInfo();
    } else {
      Get.snackbar("Login Failed", "Invalid email or password");
    }
  }

  Future<void> signup(String email, String password) async {
    final url = Uri.parse('$_baseUrl/users/');
    final response = await http.post(
      url,
      body: {'email': email, 'password': password},
    );

    if (response.statusCode == 201) {
      Get.snackbar("Signup Success", "You can now login");
      goToLogin();
    } else {
      Get.snackbar("Signup Failed", response.body);
    }
  }

  Future<void> getInfo() async {
    if (_accessToken == null) return;

    final url = Uri.parse('$_baseUrl/users/me/');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $_accessToken'},
    );

    if (response.statusCode == 200) {
      userInfo.value = jsonDecode(response.body);
    } else {
      logout();
    }
  }

  Future<void> logout() async {
    await _storage.deleteAll();
    _accessToken = null;
    _refreshToken = null;
    userInfo.value = {};
    isAuthenticated.value = false;
    goToLogin();
  }

  /// Middleware-like usage in initState to protect pages
  void protectPage() {
    if (!isAuthenticated.value) {
      goToLogin();
    }
  }

  // ───── Navigation Helpers ─────

  void goToLogin() => Get.toNamed(AppRoutes.LOGIN);
  void goToSignup() => Get.toNamed(AppRoutes.SIGNUP);
  // void goToInfo() => Get.toNamed(AppRoutes.INFO);

  // ───── Other Useful Functions ─────

  Future<String?> getAccessToken() async {
    return _accessToken ?? await _storage.read(key: 'accessToken');
  }

  Future<void> refreshToken() async {
    final url = Uri.parse('$_baseUrl/jwt/refresh/');
    final response = await http.post(url, body: {'refresh': _refreshToken});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      _accessToken = data['access'];
      await _storage.write(key: 'accessToken', value: _accessToken);
    } else {
      logout();
    }
  }
}
