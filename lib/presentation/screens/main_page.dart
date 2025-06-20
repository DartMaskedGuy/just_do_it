import 'package:do_it/presentation/screens/home_page.dart';
import 'package:do_it/presentation/screens/profile_page.dart';
import 'package:do_it/presentation/screens/projects_page.dart';
import 'package:do_it/utils/app_colors.dart';
import 'package:do_it/utils/app_icons.dart';
import 'package:do_it/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<String> labels = ['Home', 'Project', 'Profile'];

  final List<String> iconOutlined = [
    AppIcons.icHome,
    AppIcons.icCheckmark,
    AppIcons.icUser,
  ];

  final List<String> iconFilled = [
    AppIcons.icHomeFill,
    AppIcons.icCheckmarkFill,
    AppIcons.icUser,
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          _currentIndex == 0
              ? Padding(
                padding: const EdgeInsets.only(bottom: 35),
                child: SizedBox(
                  width: 70,
                  height: 70,
                  child: FloatingActionButton(
                    elevation: 0,
                    onPressed:
                        () => Navigator.pushNamed(
                          context,
                          AppRoutes.createProject,
                        ),
                    heroTag: 'createProject',
                    tooltip: 'Create Project',
                    shape: CircleBorder(
                      side: BorderSide(color: AppColors.white, width: 7),
                    ),
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.white,
                    splashColor: Colors.transparent,
                    highlightElevation: 0,
                    child: const Icon(Icons.add),
                  ),
                ),
              )
              : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        backgroundColor: const Color(0x1472C0FF),
        elevation: 0,
        iconSize: 24,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: List.generate(
          labels.length,
          (index) => BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _currentIndex == index ? iconFilled[index] : iconOutlined[index],
            ),
            label: labels[index],
          ),
        ),
      ),
      body: pages[_currentIndex],
    );
  }
}

// Main pages of the app
final List<Widget> pages = const [HomePage(), ProjectsPage(), ProfilePage()];
