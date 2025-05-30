import 'package:do_it/presentation/screens/add_task_form.dart';
import 'package:do_it/presentation/screens/add_task_page.dart';
import 'package:do_it/presentation/screens/create_account_page.dart';
import 'package:do_it/presentation/screens/create_project_page.dart';
import 'package:do_it/presentation/screens/home_page.dart';
import 'package:do_it/presentation/screens/main_page.dart';
import 'package:do_it/presentation/screens/sign_in_page.dart';
import 'package:do_it/presentation/screens/onboarding_page.dart';
import 'package:do_it/presentation/screens/splash_screen.dart';

class AppRoutes {
  static final pages = {
    splashScreen: (context) => const SplashScreen(),
    onboardingPage: (context) => const OnboardingPage(),
    createAccount: (context) => const CreateAccountPage(),
    signIn: (context) => const SignInPage(),
    mainPage: (context) => const MainPage(),
    home: (context) => const HomePage(),
    createProject: (context) => const CreateProjectPage(),
    addTaskForm: (context) => const AddTaskForm(),
    addTaskPage: (context) => const AddTaskPage(),
  };

  // App Routes
  static const splashScreen = '/';
  static const onboardingPage = 'onboardingPage';
  static const createAccount = 'createAccount';
  static const signIn = 'signIn';
  static const mainPage = 'mainPage';
  static const home = 'home';
  static const createProject = 'createProject';
  static const addTaskForm = 'addTaskForm';
  static const addTaskPage = 'addTaskPage';
}
