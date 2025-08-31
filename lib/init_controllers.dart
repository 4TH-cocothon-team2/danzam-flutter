import 'controllers/caffeine_status_dummy_controller.dart';
import 'controllers/homepage_controller.dart';
import 'package:get/get.dart';

void initControllers() {
  Get.put(CaffeineStatusDummyController());
  Get.put(HomepageController());
}
