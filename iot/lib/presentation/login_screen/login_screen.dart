import 'package:electricity_app/core/constant/colors.dart';
import 'package:electricity_app/internet_screen.dart';
import 'package:electricity_app/presentation/bottomnav_screen/view/bottom_nav_screen.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController name = TextEditingController();
  var nameKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.iotBackground,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/qw.png"),
              Form(
                key: nameKey,
                child: TextFormField(
                  style: TextStyle(color: ColorConstant.iotWhite),
                  controller: name,
                  decoration: InputDecoration(
                      labelText: "Enter your name",
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || name.text.isEmpty) {
                      return "Enter a name";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  if (nameKey.currentState!.validate()) {
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();

                    pref.setString('name', name.text.trim());

                    setState(() {});

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InternetScreen(),
                      ),
                    );
                  }
                },
                child: Container(
                  width: 150,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: ColorConstant.iotLiteGreen,
                  ),
                  child: Center(
                    child: Text("Submit"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
