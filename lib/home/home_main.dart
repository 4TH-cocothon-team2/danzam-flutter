import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:get/get.dart';

import 'components/drinked_caffeine_item.dart';
import 'home_add.dart';
import '../controllers/homepage_controller.dart';
import '../sleeping/sleeping.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({super.key});

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = Get.find<HomepageController>();

    return Obx(() {
      return Scaffold(
        backgroundColor: Color(0xFF333333),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.07,
                horizontal: size.width * 0.045,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/coffee.svg'),
                            SizedBox(width: size.width * 0.02),
                            Text(
                              '나의 카페인 정보',
                              style: TextStyle(
                                fontSize: size.width * 0.05,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.to(() => HomeAdd());
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(
                              size.width * 0.28,
                              size.height * 0.01,
                            ),
                            backgroundColor: Color(0xFFD98D4B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.005,
                              horizontal: size.width * 0.035,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '추가하기',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.width * 0.0325,
                                ),
                              ),
                              SizedBox(width: size.width * 0.01),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: size.width * 0.045,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.005),
                    (controller.drinkedList.isNotEmpty)
                        ? GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: size.width * 0.04,
                                  mainAxisSpacing: size.width * 0.04,
                                  crossAxisCount: 2,
                                  childAspectRatio: 3,
                                ),
                            itemCount: controller.drinkedList.length,
                            itemBuilder: (context, index) {
                              return DrinkedCaffeineItem(
                                item: controller.drinkedList[index],
                              );
                            },
                          )
                        : Center(
                            child: Text(
                              '추가된 정보가 없습니다',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                    SizedBox(height: size.height * 0.03),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.02,
                        horizontal: size.width * 0.04,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF1C1C1E),
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(size.width * 0.04),
                        child: Column(
                          children: [
                            Text(
                              '체내 잔존량',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: size.height * 0.05),
                            Transform.scale(
                              scale: 1.5,
                              child: SimpleCircularProgressBar(
                                mergeMode: true,
                                animationDuration: 1,
                                progressStrokeWidth: 20,
                                backStrokeWidth: 20,
                                progressColors: [Color(0xFFD98D4B)],
                                backColor: Colors.grey.shade800,
                                onGetText: (double value) {
                                  value = controller.leftCaffeineLevel.value;
                                  return Text(
                                    '${value}%',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: size.width * 0.05,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                },
                                valueNotifier: ValueNotifier(
                                  controller.leftCaffeineLevel.value,
                                ),
                              ),
                            ),
                            SizedBox(height: size.height * 0.05),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),

                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.02,
                        horizontal: size.width * 0.04,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF1C1C1E),
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Column(
                          children: [
                            Text(
                              '예상 수면시간',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: size.height * 0.001),
                            _buildExpectedSleepTime(
                              controller.expectedSleepTime.value,
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: size.height * 0.09), // for bottom spacing
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(size.width * 0.035),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SafeArea(
                  child: SizedBox(
                    height: size.height * 0.07,
                    child: GestureDetector(
                      onTap: () {
                        // 현재 시간과 예상 수면시간 비교 (한국 시간 기준)
                        final now = DateTime.now().toUtc().add(
                          const Duration(hours: 9),
                        );
                        final currentTime =
                            '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';

                        // 예상 수면시간이 현재 시간보다 이전이면 Sleeping 화면으로 이동
                        if (_isTimeAfter(
                          currentTime,
                          controller.expectedSleepTime.value,
                        )) {
                          Get.to(() => const Sleeping());
                        } else {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text('저장되었습니다')));
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.02,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFD98D4B),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Text(
                          '저장',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width * 0.045,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  // 시간 비교 메서드
  bool _isTimeAfter(String time1, String time2) {
    final parts1 = time1.split(':');
    final parts2 = time2.split(':');

    final hour1 = int.parse(parts1[0]);
    final minute1 = int.parse(parts1[1]);
    final hour2 = int.parse(parts2[0]);
    final minute2 = int.parse(parts2[1]);

    final totalMinutes1 = hour1 * 60 + minute1;
    final totalMinutes2 = hour2 * 60 + minute2;

    return totalMinutes1 > totalMinutes2;
  }

  // 예상 수면 시간 박스
  Widget _buildExpectedSleepTime(String expectedSleepTime) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.015),
      padding: EdgeInsets.symmetric(
        vertical: size.height * 0.005,
        horizontal: size.width * 0.05,
      ),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Color(0xFFD98D4B), width: 1.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.access_time,
            color: Color(0xFFD98D4B),
            size: size.width * 0.05,
          ),
          SizedBox(width: size.width * 0.025),
          Text(
            '${expectedSleepTime}',
            style: TextStyle(
              color: Colors.white,
              fontSize: size.width * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
