import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import '../controllers/bottom_navigation_controller.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BottomNavigationController>();

    return Obx(
      () => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(height: 1.0, color: AppColors.lightGray),
          BottomNavigationBar(
            backgroundColor: AppColors.darkGray,
            selectedItemColor: AppColors.orange,
            unselectedItemColor: AppColors.lightGray,
            selectedIconTheme: IconThemeData(size: 24),
            unselectedIconTheme: IconThemeData(size: 24),
            selectedLabelStyle: TextStyle(fontSize: 12),
            unselectedLabelStyle: TextStyle(fontSize: 12),
            currentIndex: controller.selectedIndex.value,
            onTap: controller.changeTab,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: '홈',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: '통계'),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined),
                label: '설정',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
