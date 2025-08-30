import 'package:flutter/material.dart';
import '../constants/colors.dart';

class HomeAdd extends StatefulWidget {
  const HomeAdd({super.key});

  @override
  State<HomeAdd> createState() => _HomeAddState();
}

class _HomeAddState extends State<HomeAdd> {
  final _nameController = TextEditingController();
  final _countController = TextEditingController();
  final _volumeController = TextEditingController();
  final _caffeineController = TextEditingController();
  DateTime? _selectedTime;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.darkGray,
      appBar: null,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05,
          vertical: size.height * 0.06,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '카페인 정보 등록하기',
              style: TextStyle(
                fontSize: size.width * 0.045,
                color: Colors.white,
              ),
            ),
            SizedBox(height: size.height * 0.04),
            _buildInputRow(
              label: '이름',
              hintText: '아이스 아메리카노',
              controller: _nameController,
              context: context,
            ),
            _buildInputRow(
              label: '개수',
              hintText: '1잔',
              controller: _countController,
              context: context,
            ),
            _buildInputRow(
              label: '용량',
              hintText: '350ml',
              controller: _volumeController,
              context: context,
            ),
            _buildInputRow(
              label: '카페인 함유량',
              hintText: '150mg',
              controller: _caffeineController,
              context: context,
            ),
            SizedBox(height: size.height * 0.01),
            _buildTimePickerRow('섭취 시간', size),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.02,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size.width * 0.03),
                        border: Border.all(color: Colors.white),
                        color: Colors.transparent,
                      ),
                      child: Text(
                        '취소',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width * 0.045,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: size.width * 0.04),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // 추가 버튼 동작
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.02,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size.width * 0.03),
                        color: AppColors.orange,
                      ),
                      child: Text(
                        '추가',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width * 0.045,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formattedValue(String label, int value) {
    if (label == '개수') return '${value}잔';
    if (label == '용량') return '${value}ml';
    if (label == '카페인 함유량') return '${value}mg';
    return value.toString();
  }

  Widget _buildInputRow({
    required String label,
    required String hintText,
    required TextEditingController controller,
    required BuildContext context,
  }) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 라벨 (예: 개수, 용량 등)
          SizedBox(
            width: size.width * 0.25,
            child: Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: size.width * 0.04,
              ),
            ),
          ),

          SizedBox(width: size.width * 0.2),

          // 입력창 + ↑↓ 버튼
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,

              style: TextStyle(
                color: Colors.white,
                fontSize: size.width * 0.04,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                filled: true,
                fillColor: Colors.grey[800],
                contentPadding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.04,
                  vertical: size.height * 0.015,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(size.width * 0.02),
                  borderSide: const BorderSide(color: AppColors.orange),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(size.width * 0.02),
                  borderSide: const BorderSide(color: AppColors.orange),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(size.width * 0.02),
                  borderSide: const BorderSide(
                    color: AppColors.orange,
                    width: 2,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(size.width * 0.02),
                  borderSide: const BorderSide(color: AppColors.orange),
                ),
                suffixIcon:
                    (label == '개수' || label == '용량' || label == '카페인 함유량')
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              final current =
                                  int.tryParse(
                                    controller.text.replaceAll(
                                      RegExp(r'[^0-9]'),
                                      '',
                                    ),
                                  ) ??
                                  0;
                              final updated = current + 1;
                              controller.text = _formattedValue(label, updated);
                            },
                            child: Icon(
                              Icons.arrow_drop_up,
                              color: Colors.orange,
                              size: size.width * 0.06,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              final current =
                                  int.tryParse(
                                    controller.text.replaceAll(
                                      RegExp(r'[^0-9]'),
                                      '',
                                    ),
                                  ) ??
                                  0;
                              final updated = (current - 1).clamp(0, 999);
                              controller.text = _formattedValue(label, updated);
                            },
                            child: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.orange,
                              size: size.width * 0.06,
                            ),
                          ),
                        ],
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimePickerRow(String label, Size size) {
    return Padding(
      padding: EdgeInsets.only(bottom: size.height * 0.025),
      child: Row(
        children: [
          SizedBox(
            width: size.width * 0.25,
            child: Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: size.width * 0.04,
              ),
            ),
          ),
          SizedBox(width: size.width * 0.2),
          Expanded(
            child: GestureDetector(
              onTap: () async {
                final picked = await showDateTimePicker();
                if (picked != null) {
                  setState(() {
                    _selectedTime = picked;
                  });
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.015,
                  horizontal: size.width * 0.04,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size.width * 0.025),
                  border: Border.all(color: AppColors.orange),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        _selectedTime != null
                            ? '${_selectedTime!.year}/${_selectedTime!.month}/${_selectedTime!.day}\n${_selectedTime!.hour}:${_selectedTime!.minute.toString().padLeft(2, '0')}'
                            : '날짜/시간 선택',
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: size.width * 0.04,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(
                      Icons.calendar_month,
                      size: size.width * 0.045,
                      color: AppColors.orange,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<DateTime?> showDateTimePicker() async {
    final date = await showDatePicker(
      context: context,
      locale: const Locale('ko', 'KR'),
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Localizations.override(
          context: context,
          locale: const Locale('ko', 'KR'),
          child: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: AppColors.orange, // header background
                onPrimary: Colors.white, // header text color
                onSurface: Colors.black, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.orange, // button text color
                ),
              ),
            ),
            child: child!,
          ),
        );
      },
    );
    if (date == null) return null;

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Localizations.override(
          context: context,
          locale: const Locale('ko', 'KR'),
          child: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: AppColors.orange, // clock dial
                onPrimary: Colors.white,
                onSurface: Colors.black,
              ),
            ),
            child: child!,
          ),
        );
      },
    );
    if (time == null) return null;

    return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }
}
