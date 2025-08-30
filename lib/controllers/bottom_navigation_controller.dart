import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  // 현재 선택된 탭 인덱스
  var selectedIndex = 0.obs;

  // 탭 변경 메서드
  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
