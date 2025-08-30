import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final String unit;
  final Color valueColor;
  final double valueFontSize;
  final double unitFontSize;

  const InfoRow({
    super.key,
    required this.label,
    required this.value,
    required this.unit,
    this.valueColor = const Color(0xFFAB7F55),
    this.valueFontSize = 28,
    this.unitFontSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.045),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: size.height * 0.005),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: valueFontSize * (size.width / 400), // 반응형 크기 조정
                  color: valueColor,
                ),
              ),
              SizedBox(width: size.width * 0.01),
              Text(
                unit,
                style: TextStyle(
                  fontSize: unitFontSize * (size.width / 400), // 반응형 크기 조정
                  fontWeight: FontWeight.bold,
                  color: valueColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
