import 'package:flutter/material.dart';
import 'package:mbakurir/common/my_colors.dart';
import 'package:mbakurir/ui/screens/zbawa/widget_timeline_wrapper.dart';

class TrackingAtas extends StatefulWidget {
  const TrackingAtas({ Key? key }) : super(key: key);

  @override
  _TrackingShipmentState createState() => _TrackingShipmentState();
}

class _TrackingShipmentState extends State<TrackingAtas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.white,
        title: Text(
          "Lacak Pengiriman",
          style: TextStyle(
            color: MyColors.blackText
          ),
        ),
        iconTheme: IconThemeData(
          color: MyColors.blackText
        ),
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
            WidgetTimelineWrapper()
        ],
      ),
    );
  }
}