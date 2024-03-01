import 'package:electricity_app/core/constant/colors.dart';
import 'package:electricity_app/presentation/device_connected_screen/device_connected_screen.dart';
import 'package:electricity_app/presentation/history_screen/history_screen.dart';
import 'package:electricity_app/presentation/home_screen/home_screen.dart';
import 'package:electricity_app/presentation/profile/profile.dart';
import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget {
  BottomNavScreen({
    super.key,
  });

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List Screens = [
      HomeScreen(),
      DeviceSelectionScreen(),
      HistoryScreen(),
      ProfileScreen()
    ];
    return Scaffold(
      body: Screens[selectedIndex],
      backgroundColor: ColorConstant.iotBackground,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) {
            selectedIndex = value;
            setState(() {});
          },
          selectedItemColor: ColorConstant.iotLiteGreen,
          unselectedItemColor: ColorConstant.iotWhite,
          backgroundColor: ColorConstant.iotGrey,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.devices_other_outlined,
                ),
                label: "Device"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.history,
                ),
                label: "History"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: "Setting"),
          ]),
    );
  }
}
