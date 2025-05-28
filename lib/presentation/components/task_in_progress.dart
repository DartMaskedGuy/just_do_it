import 'package:do_it/presentation/components/task_items.dart';
import 'package:do_it/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TaskInProgress extends StatelessWidget {
  const TaskInProgress({super.key});

  @override
  Widget build(BuildContext context) {
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
                      onPressed: () {},
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
                SizedBox(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      // Task Items
                      return const TaskItems();
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
