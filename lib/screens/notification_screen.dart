import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:bgifter/util/my_colors.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: Text(
          "Notification",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        iconTheme: new IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColorStart:   Color(0xFFD62E63),
        backgroundColorEnd:  Color(0xFFFD9157),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          getCard(),
          getCard(),
          getCard(),
          getCard(),
          getCard(),
          getCard(),
          getCard(),
          getCard(),
          getCard(),
          getCard(),
          getCard(),
          getCard(),
          getCard(),
          getCard(),
          getCard(),
          getCard(),
          getCard(),
        ],
      ),
    );
  }

  Widget getCard() {
    return Card(
      elevation: 2.0,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: MyColors.defaultAppColor.withOpacity(0.2),
          child: Icon(
            FontAwesomeIcons.globeAsia,
            color: MyColors.defaultAppColor.withOpacity(0.9),
          ),
        ),
        title: Text(
          "Promy sent an invition for a Wedding Ceremony",
        ),
        subtitle: Text("Brif Details of Notification"),
        trailing: Icon(Icons.more_horiz),
        onTap: () {},
      ),
    );
  }
}
