import 'package:flutter/material.dart';

Widget radioItem<T>({
  required T value,
  required T? groupValue,
  required ValueChanged<T?> onChanged,
  required String label,
  double gap = 16,
  EdgeInsetsGeometry margin = EdgeInsets.zero,
  double scale = 1.0,
  Color selectedColor = const Color(0xffA86A3A),
  Color unselectedBorderColor = const Color(0xffE7E6E3),
  TextStyle textStyle = const TextStyle(
    fontFamily: 'Pretendard-Regular',
    fontSize: 14,
    color: Color(0xffE7E6E3),
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
