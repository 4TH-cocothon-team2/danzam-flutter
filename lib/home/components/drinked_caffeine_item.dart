import '../helper/drink_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../home_edit.dart';

class DrinkedCaffeineItem extends StatelessWidget {
  final CaffeineItem item;

  const DrinkedCaffeineItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Get.to(() => HomeEdit(item: item));
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: size.height * 0.02,
          horizontal: size.width * 0.04,
        ),
        decoration: BoxDecoration(
          color: Color(0xFF1C1C1E),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                item.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  color: AppColors.lightGray,
                  fontSize: size.width * 0.035,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: size.width * 0.02),
            Text(
              '${item.caffeine}mg',
              style: TextStyle(color: AppColors.lightGray, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
