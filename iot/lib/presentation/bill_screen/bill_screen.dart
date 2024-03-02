import 'package:electricity_app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class BillScreen extends StatelessWidget {
  const BillScreen(
      {super.key,
      required this.unit,
      required this.amount,
      required this.date,
      required this.time});

  final double unit;
  final double amount;
  final String date;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.iotBackground,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new_sharp,
            color: ColorConstant.iotWhite,
          ),
        ),
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
                            unit.toStringAsFixed(3),
                            style: TextStyle(
                                color: ColorConstant.iotWhite, fontSize: 18),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "${(unit * 7).toStringAsFixed(3)}",
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
                              date,
                              style: TextStyle(color: ColorConstant.iotWhite),
                            ),
                            SizedBox(width: 15),
                            Text(
                              time, // Formats time in hours:minutes AM/PM format
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
