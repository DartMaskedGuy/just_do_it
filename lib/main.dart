import 'package:do_it/notifiers/auth_notifier.dart';
import 'package:do_it/repo/auth_repo.dart';
import 'package:do_it/utils/app_colors.dart';
import 'package:do_it/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        authRepositoryProvider.overrideWithValue(AuthRepository(prefs)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: AppColors.white),
      initialRoute: AppRoutes.splashScreen,
      routes: AppRoutes.pages,
    );
  }
}
