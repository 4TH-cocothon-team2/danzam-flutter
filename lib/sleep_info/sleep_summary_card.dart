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
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
              title,
              style: TextStyle(
                fontSize: titleFontSize,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFE7E6E3),
              ),
            ),
            ),
            const SizedBox(height: 10),
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
