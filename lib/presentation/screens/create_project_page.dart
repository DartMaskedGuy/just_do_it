import 'package:do_it/presentation/components/custom_back_button.dart';
import 'package:do_it/presentation/components/custom_elevated_button.dart';
import 'package:do_it/presentation/components/expanded_text_field.dart';
import 'package:do_it/presentation/components/transparent_text_field.dart';
import 'package:do_it/presentation/screens/create_project_page_filled.dart';
import 'package:do_it/utils/app_colors.dart';
import 'package:do_it/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class CreateProjectPage extends StatefulWidget {
  const CreateProjectPage({super.key});

  @override
  State<CreateProjectPage> createState() => _CreateProjectPageState();
}

class _CreateProjectPageState extends State<CreateProjectPage> {
  DateTime? selectedDate;

  // Function to select date
  Future<void> _selectDate(BuildContext context) async {
    // Date picker
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Format the selected date
    final String dateText =
        selectedDate != null
            ? DateFormat('d-M-yyyy').format(selectedDate!)
            : '';

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
                  Expanded(child: TransparentTextField(label: 'Project Name')),
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
                        Gap(5),
                        GestureDetector(
                          onTap: () => _selectDate(context),
                          child: Row(
                            children: [
                              SvgPicture.asset(AppIcons.icCalender, width: 20),
                              const Gap(8),
                              Text(
                                dateText,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.lightGreyText,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
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
                        Gap(5),
                        GestureDetector(
                          onTap: () => _selectDate(context),
                          child: Row(
                            children: [
                              SvgPicture.asset(AppIcons.icCalender, width: 20),
                              const Gap(8),
                              Text(
                                dateText,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.lightGreyText,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
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
                  Text(
                    'Add team members',
                    style: TextStyle(color: AppColors.lightGreyText),
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
              Divider(color: AppColors.lightGreyText, thickness: 0.5),

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
                    TransparentTextField(),
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
              const ExpandedTextField(),
              const Gap(22),
              // Create Project Button
              CustomElevatedButton(
                width: double.infinity,
                label: 'Create Project',
                onPressed:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateProjectPageFilled(),
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
