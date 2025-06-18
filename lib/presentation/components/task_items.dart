import 'package:do_it/models/task_model.dart';
import 'package:do_it/presentation/widgets/circular_progress.dart';
import 'package:do_it/utils/app_colors.dart';
import 'package:do_it/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class TaskItems extends ConsumerWidget {
  final TaskModel task;

  const TaskItems({super.key, required this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

    return Container(
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
                          : AppColors.primary,
                  borderRadius: BorderRadius.circular(4),
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
                            '27-3-2022',
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
                            '27-3-2022',
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
