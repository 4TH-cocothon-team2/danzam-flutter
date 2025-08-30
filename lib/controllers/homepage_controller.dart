import 'package:get/get.dart';

import '../dummies/getCaffeineItemDummy.dart';
import '../home/helper/drink_item.dart';

class HomepageController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    loadCaffeineItems();
    loadInforms();
  }

  final RxList<CaffeineItem> drinkedList = <CaffeineItem>[].obs;

  final RxDouble leftCaffeineLevel = 0.0.obs;
  final RxString expectedSleepTime = ''.obs;

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
}
