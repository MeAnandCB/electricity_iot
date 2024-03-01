import 'package:electricity_app/core/constant/colors.dart';
import 'package:electricity_app/provider/provider_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeviceSelectionScreen extends StatefulWidget {
  @override
  _DeviceSelectionScreenState createState() => _DeviceSelectionScreenState();
}

class _DeviceSelectionScreenState extends State<DeviceSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DeviceSelectionController>(context);
    return Scaffold(
      backgroundColor: ColorConstant.iotBackground,
      appBar: AppBar(
        title: Text('Select Devices'),
        backgroundColor: ColorConstant.iotBackground,
      ),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          mainAxisExtent: 100,
        ),
        itemCount: provider.deviceSelection.length,
        itemBuilder: (BuildContext context, int index) {
          String device = provider.deviceSelection.keys.elementAt(index);
          return GestureDetector(
            onTap: () {
              setState(() {
                provider.deviceSelection[device] =
                    !provider.deviceSelection[device]!;

                if (provider.deviceSelection[device]!) {
                  provider.totalPower += provider.devicePower[device]!;
                } else {
                  provider.totalPower -= provider.devicePower[device]!;
                }
              });

              print('$device selected: ${provider.deviceSelection[device]}');
              provider.calculateTotalPower();
            },
            child: Card(
              color: provider.deviceSelection[device]!
                  ? ColorConstant.iotLiteGreen
                  : ColorConstant.iotGrey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    device == 'Fan'
                        ? Icons.ac_unit
                        : (device == 'Bulb' ? Icons.lightbulb : Icons.tv),
                    size: 30,
                  ),
                  Text(
                    device,
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
