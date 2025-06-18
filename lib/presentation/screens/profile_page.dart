import 'package:do_it/notifiers/auth_notifier.dart';
import 'package:do_it/notifiers/project_notifier.dart';
import 'package:do_it/notifiers/task_notifier.dart';
import 'package:do_it/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(authStateProvider);

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Account Page'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
          IconButton(
            onPressed: () async {
              final confirm = await showDialog<bool>(
                context: context,
                builder:
                    (context) => AlertDialog(
                      title: const Text('Clear All Data?'),
                      content: const Text(
                        'This will delete all projects and tasks. This cannot be undone.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: const Text('Clear All'),
                        ),
                      ],
                    ),
              );

              if (confirm == true) {
                await ref.read(projectsProvider.notifier).deleteAllProjects();
                await ref.read(tasksProvider.notifier).deleteAllTasks();
              }
            },
            icon: const Icon(Icons.delete_forever),
          ),
        ],
      ),
      body: ListView(
        children: [
          // User Details Section
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: userState.when(
              data:
                  (user) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.person),
                          Gap(5),
                          Text(
                            'Profile Information',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Gap(16),
                      _buildInfoRow('Name', user?.name ?? 'N/A'),
                      const Gap(12),
                      _buildInfoRow('Email', user?.email ?? 'N/A'),
                      const Gap(12),
                      _buildInfoRow('Phone', user?.phone ?? 'N/A'),
                    ],
                  ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error:
                  (error, _) =>
                      Center(child: Text('Error: ${error.toString()}')),
            ),
          ),
          const Gap(30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () async {
                final shouldLogout = await showDialog<bool>(
                  context: context,
                  builder:
                      (context) => AlertDialog(
                        title: const Text('Logout'),
                        content: const Text('Are you sure you want to logout?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, false),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, true),
                            child: const Text('Logout'),
                          ),
                        ],
                      ),
                );

                if (shouldLogout ?? false) {
                  await ref.read(authStateProvider.notifier).logout();
                  if (context.mounted) {
                    Navigator.pushReplacementNamed(context, AppRoutes.signIn);
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.redAccent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Logout', style: TextStyle(color: Colors.white)),
                  Gap(5),
                  Icon(Icons.logout, color: Colors.white),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 55,
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Gap(16),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
