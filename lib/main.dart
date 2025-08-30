import 'package:cokothon25/controllers/bindings/bottomnavi_binding.dart';
import 'package:cokothon25/init_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'app_shell.dart';

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
      color: Color(0xFFFFFFFF),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ko', 'KR')],
      home: const AppShell(),
      debugShowCheckedModeBanner: false,
    );
  }
}
