import 'package:electricity_app/core/constant/boxes.dart';
import 'package:electricity_app/core/constant/colors.dart';
import 'package:electricity_app/core/database/current_data.dart';
import 'package:electricity_app/presentation/bill_screen/bill_screen.dart';
import 'package:electricity_app/presentation/home_screen/widgets/custom_reading_card.dart';
import 'package:electricity_app/provider/provider_class.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
//################################################################################
//################################################################################

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Provider.of<DeviceSelectionController>(context, listen: false)
          .startCalculating();
      getstring();
    });

    super.initState();
  }

  int indexvalue = 0;
  void countter() {
    indexvalue = indexvalue + 1;
    setState(() {});
  }

  String getname = '';
  getstring() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    getname = pref.getString('name')!;
    print(getname);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DeviceSelectionController>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 60),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    "Hi ${getname} ",
                    style: TextStyle(
                        color: ColorConstant.iotWhite,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Welcome to your home.",
                    style: TextStyle(
                      color: ColorConstant.iotWhite.withOpacity(.5),
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 40,
                  width: 40,
                  child: Icon(
                    Icons.electric_meter_outlined,
                    color: ColorConstant.iotLiteGreen,
                  ),
                  // child: Image.asset("assets/fan.png"),
                ),
                // bottomnavBarScreenProvider.loadingValue == false
                //     ? SizedBox(
                //         height: 20,
                //         width: 20,
                //         child: CircularProgressIndicator(
                //           color: ColorConstant.iotLiteorange,
                //         ))
                //     :

                Text(
                  "Device Connected",
                  style: TextStyle(
                    color: ColorConstant.iotWhite.withOpacity(.5),
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                  mainAxisExtent: 120),
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: ColorConstant.iotGrey,
                  boxShadow: [
                    BoxShadow(
                      color: ColorConstant.iotLiteGreen
                          .withOpacity(.2), // Red box shadow
                      blurRadius: 1,
                      offset: Offset(0, 2),
                    ),
                    BoxShadow(
                      color: ColorConstant.iotLiteorange
                          .withOpacity(.2), // Green box shadow
                      blurRadius: 1,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: CustomReadingCard(
                  titile: provider.current[index]["title"] ?? "",
                  value: provider.current[index]['ele'],
                  loading: false,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                countter();
                setState(() {
                  currentDataBox.put(
                      "name${indexvalue}",
                      CurrentData(
                        current: provider.unitFinal,
                        bill_amount: provider.bill.toInt(),
                        date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
                        time: DateFormat.jm().format(DateTime.now()),
                      ));

                  print(currentDataBox.length);
                });

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BillScreen(),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: ColorConstant.iotLiteGreen,
                ),
                child: Center(
                  child: Text("Get Bill"),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorConstant.iotGrey),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Date & time : ",
                    style: TextStyle(color: ColorConstant.iotLiteGreen),
                  ),
                  SizedBox(width: 10),
                  Text(
                    DateFormat('yyyy-MM-dd').format(DateTime.now()),
                    style: TextStyle(color: ColorConstant.iotWhite),
                  ),
                  SizedBox(width: 10),
                  Text(
                    DateFormat.jm().format(DateTime
                        .now()), // Formats time in hours:minutes AM/PM format
                    style: TextStyle(color: ColorConstant.iotWhite),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
