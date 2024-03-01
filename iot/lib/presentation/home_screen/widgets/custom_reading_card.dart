import 'package:electricity_app/core/constant/colors.dart';
import 'package:electricity_app/provider/provider_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomReadingCard extends StatefulWidget {
  const CustomReadingCard(
      {super.key,
      required this.titile,
      required this.value,
      required this.loading});

  final String titile;
  final String value;
  final bool loading;

  @override
  State<CustomReadingCard> createState() => _CustomReadingCardState();
}

class _CustomReadingCardState extends State<CustomReadingCard> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Provider.of<DeviceSelectionController>(context, listen: false);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          // child: widget.loading == false
          //     ? CircularProgressIndicator(
          //         color: ColorConstant.iotLiteorange,
          //       )
          //     :

          Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            maxLines: 2,
            textAlign: TextAlign.center,
            widget.titile,
            style: TextStyle(
              color: ColorConstant.iotWhite,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 10),
          Text(
            widget.value.toString(),
            style: TextStyle(
                color: ColorConstant.iotWhite,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
