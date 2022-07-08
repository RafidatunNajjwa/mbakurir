import 'package:flutter/material.dart';
import 'package:mbakurir/common/my_colors.dart';
import 'package:mbakurir/ui/screens/tracking/widget_banner.dart';


class TrackingShipment extends StatefulWidget {
  const TrackingShipment({ Key? key }) : super(key: key);

  @override
  _TrackingShipmentState createState() => _TrackingShipmentState();
}

class _TrackingShipmentState extends State<TrackingShipment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.white,
        title: Text(
          "Hitung Jumlah Pengiriman",
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
          WidgetBanner(),
     
       
        ],
      ),
    );
  }
}