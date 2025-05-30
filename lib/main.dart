import 'package:do_it/utils/app_colors.dart';
import 'package:do_it/utils/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: AppColors.white),
      darkTheme: ThemeData.dark(),
      initialRoute: AppRoutes.splashScreen,
      routes: AppRoutes.pages,
    );
  }
}
