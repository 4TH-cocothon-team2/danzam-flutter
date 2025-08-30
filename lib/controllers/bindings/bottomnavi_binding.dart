import '../bottom_navigation_controller.dart';
import 'package:get/get.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavigationController(), permanent: true);
  }
}
