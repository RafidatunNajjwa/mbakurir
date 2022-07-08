import 'package:flutter/material.dart';
import 'package:mbakurir/common/my_colors.dart';
import 'package:mbakurir/ui/screens/zbawa/widget_timeline.dart';


class WidgetTimelineWrapper extends StatefulWidget {
  const WidgetTimelineWrapper({Key? key}) : super(key: key);

  @override
  _WidgetTimelineWrapperState createState() => _WidgetTimelineWrapperState();
}

class _WidgetTimelineWrapperState extends State<WidgetTimelineWrapper> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        children: [
          WidgetTimeline(
            icon: Icons.car_rental,
            bgcolor: MyColors.purple,
            title1: "Send to your home",
            title2: "Avenir Venue 12, Malang",
            time: "25 January, 3:35 PM",
            showCard: true,
          ),
          WidgetTimeline(
            icon: Icons.sort_sharp,
            bgcolor: MyColors.softGrey,
            title1: "Processed on sort facility",
            title2: "Mba Kurir Warehouse, Malang",
            time: "24 January, 6:25 PM",
            showCard: false,
          ),
          WidgetTimeline(
            icon: Icons.production_quantity_limits,
            bgcolor: MyColors.softGrey,
            title1: "Departed Facility",
            title2: "Mba Kurir Warehouse, Malang",
            time: "24 January, 4:15 PM",
            showCard: false,
          ),
        ],
      ),
    );
  }
}