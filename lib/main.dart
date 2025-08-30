import 'package:cokothon25/init_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home/home_main.dart';

void main() {
  initControllers();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      color: Color(0xFFFFFFFF),
      home: const HomeMain(),
      debugShowCheckedModeBanner: false,
    );
  }
}
