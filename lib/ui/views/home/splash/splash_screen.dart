import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_assessment/ui/views/home/splash/splash_controller.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('XYZ\nEmployees',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.w700)),
      ),
    );
  }
}
