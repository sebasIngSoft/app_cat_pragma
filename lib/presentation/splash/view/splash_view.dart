import 'dart:async';

import 'package:app_cat/presentation/home/view/home_pg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () => Get.offAll(() => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/splash_screen.png',
      fit: BoxFit.cover,
    );
  }
}
