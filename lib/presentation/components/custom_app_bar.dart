import 'package:do_it/utils/app_colors.dart';
import 'package:do_it/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Hi Dexter',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            Text(
              'Welcome onboard',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.primaryText,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          style: IconButton.styleFrom(backgroundColor: const Color(0xFFECF1FF)),
          icon: Badge(
            backgroundColor: Colors.red,
            smallSize: 10,
            child: SvgPicture.asset(
              AppIcons.notification,
              width: 24,
              height: 24,
            ),
          ),
        ),
      ],
    );
  }
}
