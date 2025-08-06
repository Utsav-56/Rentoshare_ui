import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'
    show FontAwesomeIcons;
import '../../routes/app_router.dart';
import '../../routes/app_routes.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _bioController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _acceptTerms = false;
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void dispose() {
    _fullNameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneNumberController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 75,
      );
      if (image != null) {
        setState(() {
          _profileImage = File(image.path);
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error picking image: $e')));
    }
  }

  void _removeImage() {
    setState(() {
      _profileImage = null;
    });
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  String? _validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is required';
    }
    if (value.length < 3) {
      return 'Username must be at least 3 characters';
    }
    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
      return 'Username can only contain letters, numbers, and underscores';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return null; // Optional field
    }
    if (value.length < 10) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (!_acceptTerms) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please accept the terms and conditions'),
          ),
        );
        return;
      }

      // Here you would typically send the data to your backend
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Account created successfully!')),
      );

      // Navigate to login or home page
      AppRouter.to(AppRoutes.LOGIN);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildHeader(),
                const SizedBox(height: 32),
                _buildProfilePicture(),
                const SizedBox(height: 24),
                _buildRequiredFields(),
                const SizedBox(height: 24),
                _buildOptionalFields(),
                const SizedBox(height: 24),
                _buildTermsAndConditions(),
                const SizedBox(height: 24),
                _buildSignUpButton(),
                const SizedBox(height: 16),
                _buildSocialSignUp(),
                const SizedBox(height: 32),
                _buildLoginPrompt(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        // CircleAvatar(
        //   radius: 35,
        //   backgroundColor: Colors.green.shade100.withOpacity(0.5),
        //   child: const Icon(
        //     Icons.person_add_rounded,
        //     color: Colors.green,
        //     size: 35,
        //   ),
        // ),
        const SizedBox(height: 24),
        const Text(
          'Create Account',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'Please fill in the details to create your account.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildProfilePicture() {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey.shade200,
            backgroundImage: _profileImage != null
                ? FileImage(_profileImage!)
                : null,
            child: _profileImage == null
                ? Icon(Icons.person, size: 50, color: Colors.grey.shade400)
                : null,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: _profileImage == null ? _pickImage : _removeImage,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Icon(
                  _profileImage == null ? Icons.camera_alt : Icons.close,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRequiredFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Required Information',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _fullNameController,
          decoration: const InputDecoration(
            labelText: 'Full Name',
            hintText: 'Enter your full name',
            prefixIcon: Icon(Icons.person),
          ),
          validator: (value) => _validateRequired(value, 'Full Name'),
          textCapitalization: TextCapitalization.words,
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _usernameController,
          decoration: const InputDecoration(
            labelText: 'Username',
            hintText: 'Choose a username',
            prefixIcon: Icon(Icons.alternate_email),
          ),
          validator: _validateUsername,
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _emailController,
          decoration: const InputDecoration(
            labelText: 'Email',
            hintText: 'Enter your email address',
            prefixIcon: Icon(Icons.email),
          ),
          keyboardType: TextInputType.emailAddress,
          validator: _validateEmail,
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _passwordController,
          obscureText: !_isPasswordVisible,
          decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'Create a strong password',
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            ),
          ),
          validator: _validatePassword,
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _confirmPasswordController,
          obscureText: !_isConfirmPasswordVisible,
          decoration: InputDecoration(
            labelText: 'Confirm Password',
            hintText: 'Confirm your password',
            prefixIcon: const Icon(Icons.lock_outline),
            suffixIcon: IconButton(
              icon: Icon(
                _isConfirmPasswordVisible
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
              onPressed: () {
                setState(() {
                  _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                });
              },
            ),
          ),
          validator: _validateConfirmPassword,
        ),
      ],
    );
  }

  Widget _buildOptionalFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Optional Information',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _phoneNumberController,
          decoration: const InputDecoration(
            labelText: 'Phone Number (Optional)',
            hintText: 'Enter your phone number',
            prefixIcon: Icon(Icons.phone),
          ),
          keyboardType: TextInputType.phone,
          validator: _validatePhone,
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _bioController,
          decoration: const InputDecoration(
            labelText: 'Bio (Optional)',
            hintText: 'Tell us about yourself',
            prefixIcon: Icon(Icons.description),
          ),
          maxLines: 3,
          maxLength: 150,
        ),
      ],
    );
  }

  Widget _buildTermsAndConditions() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: _acceptTerms,
          onChanged: (bool? value) {
            setState(() {
              _acceptTerms = value!;
            });
          },
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _acceptTerms = !_acceptTerms;
              });
            },
            child: RichText(
              text: TextSpan(
                children: [
                  const TextSpan(text: 'I agree to the '),
                  TextSpan(
                    text: 'Terms and Conditions',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(text: ' and '),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _submitForm,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: const Text(
          'Create Account',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildSocialSignUp() {
    return Column(
      children: [
        const Row(
          children: [
            Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('OR SIGN UP WITH'),
            ),
            Expanded(child: Divider()),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _socialButton(icon: FontAwesomeIcons.google, label: 'Google'),
            _socialButton(icon: FontAwesomeIcons.apple, label: 'Apple'),
            _socialButton(icon: FontAwesomeIcons.twitter, label: 'Twitter'),
          ],
        ),
      ],
    );
  }

  Widget _socialButton({required IconData icon, required String label}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: OutlinedButton(
          onPressed: () {
            // Implement social signup
          },
          style: OutlinedButton.styleFrom(padding: const EdgeInsets.all(12)),
          child: Icon(icon, size: 20),
        ),
      ),
    );
  }

  Widget _buildLoginPrompt() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have an account? "),
        GestureDetector(
          onTap: () {
            AppRouter.to(AppRoutes.LOGIN);
          },
          child: Text('Sign In'),
        ),
      ],
    );
  }
}
