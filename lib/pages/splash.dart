import 'dart:async';

import 'package:app_lifecycle/utils/theme/theme.dart';
import 'package:app_lifecycle/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Get.toNamed(RoutesName.objectPage);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,

      body: Center(
        child: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(fixPadding * 2.0),
          children: [Icon(Icons.circle, size: 80.0, color: whiteColor)],
        ),
      ),
    );
  }
}
