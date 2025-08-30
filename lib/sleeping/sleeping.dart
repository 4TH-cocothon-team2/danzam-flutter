import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:math' as math;
import 'package:get/get.dart';
import 'TipBanner.dart';
import '../home/home_main.dart';

void main() {
  runApp(const Sleeping());
}

class Sleeping extends StatefulWidget {
  const Sleeping({super.key});

  @override
  State<Sleeping> createState() => _SleepingState();
}

class _SleepingState extends State<Sleeping> with TickerProviderStateMixin {
  late AnimationController _rotationController1;
  late AnimationController _rotationController2;
  late AnimationController _groupRotationController;

  @override
  void initState() {
    super.initState();
    _rotationController1 = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    )..repeat();
    _rotationController2 = AnimationController(
      duration: const Duration(milliseconds: 3500),
      vsync: this,
    )..repeat();
    _groupRotationController = AnimationController(
      duration: const Duration(milliseconds: 6500),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _rotationController1.dispose();
    _rotationController2.dispose();
    _groupRotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF333333),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          scrolledUnderElevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFFE7E6E3)),
            onPressed: () {
              Get.off(() => const HomeMain());
            },
          ),
        ),
        body: Stack(
          children: [
            // 동그라미를 화면 중앙에 배치
            Center(
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFB3ABA3),
                  ),
                ),
              ),
            ),
            // 양들을 배치 (Stack을 Center 밖으로 이동) - 그룹 전체 회전
            Center(
              child: AnimatedBuilder(
                animation: _groupRotationController,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _groupRotationController.value * 2 * math.pi,
                    child: Stack(
                      children: [
                        // 첫 번째 양 (원의 오른쪽 상단 끝쪽에 배치) - 회전
                        Positioned(
                          left: MediaQuery.of(context).size.width / 2,
                          top: MediaQuery.of(context).size.height / 2 - 100,
                          child: AnimatedBuilder(
                            animation: _rotationController1,
                            builder: (context, child) {
                              return Transform.rotate(
                                angle:
                                    -_rotationController1.value * 2 * math.pi,
                                child: Image.asset(
                                  'assets/images/sheep.png',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.contain,
                                ),
                              );
                            },
                          ),
                        ),
                        // 두 번째 양 (원의 왼쪽 하단 끝쪽에 배치) - 회전 애니메이션
                        Positioned(
                          left: MediaQuery.of(context).size.width / 2 - 75,
                          top: MediaQuery.of(context).size.height / 2 + 25,
                          child: AnimatedBuilder(
                            animation: _rotationController2,
                            builder: (context, child) {
                              return Transform.rotate(
                                angle: _rotationController2.value * 2 * math.pi,
                                child: Image.asset(
                                  'assets/images/sheep.png',
                                  width: 129,
                                  height: 129,
                                  fit: BoxFit.contain,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // 텍스트를 화면 상단에서 10% 지점에 배치
            Positioned(
              top: MediaQuery.of(context).size.height * 0.1,
              left: 0,
              right: 0,
              child: Text(
                '이제 잠들 시간입니다..\n단잠에 빠져보세요',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'GowunBatang',
                ),
              ),
            ),
            // 텍스트를 화면 하단에 배치
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: const TipBanner(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
