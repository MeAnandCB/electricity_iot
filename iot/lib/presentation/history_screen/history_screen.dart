import 'package:electricity_app/core/constant/boxes.dart';
import 'package:electricity_app/core/constant/colors.dart';
import 'package:electricity_app/core/database/current_data.dart';
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
      Provider.of<DeviceSelectionController>(context, listen: false)
          .calculateTotalPower();
    });

    super.initState();
  }

// Total Bill = Units Consumed × Rate per Unit
  @override
  Widget build(BuildContext context) {
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
            reverse: true,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              CurrentData data = currentDataBox.getAt(index);

              print(data.bill_amount);

              return Padding(
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
                                      data.current.toStringAsFixed(2),
                                      style: TextStyle(
                                          color: ColorConstant.iotWhite,
                                          fontSize: 18),
                                    ),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    currentDataBox.deleteAt(index);
                                    data;
                                  });
                                },
                                child: Icon(
                                  Icons.delete_outline,
                                  color: ColorConstant.iotRed,
                                ),
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
                                  data.bill_amount.toStringAsFixed(2),
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
                                      data.date,
                                      style: TextStyle(
                                          color: ColorConstant.iotWhite),
                                    ),
                                    SizedBox(width: 15),
                                    Text(
                                      data.time, // Formats time in hours:minutes AM/PM format
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
              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: currentDataBox.length));
  }
}
