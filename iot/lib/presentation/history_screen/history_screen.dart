import 'package:electricity_app/core/constant/colors.dart';
import 'package:electricity_app/provider/provider_class.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Provider.of<DeviceSelectionController>(context, listen: false);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DeviceSelectionController>(context);
    return Scaffold(
        backgroundColor: ColorConstant.iotBackground,
        appBar: AppBar(
          backgroundColor: ColorConstant.iotBackground,
          centerTitle: true,
          title: Text(
            "History",
            style: TextStyle(color: ColorConstant.iotWhite),
          ),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: ColorConstant.iotGrey)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Center(
                                      child: Text(
                                        "Unit Cunsumed : ",
                                        style: TextStyle(
                                            color: ColorConstant.iotLiteGreen),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        provider.consumedUnitsList[index]
                                            .toString(),
                                        style: TextStyle(
                                            color: ColorConstant.iotWhite,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.delete_outline,
                                  color: ColorConstant.iotRed,
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text(
                                    "Total Bill Amount  :   ",
                                    style: TextStyle(
                                        color: ColorConstant.iotLiteGreen),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    "385",
                                    style: TextStyle(
                                        color: ColorConstant.iotWhite,
                                        fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  width: MediaQuery.sizeOf(context).width / 2,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: ColorConstant.iotGrey)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        DateFormat('yyyy-MM-dd')
                                            .format(DateTime.now()),
                                        style: TextStyle(
                                            color: ColorConstant.iotWhite),
                                      ),
                                      SizedBox(width: 15),
                                      Text(
                                        DateFormat.jm().format(DateTime
                                            .now()), // Formats time in hours:minutes AM/PM format
                                        style: TextStyle(
                                            color: ColorConstant.iotWhite),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            separatorBuilder: (context, index) => Divider(),
            itemCount: provider.consumedUnitsList.length));
  }
}
