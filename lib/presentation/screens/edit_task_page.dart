import 'package:do_it/presentation/components/custom_back_button.dart';
import 'package:do_it/presentation/components/custom_elevated_button.dart';
import 'package:do_it/presentation/components/expanded_text_field.dart';
import 'package:do_it/presentation/widgets/tag_arrow.dart';
import 'package:do_it/presentation/components/transparent_text_field.dart';
import 'package:do_it/presentation/screens/add_task_page.dart';
import 'package:do_it/utils/app_colors.dart';
import 'package:do_it/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class EditTaskPage extends StatefulWidget {
  const EditTaskPage({super.key});

  @override
  State<EditTaskPage> createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  // Progress Percentage
  final List<String> progress = [
    '10%',
    '20%',
    '30%',
    '40%',
    '50%',
    '60%',
    '70%',
    '80%',
    '90%',
    '100%',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomBackButton(),
                  PopupMenuButton<String>(
                    color: AppColors.white,
                    constraints: const BoxConstraints(minWidth: 225),
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    icon: SvgPicture.asset(AppIcons.icTaskEdit),
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem<String>(
                          enabled: false,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(
                                  'Progress %',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: AppColors.greyText,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: SvgPicture.asset(AppIcons.icTaskEdit),
                              ),
                            ],
                          ),
                        ),
                        ...progress.map(
                          (String value) => PopupMenuItem<String>(
                            value: value,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Gap(18),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: AppColors.greyText,
                                    ),
                                  ),
                                ),
                                const Gap(18),
                                if (value != progress.last)
                                  const Divider(height: 1),
                              ],
                            ),
                          ),
                        ),
                      ];
                    },
                    onSelected: (String value) {},
                  ),
                ],
              ),
              const Gap(22),
              Text(
                'Edit task',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  letterSpacing: -0.24,
                ),
              ),
              const Gap(19),
              Text(
                'Task Name',
                style: TextStyle(fontSize: 12, color: AppColors.lightGreyText),
              ),
              TransparentTextField(enabled: false, text: 'Liberty Pay'),
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
              // Assign Task
              Text(
                'Assign Task:',
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
                'Comments:',
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
              const Spacer(),
              // Add Task Button
              CustomElevatedButton(
                width: double.infinity,
                label: 'Save',
                onPressed:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddTaskPage(),
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
