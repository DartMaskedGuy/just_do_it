import 'package:do_it/notifiers/auth_notifier.dart';
import 'package:do_it/presentation/components/dashboard_overview.dart';
import 'package:do_it/presentation/components/task_in_progress.dart';
import 'package:do_it/utils/app_colors.dart';
import 'package:do_it/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the current user's name from SharedPreferences
    final userName = ref.watch(
      authStateProvider.select((state) => state.valueOrNull?.name ?? 'User'),
    );

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: false,
            backgroundColor: Colors.white,
            elevation: 0,
            scrolledUnderElevation: 0,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Hi $userName 👋',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                Text(
                  'Welcome onboard',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryText,
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {},
                style: IconButton.styleFrom(
                  backgroundColor: const Color(0xFFECF1FF),
                ),
                icon: Badge(
                  backgroundColor: Colors.red,
                  smallSize: 10,
                  child: SvgPicture.asset(
                    AppIcons.icNotification,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
