import 'package:do_it/presentation/components/custom_back_button.dart';
import 'package:do_it/presentation/components/custom_elevated_button.dart';
import 'package:do_it/presentation/components/transparent_text_field.dart';
import 'package:do_it/utils/app_colors.dart';
import 'package:do_it/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CreateProjectPage extends StatelessWidget {
  const CreateProjectPage({super.key});

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
              const Gap(22),
              Text(
                'Create Project',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  letterSpacing: -0.24,
                ),
              ),
              const Gap(19),
              const Row(
                children: [
                  CircleAvatar(radius: 30, backgroundColor: AppColors.grey),
                  Gap(15),
                  TransparentTextField(),
                ],
              ),
              const Gap(46),
              Row(
                children: [
                  TransparentTextField(
                    prefixIcon: SvgPicture.asset(AppIcons.icCalender),
                  ),
                  Gap(35),
                  TransparentTextField(
                    prefixIcon: SvgPicture.asset(AppIcons.icCalender),
                  ),
                ],
              ),
              const Gap(29),
              Text(
                'Assign to:',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyText,
                ),
              ),
              const Gap(13),
              Text(
                'Description',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyText,
                ),
              ),
              const Gap(7),
              SizedBox(
                height: 91,
                width: double.infinity,
                child: TextFormField(
                  maxLines: null,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    filled: true,
                    fillColor: Colors.transparent,
                    hintText: 'Enter project description',
                    hintStyle: const TextStyle(color: Color(0xFFB1B0B0)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.5,
                        color: Color(0xFFB1B0B0),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.5,
                        color: Color(0xFFB1B0B0),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                  ),
                ),
              ),
              const Gap(22),
              CustomElevatedButton(
                width: double.infinity,
                label: 'Create Project',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
