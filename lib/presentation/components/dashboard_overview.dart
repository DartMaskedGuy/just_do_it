import 'package:do_it/notifiers/project_notifier.dart';
import 'package:do_it/notifiers/task_notifier.dart';
import 'package:do_it/utils/app_colors.dart';
import 'package:do_it/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class DashboardOverview extends ConsumerWidget {
  const DashboardOverview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get projects and tasks from providers
    final projects = ref.watch(projectsProvider);
    final tasks = ref.watch(tasksProvider);

    // Calculate different task counts
    final completedTasks =
        tasks
            .where(
              (task) => task.endDate.difference(DateTime.now()).inDays <= 0,
            )
            .length;

    final overdueTasks =
        tasks
            .where(
              (task) =>
                  task.endDate.isBefore(DateTime.now()) && !task.isCompleted,
            )
            .length;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const Gap(16),
          SizedBox(
            child: GridView(
              controller: ScrollController(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 153 / 128,
              ),
              children: [
                // Dashboard Cards
                _buildDashboardCard(
                  bgColor: const Color(0xFFFAF3E0),
                  iconBgColor: const Color(0xFFF7A325),
                  title: 'Projects',
                  count: projects.length.toString(),
                  svg: AppIcons.icCheckmark,
                  iconColor: AppColors.white,
                ),
                _buildDashboardCard(
                  bgColor: const Color(0xFFF4F9FF),
                  iconBgColor: const Color(0xFF217AC0),
                  title: 'Tasks',
                  count: tasks.length.toString(),
                  svg: AppIcons.icTaskList,
                  iconColor: AppColors.white,
                ),
                _buildDashboardCard(
                  bgColor: const Color(0xFFE9FFF0),
                  iconBgColor: const Color(0xFF12B76A),
                  title: 'Completed Task',
                  count: completedTasks.toString(),
                  svg: AppIcons.icCheck,
                  iconColor: AppColors.white,
                ),
                _buildDashboardCard(
                  bgColor: const Color(0xFFF4F1F6),
                  iconBgColor: const Color(0xFFD1D1D1),
                  title: 'Overdue Task',
                  count: overdueTasks.toString(),
                  svg: AppIcons.icTaskRemove,
                  iconColor: AppColors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Dashboard Card
  Widget _buildDashboardCard({
    required Color bgColor,
    required Color iconBgColor,
    required Color iconColor,
    required String title,
    required String count,
    required String svg,
  }) {
    return Container(
      width: double.infinity,
      height: 128,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: iconBgColor,
                child: SvgPicture.asset(
                  svg,
                  colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                  fit: BoxFit.contain,
                  width: 18,
                ),
              ),
              const Gap(10),
              Text(
                count,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
