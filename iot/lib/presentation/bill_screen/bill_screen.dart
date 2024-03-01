import 'package:electricity_app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BillScreen extends StatelessWidget {
  const BillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.iotBackground,
      appBar: AppBar(
        backgroundColor: ColorConstant.iotBackground,
        centerTitle: true,
        title: Text(
          "Genarated Bills",
          style: TextStyle(color: ColorConstant.iotWhite),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            "Unit Cunsumed",
                            style: TextStyle(color: ColorConstant.iotLiteGreen),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "Total Bill Amount",
                            style: TextStyle(color: ColorConstant.iotLiteGreen),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            "200",
                            style: TextStyle(
                                color: ColorConstant.iotWhite, fontSize: 18),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "385",
                            style: TextStyle(
                                color: ColorConstant.iotWhite, fontSize: 18),
                          ),
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
                            border: Border.all(color: ColorConstant.iotGrey)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              DateFormat('yyyy-MM-dd').format(DateTime.now()),
                              style: TextStyle(color: ColorConstant.iotWhite),
                            ),
                            SizedBox(width: 15),
                            Text(
                              DateFormat.jm().format(DateTime
                                  .now()), // Formats time in hours:minutes AM/PM format
                              style: TextStyle(color: ColorConstant.iotWhite),
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
    );
  }
}
