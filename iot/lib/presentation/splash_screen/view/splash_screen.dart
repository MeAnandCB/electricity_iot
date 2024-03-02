import 'dart:async';

import 'package:electricity_app/core/constant/colors.dart';
import 'package:electricity_app/internet_screen.dart';
import 'package:electricity_app/presentation/bottomnav_screen/view/bottom_nav_screen.dart';
import 'package:electricity_app/presentation/home_screen/home_screen.dart';
import 'package:electricity_app/presentation/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getstring();
    Timer(Duration(seconds: 3), () {
      if (getname.isEmpty) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => InternetScreen(),
            ));
      }
    });
    super.initState();
  }

  String getname = '';
  getstring() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    getname = pref.getString('name')!;
    print(getname);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.iotBackground,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/logo.png"),
            Text(
              "Track Your Power",
              style: TextStyle(
                  color: ColorConstant.iotLiteorange,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Empower Your Savings, Track Your Watts!",
              style: TextStyle(
                color: ColorConstant.iotLiteGreen,
                fontSize: 11,
              ),
            )
          ],
        ),
      ),
    );
  }
}
