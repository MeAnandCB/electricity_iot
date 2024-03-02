import 'package:electricity_app/core/constant/colors.dart';
import 'package:electricity_app/presentation/bottomnav_screen/view/bottom_nav_screen.dart';
import 'package:electricity_app/provider/provider_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:provider/provider.dart';

class InternetScreen extends StatefulWidget {
  const InternetScreen({super.key});

  @override
  State<InternetScreen> createState() => _InternetScreenState();
}

class _InternetScreenState extends State<InternetScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Provider.of<DeviceSelectionController>(context, listen: false).loading();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DeviceSelectionController>(context);
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(),
        body: OfflineBuilder(
            connectivityBuilder: (
              BuildContext context,
              ConnectivityResult connectivity,
              Widget child,
            ) {
              final bool connected = connectivity != ConnectivityResult.none;

              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: connected
                              ? ColorConstant.iotLiteGreen
                              : ColorConstant.iotRed),
                      child: Text(
                        "${connected ? 'ONLINE' : 'OFFLINE'}",
                        style: TextStyle(
                          color: connected
                              ? ColorConstant.iotBlack
                              : ColorConstant.iotWhite,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      child: Center(
                        child: Stack(
                          children: [
                            Image.asset("assets/internet.png"),
                            connected == false
                                ? Positioned(
                                    right: 60,
                                    bottom: 0,
                                    child: Center(
                                      child: SizedBox(
                                          height: 100,
                                          width: 100,
                                          child: Image.asset(
                                              "assets/internet_no.png")),
                                    ),
                                  )
                                : SizedBox(),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * .80,
                      child: Text(
                        "Internet checking successful. Please wait for the device connection",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15, height: 1.5),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    connected == false
                        ? CircularProgressIndicator()
                        : InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BottomNavScreen(),
                                  ));
                            },
                            child: Container(
                              height: 60,
                              width: MediaQuery.sizeOf(context).width * .80,
                              padding: EdgeInsets.symmetric(
                                vertical: 20,
                              ),
                              decoration: BoxDecoration(
                                  color: ColorConstant.iotBackground,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                child: Text(
                                  "All Done",
                                  style: TextStyle(
                                    color: ColorConstant.iotWhite,
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              );
            },
            child: SizedBox()));
  }
}
