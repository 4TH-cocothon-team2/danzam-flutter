import 'package:flutter/material.dart';
import '../constants/colors.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff333333),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Text('카페인 반감기 계산을 위해',
              style: TextStyle(
                fontFamily: 'Pretendard-Bold',
                fontSize: 20,
                color: AppColors.lightGray,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Text('정확한 정보를 입력해주세요',
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
                child: Text('성별',
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

              if (_gender == Gender.female) ... [
                Padding(
                  padding: const EdgeInsets.only(left: 40, bottom: 5, top: 20),
                  child: Text('임신 여부',
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
                child: Text('나이',
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
                        style: TextStyle(
                          fontFamily: 'Pretendard-Regular',
                          color: Color(0xff908F8B),
                        ),
                        cursorColor: Color(0xff908F8B),
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
                    Text('세',
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
                child: Text('몸무게',
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
                        style: TextStyle(
                          fontFamily: 'Pretendard-Regular',
                          color: Color(0xff908F8B),
                        ),
                        cursorColor: Color(0xff908F8B),
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
                    Text('kg',
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
                child: Text('흡연 여부',
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
                child: Text('기타 약물 복용 여부',
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
                onPressed: () {},
                child: Text('정보 저장',
                  style: TextStyle(
                    fontFamily: 'Pretendard-Bold',
                    fontSize: 20,
                    color: AppColors.lightGray,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

