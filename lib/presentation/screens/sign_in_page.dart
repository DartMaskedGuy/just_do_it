import 'package:do_it/notifiers/auth_notifier.dart';
import 'package:do_it/presentation/components/custom_back_button.dart';
import 'package:do_it/presentation/components/custom_elevated_button.dart';
import 'package:do_it/presentation/components/custom_text_field.dart';
import 'package:do_it/utils/app_colors.dart';
import 'package:do_it/utils/app_icons.dart';
import 'package:do_it/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
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
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // This method handles the sign-in process.
  Future<void> _signIn() async {
    final success = await ref
        .read(authStateProvider.notifier)
        .login(_emailController.text, _passwordController.text);

    if (success && mounted) {
      Navigator.pushReplacementNamed(context, AppRoutes.mainPage);
    } else if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Invalid credentials')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(10),
                const CustomBackButton(),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppIcons.logo),
                    const Gap(12),
                    RichText(
                      text: TextSpan(
                        text: 'DO',
                        style: TextStyle(
                          fontSize: 33,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryText,
                        ),
                        children: [
                          TextSpan(
                            text: '-IT',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Gap(22),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Welcome Back !',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.24,
                    ),
                  ),
                ),
                const Gap(36),
                CustomTextField(
                  hintText: 'Email',
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                const Gap(16),
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
                  'Forgot Password?',
                  style: TextStyle(
                    color: AppColors.secondaryText,
                    fontSize: 12,
                  ),
                ),
                const Gap(100),
                Row(
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                        label: 'Sign in',
                        onPressed: _signIn,
                      ),
                    ),
                    const Gap(16),
                    SizedBox(
                      width: 54,
                      height: 56,
                      child: IconButton.outlined(
                        onPressed: () {},
                        style: IconButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 3,
                              color: AppColors.primaryText,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        icon: SvgPicture.asset(AppIcons.icFingerPrint),
                      ),
                    ),
                  ],
                ),
                const Gap(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account? ',
                      style: TextStyle(
                        color: AppColors.secondaryText,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    GestureDetector(
                      onTap:
                          () => Navigator.pushNamed(
                            context,
                            AppRoutes.createAccount,
                          ),
                      child: Text(
                        'Create Account',
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
