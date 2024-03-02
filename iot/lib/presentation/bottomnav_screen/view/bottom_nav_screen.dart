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
  bool ischecker = true;

  @override
  Widget build(BuildContext context) {
    List Screens = [
      HomeScreen(),
      DeviceSelectionScreen(),
      HistoryScreen(),
      ProfileScreen()
    ];
    return WillPopScope(
      onWillPop: () async {
        bool exit = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Confirmation'),
              content: Text(
                  'Do you want to exit? The powered appliances will be turned off.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false); // No, do not exit
                  },
                  child: Text('No'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true); // Yes, exit
                  },
                  child: Text('Yes'),
                ),
              ],
            );
          },
        );
        return exit ?? false; // If exit is null, default to false (don't exit)
      },
      child: Scaffold(
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
      ),
    );
  }
}
