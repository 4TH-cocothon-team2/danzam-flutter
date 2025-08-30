import 'package:Danzam/app_shell.dart';
import 'package:Danzam/services/http/users/add_user_data.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/radio_buttons.dart';

enum Gender { male, female }

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Gender? _gender;
  bool? _pregnancy;
  bool? _smoking;
  bool? _drug;

  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.darkGray,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Text(
              '카페인 반감기 계산을 위해',
              style: TextStyle(
                fontFamily: 'Pretendard-Bold',
                fontSize: 20,
                color: AppColors.lightGray,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Text(
              '정확한 정보를 입력해주세요',
              style: TextStyle(
                fontFamily: 'Pretendard-Bold',
                fontSize: 20,
                color: AppColors.lightGray,
              ),
            ),
          ),

          SizedBox(height: 30),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40, bottom: 5),
                child: Text(
                  '성별',
                  style: TextStyle(
                    fontFamily: 'Pretendard-Bold',
                    fontSize: 16,
                    color: AppColors.lightGray,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    radioItem<Gender>(
                      value: Gender.male,
                      groupValue: _gender,
                      onChanged: (v) => setState(() {
                        _gender = v;
                        if (_gender == Gender.male) _pregnancy = null;
                      }),
                      label: '남성',
                      margin: const EdgeInsets.only(right: 24),
                    ),
                    radioItem<Gender>(
                      value: Gender.female,
                      groupValue: _gender,
                      onChanged: (v) => setState(() => _gender = v),
                      label: '여성',
                    ),
                  ],
                ),
              ),

              if (_gender == Gender.female) ...[
                Padding(
                  padding: const EdgeInsets.only(left: 40, bottom: 5, top: 20),
                  child: Text(
                    '임신 여부',
                    style: TextStyle(
                      fontFamily: 'Pretendard-Bold',
                      fontSize: 16,
                      color: AppColors.lightGray,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: [
                      radioItem<bool>(
                        value: false,
                        groupValue: _pregnancy,
                        onChanged: (v) => setState(() => _pregnancy = v),
                        label: '해당 없음',
                        margin: const EdgeInsets.only(right: 24),
                      ),
                      radioItem<bool>(
                        value: true,
                        groupValue: _pregnancy,
                        onChanged: (v) => setState(() => _pregnancy = v),
                        label: '임신중',
                      ),
                    ],
                  ),
                ),
              ],

              Padding(
                padding: const EdgeInsets.only(left: 40, bottom: 10, top: 20),
                child: Text(
                  '나이',
                  style: TextStyle(
                    fontFamily: 'Pretendard-Bold',
                    fontSize: 16,
                    color: AppColors.lightGray,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Row(
                  children: [
                    SizedBox(
                      width: 150,
                      child: TextField(
                        controller: _ageController,
                        style: TextStyle(
                          fontFamily: 'Pretendard-Regular',
                          color: AppColors.mediumGray,
                        ),
                        cursorColor: AppColors.mediumGray,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: BorderSide(color: AppColors.lightGray),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: BorderSide(color: AppColors.lightGray),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: BorderSide(color: AppColors.lightGray),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '세',
                      style: TextStyle(
                        fontFamily: 'Pretendard-Regular',
                        fontSize: 12,
                        color: AppColors.lightGray,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 40, bottom: 10, top: 20),
                child: Text(
                  '몸무게',
                  style: TextStyle(
                    fontFamily: 'Pretendard-Bold',
                    fontSize: 16,
                    color: AppColors.lightGray,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Row(
                  children: [
                    SizedBox(
                      width: 150,
                      child: TextField(
                        controller: _weightController,
                        style: TextStyle(
                          fontFamily: 'Pretendard-Regular',
                          color: AppColors.mediumGray,
                        ),
                        cursorColor: AppColors.mediumGray,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: BorderSide(color: AppColors.lightGray),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: BorderSide(color: AppColors.lightGray),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: BorderSide(color: AppColors.lightGray),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'kg',
                      style: TextStyle(
                        fontFamily: 'Pretendard-Regular',
                        fontSize: 12,
                        color: AppColors.lightGray,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 40, bottom: 5, top: 20),
                child: Text(
                  '흡연 여부',
                  style: TextStyle(
                    fontFamily: 'Pretendard-Bold',
                    fontSize: 16,
                    color: AppColors.lightGray,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    radioItem<bool>(
                      value: false,
                      groupValue: _smoking,
                      onChanged: (v) => setState(() => _smoking = v),
                      label: '비흡연',
                      margin: const EdgeInsets.only(right: 24),
                    ),
                    radioItem<bool>(
                      value: true,
                      groupValue: _smoking,
                      onChanged: (v) => setState(() => _smoking = v),
                      label: '흡연',
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 40, bottom: 5, top: 20),
                child: Text(
                  '기타 약물 복용 여부',
                  style: TextStyle(
                    fontFamily: 'Pretendard-Bold',
                    fontSize: 16,
                    color: AppColors.lightGray,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    radioItem<bool>(
                      value: false,
                      groupValue: _drug,
                      onChanged: (v) => setState(() => _drug = v),
                      label: '복용 안함',
                      margin: const EdgeInsets.only(right: 24),
                    ),
                    radioItem<bool>(
                      value: true,
                      groupValue: _drug,
                      onChanged: (v) => setState(() => _drug = v),
                      label: '복용중',
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 80),

          Center(
            child: SizedBox(
              width: 300,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
                onPressed: () async {
                  final ageText = _ageController.text.trim();
                  final weightText = _weightController.text.trim();

                  if (ageText.isEmpty || weightText.isEmpty) {
                    Get.snackbar('입력 오류', '나이와 몸무게를 모두 입력해주세요.');
                    return;
                  }

                  final age = int.tryParse(ageText);
                  final weight = double.tryParse(weightText);

                  if (age == null || weight == null) {
                    Get.snackbar('입력 오류', '숫자 형식으로 입력해주세요.');
                    return;
                  }

                  // TODO: 여기에 저장 처리 로직 추가
                  final userData = {
                    'gender': _gender?.index,
                    'pregnancy': _pregnancy,
                    'age': age,
                    'weight': weight,
                    'smoking': _smoking,
                    'drug': _drug,
                  };
                  // final data = await addUserData(userData);
                  // final userId = data['id'] ?? 0;
                  final userId = 1;

                  // 로컬 저장소에 append
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setBool('isRegistered', true);
                  debugPrint('isRegistered 값 변환 성공');
                  await prefs.setInt('userId', userId);
                  await prefs.setInt('age', age);
                  await prefs.setDouble('weight', weight);
                  await prefs.setBool('isSmoker', _smoking ?? false);
                  await prefs.setBool('isPregnant', _pregnancy ?? false);
                  await prefs.setBool('isDrug', _drug ?? false);
                  await prefs.setInt(
                    'gender',
                    _gender?.index ?? 0,
                  ); // 0: male, 1: female

                  await Get.offAll(() => AppShell());
                },
                child: Text(
                  '정보 저장',
                  style: TextStyle(
                    fontFamily: 'Pretendard-Bold',
                    fontSize: 20,
                    color: AppColors.lightGray,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
        ),
      ),
    );
  }
}
