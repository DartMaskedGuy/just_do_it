import 'package:do_it/notifiers/auth_notifier.dart';
import 'package:do_it/presentation/screens/home_page.dart';
import 'package:do_it/presentation/screens/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthWrapper extends ConsumerWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return authState.when(
      data: (user) => user != null ? const HomePage() : const SignInPage(),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => const SignInPage(),
    );
  }
}
