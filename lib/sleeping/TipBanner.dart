import 'package:flutter/material.dart';

class TipBanner extends StatelessWidget {
  const TipBanner({
    super.key,
    this.text = '커피를 안마셨으면 이미 잠들었을겁니다...',
    this.icon = Icons.lightbulb_outline,
    this.bg = const Color(0xFF333333),
    this.stroke = const Color(0xFFC8864F), // 주황동 느낌
  });

  final String text;
  final IconData icon;
  final Color bg;
  final Color stroke;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.8,
        maxHeight: 80,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // 본체(라운드 보더)
          Container(
            padding: const EdgeInsets.fromLTRB(24, 28, 24, 24), // 상단 아이콘 공간 확보
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: stroke, width: 1),
            ),
            child: Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: Color(0xFFE7E6E3),
                  fontFamily: 'GowunBatang',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

          // 상단 라인을 덮는 4각형
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 80,
                height: 3,
                color: bg,
              ),
            ),
          ),

          // 상단 중앙 아이콘(보더 위에 살짝 겹치게)
          Positioned(
            top: -18,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'assets/images/tabler_bulb.png',
                width: 36,
                height: 36,
                color: stroke,
              ),
            ),
          ),
        ],
      ),
    );
  }
}