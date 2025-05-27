import 'package:do_it/presentation/screens/create_account_page.dart';
import 'package:do_it/presentation/screens/home_page.dart';
import 'package:do_it/presentation/screens/main_page.dart';
import 'package:do_it/presentation/screens/sign_in_page.dart';
import 'package:do_it/presentation/screens/onboarding_page.dart';

class AppRoutes {
  static final pages = {
    onboardingPage: (context) => const OnboardingPage(),
    createAccount: (context) => const CreateAccountPage(),
    signIn: (context) => const SignInPage(),
    mainPage: (context) => const MainPage(),
    home: (context) => const HomePage(),
  };

  // App Routes
  static const onboardingPage = '/';
  static const createAccount = 'createAccount';
  static const signIn = 'signIn';
  static const mainPage = 'mainPage';
  static const home = 'home';
}
