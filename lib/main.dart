import 'package:app_lifecycle/pages/splash.dart';
import 'package:app_lifecycle/utils/theme/theme.dart';
import 'package:app_lifecycle/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AppLifeCycle',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          primary: primaryColor,
        ),
        primaryColor: primaryColor,
      ),
      home: SplashScreen(),
      getPages: Routes.generateRoutes(),
    );
  }
}
