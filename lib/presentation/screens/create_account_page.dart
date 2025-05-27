import 'package:do_it/presentation/components/custom_elevated_button.dart';
import 'package:do_it/presentation/components/custom_back_button.dart';
import 'package:do_it/presentation/components/custom_text_field.dart';
import 'package:do_it/utils/app_colors.dart';
import 'package:do_it/utils/app_icons.dart';
import 'package:do_it/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

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
              CustomTextField(hintText: 'Name'),
              const Gap(24),
              CustomTextField(hintText: 'Email'),
              const Gap(24),
              CustomTextField(
                hintText: 'Mobile Number',
                suffixIcon: Icon(Icons.visibility, color: Colors.black),
              ),
              const Gap(24),
              CustomTextField(
                hintText: 'Password',
                suffixIcon: SvgPicture.asset(AppIcons.visible),
              ),
              const Gap(8),
              Text(
                'Password must be atleast 8 characters',
                style: TextStyle(color: AppColors.secondaryText, fontSize: 12),
              ),
              const Spacer(),
              CustomElevatedButton(
                width: double.infinity,
                label: 'Create account',
                onPressed:
                    () => Navigator.pushNamed(context, AppRoutes.createAccount),
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
    );
  }
}
