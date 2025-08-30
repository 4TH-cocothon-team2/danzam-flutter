import 'settings_page.dart';
import 'statistic_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/bottom_nav_bar.dart';
import 'controllers/bottom_navigation_controller.dart';
import 'home/home_main.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key});

  final List<Widget> _pages = const [
    HomeMain(),
    StatisticPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BottomNavigationController>();
    return Obx(
      () => Scaffold(
        body: _pages[controller.selectedIndex.value],
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }
}
