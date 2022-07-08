import 'package:flutter/material.dart';
import 'package:mbakurir/common/Listnya.dart';
import 'package:mbakurir/common/dummy_data.dart';
import 'package:mbakurir/common/my_font_size.dart';
import 'package:mbakurir/common/my_style.dart';

class WidgetTitle extends StatefulWidget {
  const WidgetTitle({Key? key}) : super(key: key);

  @override
  _WidgetTitleState createState() => _WidgetTitleState();
}

class _WidgetTitleState extends State<WidgetTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
      child: Column(
        children: [
          Container(
            height: 400,
              child: ListView.builder(
              itemCount: Listnya.data.length,
              itemBuilder: (context, index){
                return Container(
                  height:80,
                  color: Color.fromARGB(255, 231, 170, 231),
                  child: Center(
                    child: Text(Listnya.data[index]['nama']),
                  ),
                );
              }),
          ),
            SizedBox(height: 10,),
          Text(
            "",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: MyFontSize.medium1,
            ),
          ),
          Text(
            "Apa yang kamu cari?",
            textAlign: TextAlign.center,
            style: MyStyle.textTitleBlack
          ),
          SizedBox(height: 10,),
          Text(
            "Berikut adalah fitur terbaik kami",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(255, 70, 64, 64),
              fontSize: MyFontSize.medium1,
            ),
          ),
        ],
      ),
    );
  }
}