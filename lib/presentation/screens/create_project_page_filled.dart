import 'package:do_it/presentation/components/custom_back_button.dart';
import 'package:do_it/presentation/components/custom_elevated_button.dart';
import 'package:do_it/presentation/components/expanded_text_field.dart';
import 'package:do_it/presentation/widgets/tag_arrow.dart';
import 'package:do_it/presentation/components/transparent_text_field.dart';
import 'package:do_it/presentation/screens/projects_page.dart';
import 'package:do_it/utils/app_colors.dart';
import 'package:do_it/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CreateProjectPageFilled extends StatelessWidget {
  const CreateProjectPageFilled({super.key});

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
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: AppColors.white,
                    child: Image.asset(
                      AppIcons.liberty,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                  Gap(15),
                  Expanded(
                    child: TransparentTextField(
                      label: 'Project Name',
                      enabled: false,
                      text: 'Liberty Pay',
                    ),
                  ),
                ],
              ),
              const Gap(46),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Created (from)',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.lightGreyText,
                          ),
                        ),
                        TransparentTextField(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 14,
                              horizontal: 0,
                            ),
                            child: SvgPicture.asset(AppIcons.icCalender),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(35),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'End (to)',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.lightGreyText,
                          ),
                        ),
                        TransparentTextField(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 14,
                              horizontal: 0,
                            ),
                            child: SvgPicture.asset(AppIcons.icCalender),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(29),
              Text(
                'Assign to:',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightGreyText,
                ),
              ),
              const Gap(13),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      SizedBox(width: 80),
                      _teamMemberAvatar(image: AppIcons.avatar1),
                      Positioned(
                        left: 20,
                        child: _teamMemberAvatar(image: AppIcons.avatar2),
                      ),
                      Positioned(
                        right: 0,
                        child: _teamMemberAvatar(image: AppIcons.avatar3),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.white,
                      child: Icon(Icons.add),
                    ),
                  ),
                ],
              ),
              Divider(color: Colors.grey.shade600, thickness: 0.5),

              const Gap(20),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tags:',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.lightGreyText,
                      ),
                    ),
                    const Gap(9),
                    Row(
                      children: [
                        TagArrow(
                          bgColor: const Color(0xFF9EFFCC),
                          color: const Color(0xFF009A49),
                          text: 'Design',
                        ),
                        TagArrow(
                          bgColor: const Color(0xFFFFE5BE),
                          color: const Color(0xFFF7A325),
                          text: 'Front end',
                        ),
                        TagArrow(
                          bgColor: const Color(0xFFC0E2FF),
                          color: const Color(0xFF217AC0),
                          text: 'Backend',
                        ),
                      ],
                    ),
                    const Gap(6),
                    const Divider(),
                  ],
                ),
              ),
              const Gap(26),
              Text(
                'Description',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightGreyText,
                ),
              ),
              const Gap(7),
              // Description Text Field
              const ExpandedTextField(
                enabled: false,
                text:
                    'Lorem ipsum dolor sit amet, conse jose  adipiscing elit. Vestibulum semper  llmauris as lacus, turpis  Lorem ipsum dolor sit amet, conse ',
              ),
              const Gap(22),
              // Create Project Button
              CustomElevatedButton(
                width: double.infinity,
                label: 'Create Project',
                onPressed:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProjectsPage(),
                      ),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Team member avatar widget
  Widget _teamMemberAvatar({required String image}) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(100),
      ),
      child: CircleAvatar(
        radius: 15,
        backgroundColor: AppColors.grey,
        child: Image.asset(
          image,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
