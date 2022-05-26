import 'package:flutter/material.dart';
import 'package:mylastwords/Screens/GalleryScreen/Components/viewImage.dart';
import 'package:mylastwords/components/header_tab_back.dart';
import 'package:mylastwords/components/header_tab_save.dart';
import 'package:mylastwords/constants.dart';
import 'package:mylastwords/components/header_tab.dart';
import 'package:mylastwords/data.dart';
import 'package:mylastwords/models/gallery.dart';
import 'package:settings_ui/settings_ui.dart';

// import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool lockInBackground = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: HeaderTabSave(
          backgroundcolor: headerBackgroundColor,
          title: 'Profile',
          press: () {}),
      backgroundColor: darkBackground,
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Expanded(
                child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 0, left: 10, right: 10),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [kPrimaryLightColor, lightBackground],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      boxShadow: [],
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.person,
                                color: txtColorDark,
                                size: 25,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Profile',
                                style: TextStyle(
                                  color: txtColorDark,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_right_outlined,
                            color: txtColorDark,
                            size: 40,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ))
          ]),
    );
  }
}
