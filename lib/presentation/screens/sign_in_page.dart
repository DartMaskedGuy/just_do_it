import 'package:do_it/presentation/components/custom_back_button.dart';
import 'package:do_it/presentation/components/custom_elevated_button.dart';
import 'package:do_it/presentation/components/custom_text_field.dart';
import 'package:do_it/utils/app_colors.dart';
import 'package:do_it/utils/app_icons.dart';
import 'package:do_it/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              CustomTextField(hintText: 'Email'),
              const Gap(16),
              CustomTextField(
                obscureText: true,
                hintText: 'Password',
                suffixIcon: SvgPicture.asset(AppIcons.icVisible),
              ),
              const Gap(8),
              Text(
                'Forgot Password?',
                style: TextStyle(color: AppColors.secondaryText, fontSize: 12),
              ),
              const Gap(100),
              Row(
                children: [
                  Expanded(
                    child: CustomElevatedButton(
                      label: 'Sign in',
                      onPressed:
                          () =>
                              Navigator.pushNamed(context, AppRoutes.mainPage),
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
    );
  }
}
