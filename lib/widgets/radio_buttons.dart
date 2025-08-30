import 'package:flutter/material.dart';
import '../constants/colors.dart';

Widget radioItem<T>({
  required T value,
  required T? groupValue,
  required ValueChanged<T?> onChanged,
  required String label,
  double gap = 16,
  EdgeInsetsGeometry margin = EdgeInsets.zero,
  double scale = 1.0,
  Color selectedColor = AppColors.orange,
  Color unselectedBorderColor = AppColors.lightGray,
  TextStyle textStyle = const TextStyle(
    fontFamily: 'Pretendard-Regular',
    fontSize: 14,
          color: AppColors.lightGray,
  ),
}) {
  final fill = MaterialStateProperty.resolveWith<Color?>(
        (states) => states.contains(MaterialState.selected)
        ? selectedColor
        : unselectedBorderColor,
  );

  return Padding(
    padding: margin,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Transform.scale(
          scale: scale,
          child: Radio<T>(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
            fillColor: fill,
            visualDensity: VisualDensity.compact,
          ),
        ),
        SizedBox(width: gap),
        Text(label, style: textStyle),
      ],
    ),
  );
}
