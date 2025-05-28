import 'package:do_it/presentation/components/dashboard_overview.dart';
import 'package:do_it/presentation/components/task_in_progress.dart';
import 'package:do_it/utils/app_colors.dart';
import 'package:do_it/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: SizedBox(
          width: 70,
          height: 70,
          child: FloatingActionButton(
            elevation: 0,
            onPressed:
                () => Navigator.pushNamed(context, AppRoutes.createProject),
            heroTag: 'createProject',
            tooltip: 'Create Project',
            shape: CircleBorder(
              side: BorderSide(color: AppColors.white, width: 7),
            ),
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.white,
            splashColor: Colors.transparent,
            child: const Icon(Icons.add),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Dashboard Overview Section
              const DashboardOverview(),
              const Gap(28),
              // Task in Progress Section
              const TaskInProgress(),
            ],
          ),
        ),
      ),
    );
  }
}
