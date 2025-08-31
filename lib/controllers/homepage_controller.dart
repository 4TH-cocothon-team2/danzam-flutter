import 'package:get/get.dart';

import '../dummies/getCaffeineItemDummy.dart';
import '../home/helper/drink_item.dart';
import 'caffeine_status_dummy_controller.dart';

class HomepageController extends GetxController {
  final caffeineDummyController = Get.find<CaffeineStatusDummyController>();

  @override
  void onInit() {
    super.onInit();

    // loadCaffeineItems();
    // loadInforms();
  }

  final RxList<CaffeineItem> drinkedList = <CaffeineItem>[].obs;
  final int recommendedCaffeineMg = 400;

  final RxDouble leftCaffeineLevel = 0.0.obs;
  final RxString expectedSleepTime = '00:00'.obs;

  void loadCaffeineItems() {
    final items = responseJson
        .map((json) => CaffeineItem.fromMap(json))
        .toList();
    drinkedList.assignAll(items);
  }

  void loadInforms() {
    leftCaffeineLevel.value = 70.6;
    expectedSleepTime.value = '05:00';
  }

  void updateInforms(CaffeineItem newItem) {
    final Map<String, dynamic> result = caffeineDummyController
        .calculateCaffeineStatus(
          drinkedList: drinkedList.value,
          newItem: newItem,
          recommendedCaffeineMg: recommendedCaffeineMg,
        );

    leftCaffeineLevel.value = double.parse(result['remainingPercent']);
    expectedSleepTime.value = result['recommendedSleepTime'];
  }

  void updateEditedInforms(CaffeineItem newItem) {
    final Map<String, dynamic> result = caffeineDummyController
        .calculateCaffeineStatus(
          drinkedList: drinkedList.value,
          newItem: newItem,
          recommendedCaffeineMg: recommendedCaffeineMg,
        );

    leftCaffeineLevel.value = double.parse(result['remainingPercent']);
    expectedSleepTime.value = result['recommendedSleepTime'];
  }
}
