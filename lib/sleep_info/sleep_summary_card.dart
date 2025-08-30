import 'package:flutter/material.dart';

class SleepSummaryCard extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final double titleFontSize;

  const SleepSummaryCard({
    super.key,
    required this.title,
    required this.children,
    this.titleFontSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
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
        padding: EdgeInsets.symmetric(
          vertical: size.height * 0.02,
          horizontal: size.width * 0.04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: titleFontSize * (size.width / 400), // 반응형 크기 조정
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Container(
              width: double.infinity,
              height: 1,
              color: const Color(0xFF444448),
            ),
            ...children,
          ],
        ),
      ),
    );
  }
}
