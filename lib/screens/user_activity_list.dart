import 'package:flutter/material.dart';
import 'package:bgifter/util/my_colors.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
class UserActivityList extends StatefulWidget {
  @override
  _UserActivityListState createState() => _UserActivityListState();
}


class _UserActivityListState extends State<UserActivityList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        iconTheme: new IconThemeData(color: Colors.white),
        title: Text(
          "Activity List",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColorStart:   Color(0xFFD62E63),
        backgroundColorEnd:  Color(0xFFFD9157),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),


          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
    );
  }
}
