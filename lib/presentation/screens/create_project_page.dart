import 'package:do_it/models/project_model.dart';
import 'package:do_it/models/task_model.dart';
import 'package:do_it/notifiers/project_notifier.dart';
import 'package:do_it/presentation/components/custom_back_button.dart';
import 'package:do_it/presentation/components/custom_elevated_button.dart';
import 'package:do_it/presentation/components/expanded_text_field.dart';
import 'package:do_it/presentation/components/transparent_text_field.dart';
import 'package:do_it/presentation/widgets/tag_arrow.dart';
import 'package:do_it/utils/app_colors.dart';
import 'package:do_it/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class CreateProjectPage extends ConsumerStatefulWidget {
  const CreateProjectPage({super.key});

  @override
  ConsumerState<CreateProjectPage> createState() => _CreateProjectPageState();
}

class _CreateProjectPageState extends ConsumerState<CreateProjectPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final List<String> _selectedTags = [];
  final List<String> _teamMembers = [];
  DateTime? selectedStartDate;
  DateTime? selectedEndDate;

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  // Functions to select date
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

  // Function to create a project
  Future<void> _createProject() async {
    if (_nameController.text.isEmpty ||
        selectedStartDate == null ||
        selectedEndDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all required fields')),
      );
      return;
    }

    final project = ProjectModel(
      id: const Uuid().v4(),
      name: _nameController.text,
      createdDate: selectedStartDate!,
      endDate: selectedEndDate!,
      teamMembers: _teamMembers,
      tags: _selectedTags,
      description: _descriptionController.text,
    );

    final success = await ref
        .read(projectsProvider.notifier)
        .createProject(project);

    if (success && mounted) {
      Navigator.pop(context);
    } else if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Failed to create project')));
    }
  }

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
                      CircleAvatar(radius: 30, backgroundColor: AppColors.grey),
                      Gap(15),
                      Expanded(
                        child: TransparentTextField(
                          label: 'Project Name',
                          controller: _nameController,
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
                    'Description',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.lightGreyText,
                    ),
                  ),
                  const Gap(7),
                  // Description Text Field
                  ExpandedTextField(controller: _descriptionController),
                  const Gap(22),
                  // Create Project Button
                  CustomElevatedButton(
                    width: double.infinity,
                    label: 'Create Project',
                    onPressed: _createProject,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
