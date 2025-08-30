import 'controllers/bindings/bottomnavi_binding.dart';
import 'init_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'constants/colors.dart';
import 'app_shell.dart';
import 'init_controllers.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'home/home_main.dart';
import 'screens/intro.dart';

void main() {
  initControllers();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: NavigationBinding(),
      color: AppColors.lightGray,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ko', 'KR')],
      home: const IntroPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
