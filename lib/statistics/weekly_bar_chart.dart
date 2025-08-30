import 'package:flutter/material.dart';

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
    final maxValue = values.reduce((a, b) => a > b ? a : b);
    
    return Column(
      children: [
        // 막대 그래프
        SizedBox(
          height: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(values.length, (index) {
              final height = (values[index] / maxValue) * 95;
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 25,
                    height: height,
                    decoration: BoxDecoration(
                      color: const Color(0xFFAB7F55),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    values[index].toInt().toString(),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFFE7E6E3),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
        const SizedBox(height: 10),
        // 날짜 라벨
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: labels.map((label) => 
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFFE7E6E3),
              ),
            ),
          ).toList(),
        ),
      ],
    );
  }
}
