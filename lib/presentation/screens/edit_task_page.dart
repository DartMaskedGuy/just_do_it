import 'package:do_it/models/task_model.dart';
import 'package:do_it/presentation/components/custom_back_button.dart';
import 'package:do_it/presentation/components/custom_elevated_button.dart';
import 'package:do_it/presentation/components/expanded_text_field.dart';
import 'package:do_it/presentation/widgets/tag_arrow.dart';
import 'package:do_it/presentation/components/transparent_text_field.dart';
import 'package:do_it/presentation/screens/add_task_page.dart';
import 'package:do_it/utils/app_colors.dart';
import 'package:do_it/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class EditTaskPage extends ConsumerStatefulWidget {
  const EditTaskPage({super.key});

  @override
  ConsumerState<EditTaskPage> createState() => _EditTaskPageState();
}

class _EditTaskPageState extends ConsumerState<EditTaskPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _commentsController = TextEditingController();
  final List<String> _selectedTags = [];
  // final List<String> _assignedMembers = [];
  DateTime? selectedStartDate;
  DateTime? selectedEndDate;

  // Function to select date
  // Start Date
  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedStartDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && mounted) {
      setState(() {
        selectedStartDate = picked;
      });
    }
  }

  // End Date
  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedEndDate ?? DateTime.now(),
      firstDate: selectedStartDate ?? DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && mounted) {
      setState(() {
        selectedEndDate = picked;
      });
    }
  }

  // Available tags
  final List<TagData> _availableTags = [
    TagData(
      name: 'Design',
      bgColor: const Color(0xFF9EFFCC),
      textColor: const Color(0xFF009A49),
    ),
    TagData(
      name: 'Frontend',
      bgColor: const Color(0xFFFFE5BE),
      textColor: const Color(0xFFF7A325),
    ),
    TagData(
      name: 'Backend',
      bgColor: const Color(0xFFC0E2FF),
      textColor: const Color(0xFF217AC0),
    ),
    TagData(
      name: 'Others',
      bgColor: const Color(0xFFEEEEEE),
      textColor: const Color(0xFF9E9E9E),
    ),
  ];

  // Toggle tag method
  void _toggleTag(String tag) {
    setState(() {
      if (_selectedTags.contains(tag)) {
        _selectedTags.remove(tag);
      } else {
        _selectedTags.add(tag);
      }
    });
  }

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
    // Format dates
    final String startDateText =
        selectedStartDate != null
            ? DateFormat('d-M-yyyy').format(selectedStartDate!)
            : '';

    final String endDateText =
        selectedEndDate != null
            ? DateFormat('d-M-yyyy').format(selectedEndDate!)
            : '';

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: Form(
              key: _formKey,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    child: SvgPicture.asset(
                                      AppIcons.icTaskEdit,
                                    ),
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
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.lightGreyText,
                    ),
                  ),
                  TransparentTextField(
                    enabled: false,
                    text: 'Liberty Pay',
                    controller: _nameController,
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
                              onTap: () => _selectStartDate(context),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    AppIcons.icCalender,
                                    width: 20,
                                  ),
                                  const Gap(8),
                                  Text(
                                    startDateText,
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
                              onTap: () => _selectEndDate(context),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    AppIcons.icCalender,
                                    width: 20,
                                  ),
                                  const Gap(8),
                                  Text(
                                    endDateText,
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
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (var tag in _availableTags)
                                TagArrow(
                                  text: tag.name,
                                  bgColor: tag.bgColor,
                                  color: tag.textColor,
                                  isSelected: _selectedTags.contains(tag.name),
                                  onTap: () => _toggleTag(tag.name),
                                ),
                            ],
                          ),
                        ),
                        const Gap(6),
                        Divider(color: AppColors.lightGreyText, thickness: 0.5),
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
                  ExpandedTextField(
                    controller: _commentsController,
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
