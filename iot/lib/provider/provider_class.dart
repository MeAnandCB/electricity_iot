import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeviceSelectionController extends ChangeNotifier {
  late Box<double> consumedUnitsBox;
  bool loadingValue = false;
  double totalPower = 0.0;
  double unitFinal = 0.0;
  double bill = 0.0;
  Map<String, bool> deviceSelection = {
    'Fan': false,
    'Bulb': false,
    'TV': false,
  };

  Map<String, double> devicePower = {
    'Fan': 100, // Assuming fan consumes 100W
    'Bulb': 60, // Assuming bulb consumes 60W
    'TV': 150, // Assuming TV consumes 150W
  };

  List<double> consumedUnitsList = []; // List to store consumed units

  Future<void> _openConsumedUnitsBox() async {
    await Hive.openBox<double>('consumed_units');
    consumedUnitsBox = await Hive.openBox<double>('consumed_units');
  }

  void closeBoxes() {
    consumedUnitsBox.close();
  }

  void storeConsumedUnits(double units) {
    consumedUnitsList.add(units); // Add new units to the list
    //consumedUnitsBox.add(units); // Store units in Hive box
    print("Stored units: $units");
    notifyListeners();
  }

  late Timer timer;
  static const int interval = 5; // in seconds

  List current = [
    {"title": "Voltage (V)", "ele": " 0"},
    {"title": "Amperage (A)", "ele": " 0"},
    {"title": "Consumed Energy (kWh)", "ele": " 0"},
    {"title": "Power (W)", "ele": " 0"},
  ];

  startCalculating() {
    Future.delayed(Duration(seconds: 5)).then(
      (value) {
        print(totalPower);
        double voltage = generateRandomVoltage();
        double resistance = 100; // Sample resistance value in ohms
        double amperage = voltage / resistance;
        double power = totalPower + (voltage * amperage);
        double time = interval / 3600; // converting seconds to hours
        double energy = power * time;
        unitFinal = energy;
        current = [
          {"title": "Voltage (V)", "ele": voltage.toStringAsFixed(2)},
          {"title": "Amperage (A)", "ele": amperage.toStringAsFixed(2)},
          {"title": "Consumed Energy (kWh)", "ele": energy.toStringAsFixed(2)},
          {"title": "Power (W)", "ele": power.toStringAsFixed(2)},
        ];
        startCalculating();
      },
    );

    notifyListeners();
  }

// Generating random voltage between 220 and 240 volts
  double generateRandomVoltage() {
    if (totalPower > 0) {
      return Random().nextInt(11) + 230.toDouble();
    } else {
      return 0.0;
    }
  }

//store the data for home screen name
  String? getname;
  getNamestring() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    getname = pref.getString('name')!;
    print(getname);

    notifyListeners();
  }

  // calculationg the total

  void calculateTotalPower() {
    deviceSelection.forEach((d, isSelected) {
      if (isSelected) {
        totalPower += devicePower[0] ?? 0.0;
      } else {
        totalPower += 0.0;
      }
      notifyListeners();
    });

    print(
        '######################## Total power consumption: $totalPower Watts');
  }

  billAmount({double? amount}) {
    double bills;

    bills = amount! * 7;
    bills.toStringAsFixed(3);
    bill = bills;
  }

  // here is the loading

  void loading() async {
    await Future.delayed(Duration(seconds: 3));

    loadingValue = !loadingValue;
    getNamestring();
    notifyListeners();
  }

  int indexvalue = 0;
  void countter() {
    indexvalue = indexvalue + 1;
    notifyListeners();
  }
}
