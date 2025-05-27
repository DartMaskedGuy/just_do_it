import 'package:do_it/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingIcons extends StatelessWidget {
  final String svg;
  const OnboardingIcons({super.key, required this.svg});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 65,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withAlpha(150),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: SvgPicture.asset(svg),
    );
  }
}
