import 'package:flutter/material.dart';
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
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Pretendard',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: Color(0xFFE7E6E3),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFF333333),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '수면 요약',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
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
                              const Text(
                                '시작',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFE7E6E3),
                                ),
                              ),
                              Row(
                                children: [
                                  const Text(
                                    '12:00',
                                    style: TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFE7E6E3),
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  const Text(
                                    'A.M.',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFFE7E6E3),
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
                              const Text(
                                '종료',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFE7E6E3),
                                ),
                              ),
                              Row(
                                children: [
                                  const Text(
                                    '07:00',
                                    style: TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFE7E6E3),
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  const Text(
                                    'A.M.',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFFE7E6E3),
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
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: const Text(
                    '수면 품질 평가',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFE7E6E3),
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
                        activeTrackColor: const Color(0xFFAB7F55),
                        inactiveTrackColor: const Color(0xFF444448),
                        thumbColor: const Color(0xFFAB7F55),
                        overlayColor: const Color(0xFFAB7F55).withOpacity(0.2),
                        valueIndicatorColor: const Color(0xFFAB7F55),
                        valueIndicatorTextStyle: const TextStyle(
                          color: Color(0xFFE7E6E3),
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
              const Spacer(), // 하단으로 밀어내기 위한 공간
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // 완료 버튼 동작
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFAD7041),
                      foregroundColor: const Color(0xFFE7E6E3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      '완료',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFE7E6E3),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}