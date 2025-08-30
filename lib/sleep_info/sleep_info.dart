import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'sleep_summary_card.dart';
import 'info_row.dart';

void main() {
  runApp(const SleepInfo());
}

class SleepInfo extends StatefulWidget {
  const SleepInfo({super.key});

  @override
  State<SleepInfo> createState() => _SleepInfoState();
}

class _SleepInfoState extends State<SleepInfo> {
  double _sliderValue = 5.0; // 기본값 5

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Pretendard',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.lightGray,
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFF333333),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          scrolledUnderElevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '수면 요약',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: size.width * 0.05,
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
                SleepSummaryCard(
                  title: '수면 요약',
                  children: [
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '시작',
                                  style: TextStyle(
                                    fontSize: size.width * 0.04,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.lightGray,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '12:00',
                                      style: TextStyle(
                                        fontSize: size.width * 0.09,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.lightGray,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      'A.M.',
                                      style: TextStyle(
                                        fontSize: size.width * 0.035,
                                        color: AppColors.lightGray,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '종료',
                                  style: TextStyle(
                                    fontSize: size.width * 0.04,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.lightGray,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '07:00',
                                      style: TextStyle(
                                        fontSize: size.width * 0.09,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.lightGray,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      'A.M.',
                                      style: TextStyle(
                                        fontSize: size.width * 0.035,
                                        color: AppColors.lightGray,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    const InfoRow(
                      label: '총 카페인 섭취량',
                      value: '200',
                      unit: 'mg',
                    ),
                    const SizedBox(height: 15),
                    const InfoRow(
                      label: '최초 음용시각',
                      value: '05:20',
                      unit: 'P.M.',
                    ),
                    const SizedBox(height: 15),
                    const InfoRow(
                      label: '수면 전 잔존량',
                      value: '58',
                      unit: 'mg',
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: size.width * 0.075),
                    child: Text(
                      '수면 품질 평가',
                      style: TextStyle(
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.bold,
                        color: AppColors.lightGray,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: const Color(0xFF444448),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: AppColors.orange,
                          inactiveTrackColor: const Color(0xFF444448),
                                                      thumbColor: AppColors.orange,
                                                      overlayColor: AppColors.orange.withOpacity(0.2),
                                                      valueIndicatorColor: AppColors.orange,
                          valueIndicatorTextStyle: const TextStyle(
                            color: AppColors.lightGray,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: Slider(
                          value: _sliderValue,
                          min: 1.0,
                          max: 10.0,
                          divisions: 9,
                          label: _sliderValue.round().toString(),
                          onChanged: (value) {
                            setState(() {
                              _sliderValue = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: size.height * 0.07,
                  child: ElevatedButton(
                    onPressed: () {
                      // 완료 버튼 동작
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD98D4B),
                      foregroundColor: AppColors.lightGray,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      '완료',
                      style: TextStyle(
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.bold,
                        color: AppColors.lightGray,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30), // 하단 여백
              ],
            ),
          ),
        ),
      ),
    );
  }
}