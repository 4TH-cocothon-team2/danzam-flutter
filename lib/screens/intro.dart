import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import '../constants/colors.dart';
import '../app_shell.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Get.off(
            () => const AppShell(),
        transition: Transition.rightToLeft,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOutCubic,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff333333),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png'),
            Text('단잠',
              style: TextStyle(
                fontFamily: 'GowunBatang-Bold',
                color: AppColors.lightGray,
                fontSize: 64,
              ),
            ),
            Text('카페인 관리를 통한 수면 밸런스',
              style: TextStyle(
                fontFamily: 'GowunBatang-Regular',
                color: AppColors.lightGray,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
