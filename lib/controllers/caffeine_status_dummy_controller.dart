import 'package:Danzam/home/helper/drink_item.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'package:intl/intl.dart';

class CaffeineStatusDummyController extends GetxController {
  Map<String, dynamic> calculateCaffeineStatus({
    required List<CaffeineItem> drinkedList,
    required CaffeineItem newItem,
    required int recommendedCaffeineMg,
  }) {
    // 새로운 수면 추천 시각 계산 방식
    final allItems = [...drinkedList, newItem];
    final now = DateTime.now();
    const halfLife = 5.0; // 시간 단위
    const thresholdPercent = 15.0;
    double totalRemainingMg = 0.0;
    for (final item in allItems) {
      final intakeTime = DateTime.parse('${item.eatDate} ${item.eatTime}');
      final hoursPassed = now.difference(intakeTime).inMinutes / 60.0;
      final decayed = item.caffeine * pow(0.5, hoursPassed / halfLife);
      totalRemainingMg += decayed;
    }
    // 사용자 권장량 기준 잔존 퍼센트로 환산
    final percentRemaining = (totalRemainingMg / recommendedCaffeineMg) * 100;
    DateTime recommendedSleepTime;
    if (percentRemaining <= thresholdPercent) {
      recommendedSleepTime = now;
    } else {
      final tUntilBelow =
          halfLife * log(percentRemaining / thresholdPercent) / log(2);
      recommendedSleepTime = now.add(
        Duration(minutes: (tUntilBelow * 60).round()),
      );
    }
    final sleepTimeStr = DateFormat('HH:mm').format(recommendedSleepTime);
    return {
      'remainingPercent': percentRemaining.toStringAsFixed(1),
      'recommendedSleepTime': sleepTimeStr,
    };
  }
}
