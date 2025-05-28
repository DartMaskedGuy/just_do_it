import 'package:do_it/presentation/components/dashboard_overview.dart';
import 'package:do_it/presentation/components/task_in_progress.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
