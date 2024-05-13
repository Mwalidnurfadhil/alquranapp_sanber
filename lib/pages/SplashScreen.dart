import 'dart:async';

import 'package:final_project_alquranapp/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    startApp(context);
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              'Al-Quran App',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.92),
            child: Text(
              "Development By Muhammad Walid Nur Fadhil",
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.85),
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }

  startApp(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Get.toNamed(RouteName.LOGIN);
    });
  }
}
