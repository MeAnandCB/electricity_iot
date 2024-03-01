import 'package:electricity_app/core/constant/boxes.dart';
import 'package:electricity_app/core/constant/colors.dart';
import 'package:electricity_app/presentation/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.clear();
    currentDataBox.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
      child: InkWell(
        onTap: () {
          logout();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
              (route) => false);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: ColorConstant.iotWhite)),
          child: Row(
            children: [
              Icon(Icons.logout, color: ColorConstant.iotWhite),
              SizedBox(width: 20),
              Text(
                "LogOut",
                style: TextStyle(color: ColorConstant.iotWhite),
              )
            ],
          ),
        ),
      ),
    );
  }
}
