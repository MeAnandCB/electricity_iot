import 'package:electricity_app/core/constant/boxes.dart';
import 'package:electricity_app/core/database/current_data.dart';
import 'package:electricity_app/internet_screen.dart';
import 'package:electricity_app/provider/provider_class.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:provider/provider.dart';

import 'presentation/splash_screen/view/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive and open Hive box
  await Hive.initFlutter();
  Hive.registerAdapter(CurrentDataAdapter());
  currentDataBox = await Hive.openBox<CurrentData>('current_box');
  // Run the Flutter application
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DeviceSelectionController(),
      child:
          MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen()),
    );
  }
}
