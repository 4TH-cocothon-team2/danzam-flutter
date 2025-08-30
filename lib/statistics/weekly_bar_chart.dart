import 'package:flutter/material.dart';
import '../constants/colors.dart';

class WeeklyBarChart extends StatelessWidget {
  final List<double> values;
  final List<String> labels;

  const WeeklyBarChart({
    super.key,
    required this.values,
    required this.labels,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final maxValue = values.reduce((a, b) => a > b ? a : b);
    
    return Column(
      children: [
        // 막대 그래프
        SizedBox(
          height: size.height * 0.18,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(values.length, (index) {
              final height = (values[index] / maxValue) * (size.height * 0.12);
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: size.width * 0.06,
                    height: height,
                    decoration: BoxDecoration(
                      color: AppColors.orange,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Text(
                    values[index].toInt().toString(),
                    style: TextStyle(
                      fontSize: size.width * 0.03,
                      color: AppColors.lightGray,
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
        SizedBox(height: size.height * 0.01),
        // 날짜 라벨
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: labels.map((label) => 
            Text(
              label,
              style: TextStyle(
                fontSize: size.width * 0.03,
                color: AppColors.lightGray,
              ),
            ),
          ).toList(),
        ),
      ],
    );
  }
}
