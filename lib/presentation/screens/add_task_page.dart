import 'package:do_it/models/task_model.dart';
import 'package:do_it/notifiers/task_notifier.dart';
import 'package:do_it/presentation/components/custom_back_button.dart';
import 'package:do_it/presentation/screens/edit_task_page.dart';
import 'package:do_it/presentation/widgets/circular_progress.dart';
import 'package:do_it/utils/app_colors.dart';
import 'package:do_it/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class AddTaskPage extends ConsumerWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(tasksProvider);

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
                  const CustomBackButton(),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Notice'),
                            content: const Text(
                              'Click on the task item itself, it will take you to the edit page. \n\nThank you!',
                            ),
                            actions: [
                              TextButton(
                                onPressed:
                                    () => Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) => const AddTaskPage(),
                                      ),
                                    ),
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.white,
                    ),
                    icon: Icon(Icons.edit, color: AppColors.greyText),
                  ),
                ],
              ),
              const Gap(12),
              Text(
                'Add task',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              const Gap(16),
              Expanded(
                child:
                    tasks.isEmpty
                        ? const Center(child: Text('No tasks yet'))
                        : ListView.builder(
                          shrinkWrap: true,
                          itemCount: tasks.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final task = tasks[index];
                            return _buildTaskList(context, task);
                          },
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Task List Widget
  Widget _buildTaskList(BuildContext context, TaskModel task) {
    // Calculate progress
    final now = DateTime.now();
    final totalDuration = task.endDate.difference(task.createdDate).inDays;
    final remainingDays = task.endDate.difference(now).inDays;

    // Calculated progress (reverse it so it counts down)
    double progress = 1.0;
    if (totalDuration > 0) {
      progress = remainingDays / totalDuration;
      // Ensure progress stays between 0 and 1
      progress = progress.clamp(0.0, 1.0);
    }

    return GestureDetector(
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditTaskPage(task: task)),
          ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
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
                Text(
                  task.name,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color:
                        task.endDate.difference(DateTime.now()).inDays <= 0
                            ? Colors.red
                            : const Color(0xFF58028C),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Text(
                    task.endDate.difference(DateTime.now()).inDays <= 0
                        ? 'Ended'
                        : '${task.endDate.difference(DateTime.now()).inDays}d',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
            const Gap(6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Team members',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: AppColors.greyText,
                      ),
                    ),
                    const Gap(6),
                    Row(
                      children: [
                        _teamMemberAvatar(image: AppIcons.avatar1),
                        const Gap(6),
                        _teamMemberAvatar(image: AppIcons.avatar2),
                        const Gap(6),
                        _teamMemberAvatar(image: AppIcons.avatar3),
                      ],
                    ),
                    const Gap(12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: const Color(0x3EF44336),
                          child: SvgPicture.asset(
                            AppIcons.icCalender,
                            colorFilter: ColorFilter.mode(
                              Colors.red,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        const Gap(8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
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
                              DateFormat('dd-MM-yyyy').format(task.createdDate),
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
                          crossAxisAlignment: CrossAxisAlignment.end,
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
                              DateFormat('dd-MM-yyyy').format(task.endDate),
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
                  ],
                ),
                CircularProgress(progress: progress),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Team member avatar widget
  Widget _teamMemberAvatar({required String image}) {
    return CircleAvatar(
      radius: 15,
      backgroundColor: AppColors.grey,
      child: Image.asset(
        image,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
