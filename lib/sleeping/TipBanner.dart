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
    final size = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: size.width * 0.8,
        maxHeight: size.height * 0.07,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // 본체(라운드 보더)
          Container(
            padding: EdgeInsets.fromLTRB(
              size.width * 0.04, 
              size.height * 0.02, 
              size.width * 0.04, 
              size.height * 0.02
            ),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(13),
              border: Border.all(color: stroke, width: 1),
            ),
            child: Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: size.width * 0.0325,
                  height: 1.5,
                  color: Colors.white,
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
                width: size.width * 0.2,
                height: 3,
                color: bg,
              ),
            ),
          ),

          // 상단 중앙 아이콘(보더 위에 살짝 겹치게)
          Positioned(
            top: -size.width * 0.045,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'assets/images/tabler_bulb.png',
                width: size.width * 0.09,
                height: size.width * 0.09,
                color: stroke,
              ),
            ),
          ),
        ],
      ),
    );
  }
}