import 'package:do_it/notifiers/auth_notifier.dart';
import 'package:do_it/presentation/components/custom_elevated_button.dart';
import 'package:do_it/presentation/components/custom_back_button.dart';
import 'package:do_it/presentation/components/custom_phone_text_field.dart';
import 'package:do_it/presentation/components/custom_text_field.dart';
import 'package:do_it/utils/app_colors.dart';
import 'package:do_it/utils/app_icons.dart';
import 'package:do_it/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CreateAccountPage extends ConsumerStatefulWidget {
  const CreateAccountPage({super.key});

  @override
  ConsumerState<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends ConsumerState<CreateAccountPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isPasswordVisible = true;
  // This method toggles the visibility of the password.
  void _togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // This method handles the account creation process.
  Future<void> _createAccount() async {
    final success = await ref
        .read(authStateProvider.notifier)
        .register(
          _nameController.text,
          _emailController.text,
          _phoneController.text,
          _passwordController.text,
        );

    if (success && mounted) {
      Navigator.pushReplacementNamed(context, AppRoutes.signIn);
    } else if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Failed to create account')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(10),
                  const CustomBackButton(),
                  const Gap(16),
                  const Text(
                    'Create \nAccount',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.24,
                    ),
                  ),
                  const Gap(16),
                  RichText(
                    text: TextSpan(
                      text: 'Please fill the details below to \ncreate a ',
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1.6,
                      ),
                      children: [
                        TextSpan(
                          text: 'DO-IT',
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(text: ' account'),
                      ],
                    ),
                  ),
                  const Gap(24),
                  CustomTextField(
                    hintText: 'Name',
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  const Gap(24),
                  CustomTextField(
                    hintText: 'Email',
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                      if (!emailRegex.hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const Gap(24),
                  const CustomPhoneTextField(),
                  const Gap(10),
                  CustomTextField(
                    obscureText: isPasswordVisible,
                    hintText: 'Password',
                    suffixIcon: GestureDetector(
                      onTap: _togglePasswordVisibility,
                      child:
                          isPasswordVisible
                              ? SvgPicture.asset(AppIcons.icVisible)
                              : Icon(
                                Icons.visibility_off,
                                color: AppColors.lightGreyText,
                              ),
                    ),
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const Gap(8),
                  Text(
                    'Password must be atleast 8 characters',
                    style: TextStyle(
                      color: AppColors.secondaryText,
                      fontSize: 12,
                    ),
                  ),
                  const Gap(68),
                  CustomElevatedButton(
                    width: double.infinity,
                    label: 'Create account',
                    onPressed: _createAccount,
                  ),
                  const Gap(8),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Privacy policy',
                      style: TextStyle(
                        color: AppColors.secondaryText,
                        fontSize: 12,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
