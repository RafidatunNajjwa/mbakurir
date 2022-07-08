import 'package:flutter/material.dart';
import 'package:mbakurir/authentication.dart';
import 'package:mbakurir/common/dummy_data.dart';
import 'package:mbakurir/common/my_colors.dart';
import 'package:mbakurir/common/my_font_size.dart';
import 'package:mbakurir/common/my_style.dart';
import 'package:mbakurir/main.dart';
import 'package:mbakurir/ui/screens/tracking/tracking_judulatas.dart';
import 'package:mbakurir/ui/widgets/custom_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WidgetBanner extends StatefulWidget {
  const WidgetBanner({Key? key}) : super(key: key);

  @override
  _WidgetBannerState createState() => _WidgetBannerState();
}

String name = "";

class _WidgetBannerState extends State<WidgetBanner> {
  void loginStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('nama')??"empty";
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginStatus();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 80, left: 20, right: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        "Current Location",
                        style: TextStyle(
                            color: MyColors.blackText, fontSize: MyFontSize.small2),
                      ),
                      SizedBox(height: 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.circle_outlined, size: 10, color: MyColors.blackText,),
                          SizedBox(width: 10,),
                          Text(
                            "Malang",
                            style: TextStyle(
                                color: MyColors.blackText, fontSize: MyFontSize.medium1),
                          ),
                          SizedBox(width: 5,),
                          Icon(Icons.arrow_drop_down, size: 24, color: MyColors.blackText,),
                        ],
                      ),
                      Text(
                        "Hi, " + name,
                        style: TextStyle(
                            color: MyColors.blackText, fontSize: MyFontSize.medium1),
                      ),
                      TextButton(
                        onPressed: () async {
                          final prefs = await SharedPreferences.getInstance();
                          prefs.clear();
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => 
                              Scaffold(
                                    resizeToAvoidBottomInset: true,
                                    backgroundColor: const Color.fromRGBO(40, 38, 56, 1),
                                    body: LoginScreen(), //untuk logout
                                    bottomNavigationBar: BottomAppBar(
                                        color: Colors.transparent,
                                        elevation: 0,
                                        child: Container(
                                          padding: EdgeInsets.all(20),
                                          child: Text(
                                            "M B A K U R I R . I D",
                                            style: TextStyle(color: Colors.white),
                                            textAlign: TextAlign.center,
                                          ),
                                        )),
                                  )
                            ),
                            (Route<dynamic> route) => false
                          );
                        },
                        child: Text('Logout'),
                      ),
                    ],
                  )),
                 ],
              ),
              SizedBox(height: 20,),
              Text(
                "M B A K U R I R . I D",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: MyColors.blackText,
                  fontSize: 32,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Lacak Paket Anda",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: MyColors.blackText,
                  fontSize: MyFontSize.medium1,
                ),
              ),
              SizedBox(height: 20),
              CustomCard( 
                onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TrackingShipment()));
                      },
                shadow: false,
                height: 50,
                width: double.infinity,
                bgColor: MyColors.purple,
                borderRadius: BorderRadius.circular(10),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [ 
                    Icon(Icons.car_rental, color: MyColors.white,),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Text(
                        "Enter track number",
                        style: MyStyle.textParagraphBlack,
                      )
                    ),
                    SizedBox(width: 10,),
                    CustomCard(
                      shadow: false,
                      bgColor: MyColors.white,
                      borderRadius: BorderRadius.circular(10),
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                      child: Text(
                        "Track",
                        style: MyStyle.textParagraphBlack,
                      )
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
