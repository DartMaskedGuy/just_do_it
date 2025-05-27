import 'package:do_it/presentation/components/app_logo.dart';
import 'package:do_it/presentation/components/custom_elevated_button.dart';
import 'package:do_it/presentation/components/onboarding_icons.dart';
import 'package:do_it/utils/app_colors.dart';
import 'package:do_it/utils/app_icons.dart';
import 'package:do_it/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const Gap(50),
              const AppLogo(),
              const Spacer(),
              const OnboardingIcons(svg: AppIcons.icCheckmark),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OnboardingIcons(svg: AppIcons.icTaskMenu),
                    OnboardingIcons(svg: AppIcons.icCalenderFill),
                  ],
                ),
              ),
              Image.asset(AppIcons.onboardingImage),
              const Gap(61),
              RichText(
                text: TextSpan(
                  text: 'Just ',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'DO-IT',
                      style: const TextStyle(color: AppColors.primaryText),
                    ),
                  ],
                ),
              ),
              const Gap(17),
              CustomElevatedButton(
                width: double.infinity,
                label: 'Create account',
                onPressed:
                    () => Navigator.pushNamed(context, AppRoutes.createAccount),
              ),
              const Gap(12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(
                      color: AppColors.secondaryText,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, AppRoutes.signIn),
                    child: Text(
                      'Sign in',
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
