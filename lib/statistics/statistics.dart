import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../sleep_info/sleep_summary_card.dart';
import 'weekly_bar_chart.dart';

void main() {
  runApp(const Statistics());
}

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  // 오늘부터 이전 6일까지의 요일을 계산
  List<String> getWeekdayLabels() {
    final now = DateTime.now();
    final weekdays = ['월', '화', '수', '목', '금', '토', '일'];
    final today = now.weekday - 1; // 1-7을 0-6으로 변환

    List<String> labels = [];
    for (int i = 6; i >= 0; i--) {
      int dayIndex = (today - i + 7) % 7;
      labels.add(weekdays[dayIndex]);
    }
    return labels;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColors.darkGray,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          scrolledUnderElevation: 0,
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '나의 통계',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: size.width * 0.05,
                color: AppColors.lightGray,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: size.height * 0.07,
              horizontal: size.width * 0.045,
            ),
            child: Column(
              children: [
                const SizedBox(height: 20),
                // 2x2 그리드
                Row(
                  children: [
                    Expanded(
                      child: SleepSummaryCard(
                        title: '일일 섭취량',
                        titleFontSize: 14,
                        children: [
                          const SizedBox(height: 10),
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  '210',
                                  style: TextStyle(
                                    fontSize: size.width * 0.07,
                                    color: AppColors.orange,
                                  ),
                                ),
                                Text(
                                  'mg',
                                  style: TextStyle(
                                    fontSize: size.width * 0.05,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.lightGray,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: SleepSummaryCard(
                        title: '최종 음용시간',
                        titleFontSize: 14,
                        children: [
                          const SizedBox(height: 10),
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  '01:00',
                                  style: TextStyle(
                                    fontSize: size.width * 0.07,
                                    color: AppColors.orange,
                                  ),
                                ),
                                Text(
                                  'A.M.',
                                  style: TextStyle(
                                    fontSize: size.width * 0.05,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.lightGray,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: SleepSummaryCard(
                        title: '평균 수면시간',
                        titleFontSize: 14,
                        children: [
                          const SizedBox(height: 10),
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  '12:00',
                                  style: TextStyle(
                                    fontSize: size.width * 0.07,
                                    color: AppColors.orange,
                                  ),
                                ),
                                Text(
                                  'A.M.',
                                  style: TextStyle(
                                    fontSize: size.width * 0.05,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.lightGray,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: SleepSummaryCard(
                        title: '평균 섭취량',
                        titleFontSize: 14,
                        children: [
                          const SizedBox(height: 10),
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  '05:20',
                                  style: TextStyle(
                                    fontSize: size.width * 0.07,
                                    color: AppColors.orange,
                                  ),
                                ),
                                Text(
                                  'P.M.',
                                  style: TextStyle(
                                    fontSize: size.width * 0.05,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.lightGray,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SleepSummaryCard(
                  title: '주간 카페인 섭취량',
                  titleFontSize: 16,
                  children: [
                    const SizedBox(height: 20),
                    WeeklyBarChart(
                      values: [180, 220, 150, 300, 250, 190, 210],
                      // 7일간 카페인 섭취량 (mg)
                      labels: getWeekdayLabels(), // 동적으로 계산된 요일 라벨
                    ),
                  ],
                ),
                const SizedBox(height: 50), // 하단 여백
              ],
            ),
          ),
        ),
      );
  }
}
