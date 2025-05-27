import 'package:do_it/utils/app_colors.dart';
import 'package:do_it/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
