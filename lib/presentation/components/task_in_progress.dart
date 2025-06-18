import 'package:do_it/notifiers/task_notifier.dart';
import 'package:do_it/presentation/components/task_items.dart';
import 'package:do_it/presentation/screens/add_task_page.dart';
import 'package:do_it/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class TaskInProgress extends ConsumerWidget {
  const TaskInProgress({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(tasksProvider);
    // Get only the first 5 tasks
    final limitedTasks = tasks.take(5).toList();

    return SingleChildScrollView(
      child: SizedBox(
        child: ColoredBox(
          color: const Color(0x1472C0FF),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const Gap(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Task in Progress',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                    TextButton(
                      onPressed:
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddTaskPage(),
                            ),
                          ),
                      child: Text(
                        'See all',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryText,
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(12),
                // Limited Task Items
                SizedBox(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: limitedTasks.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final task = limitedTasks[index];
                      return TaskItems(task: task);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
