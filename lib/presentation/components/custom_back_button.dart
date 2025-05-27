import 'package:do_it/utils/app_colors.dart';
import 'package:do_it/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: IconButton.outlined(
        onPressed: () => Navigator.pop(context),
        style: IconButton.styleFrom(side: BorderSide(color: AppColors.grey)),
        icon: SvgPicture.asset(AppIcons.chevronLeft),
      ),
    );
  }
}
