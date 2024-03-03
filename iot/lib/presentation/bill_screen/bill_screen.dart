import 'package:electricity_app/core/constant/boxes.dart';
import 'package:electricity_app/core/constant/colors.dart';
import 'package:electricity_app/core/database/current_data.dart';
import 'package:electricity_app/provider/provider_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BillScreen extends StatefulWidget {
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
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  adddatatoDb() async {
    setState(() async {
      await currentDataBox.put(
          "name${widget.unit}",
          CurrentData(
              current: widget.unit,
              bill_amount: (widget.unit * 7),
              date: widget.date,
              time: widget.time));
    });
  }

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
                            widget.unit.toStringAsFixed(3),
                            style: TextStyle(
                                color: ColorConstant.iotWhite, fontSize: 18),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "${(widget.unit * 7).toStringAsFixed(3)}",
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
                              widget.date,
                              style: TextStyle(color: ColorConstant.iotWhite),
                            ),
                            SizedBox(width: 15),
                            Text(
                              widget
                                  .time, // Formats time in hours:minutes AM/PM format
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
      bottomNavigationBar: InkWell(
        onTap: () {
          adddatatoDb();
          Navigator.pop(context);
        },
        child: Container(
          height: 60,
          padding: EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: ColorConstant.iotLiteGreen,
          ),
          child: Center(
            child: Text("Save the Response"),
          ),
        ),
      ),
    );
  }
}
