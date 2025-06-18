import 'package:do_it/models/project_model.dart';
import 'package:do_it/notifiers/project_notifier.dart';
import 'package:do_it/presentation/components/custom_back_button.dart';
import 'package:do_it/presentation/components/outlined_elevated_button.dart';
import 'package:do_it/presentation/screens/add_task_form.dart';
import 'package:do_it/presentation/screens/add_task_page.dart';
import 'package:do_it/presentation/screens/create_project_page.dart';
import 'package:do_it/utils/app_colors.dart';
import 'package:do_it/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class ProjectsPage extends ConsumerWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(projectsProvider);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back Button
                  CustomBackButton(),
                  // Create Project Button
                  OutlinedElevatedButton(
                    label: 'Create Project',
                    onPressed:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CreateProjectPage(),
                          ),
                        ),
                  ),
                ],
              ),
              const Gap(12),
              Text(
                'Projects',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              const Gap(16),
              Expanded(
                child:
                    projects.isEmpty
                        ? const Center(child: Text('No projects yet'))
                        : ListView.builder(
                          shrinkWrap: true,
                          itemCount: projects.length,
                          itemBuilder: (context, index) {
                            final project = projects[index];
                            return buildProjectsList(context, project);
                          },
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Builds a list of project items
  Widget buildProjectsList(BuildContext context, ProjectModel project) {
    return GestureDetector(
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTaskPage()),
          ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.white,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      child: Image.asset(AppIcons.liberty, fit: BoxFit.cover),
                    ),
                    const Gap(10),
                    Text(
                      project.name,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color:
                        project.endDate.difference(DateTime.now()).inDays <= 0
                            ? Colors.red
                            : const Color(0xFF009A49),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Text(
                    project.endDate.difference(DateTime.now()).inDays <= 0
                        ? 'Ended'
                        : '${project.endDate.difference(DateTime.now()).inDays}d',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
            const Gap(11),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Start',
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w400,
                            color: Colors.red,
                          ),
                        ),
                        Text(
                          DateFormat('dd-MM-yyyy').format(project.createdDate),
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                    const Gap(14),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'End',
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w400,
                            color: Colors.green,
                          ),
                        ),
                        Text(
                          DateFormat('dd-MM-yyyy').format(project.endDate),
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                // Add Task Button
                SizedBox(
                  height: 24,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 19,
                        vertical: 2,
                      ),
                      backgroundColor: Colors.transparent,
                      foregroundColor: AppColors.primaryText,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      side: BorderSide(color: AppColors.primary, width: 0.5),
                    ),
                    onPressed:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddTaskForm(),
                          ),
                        ),
                    child: Text(
                      'Add Task',
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryText,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
