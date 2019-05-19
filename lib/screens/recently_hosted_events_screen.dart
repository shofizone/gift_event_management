import 'package:flutter/material.dart';
import 'package:bgifter/util/my_colors.dart';

class RecentlyHostedEvents extends StatefulWidget {
  @override
  _RecentlyHostedEventsState createState() => _RecentlyHostedEventsState();
}

class _RecentlyHostedEventsState extends State<RecentlyHostedEvents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.defaultAppColor,
        title: Text("My Hosted events",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        iconTheme: new IconThemeData(color: Colors.white),
        centerTitle: true,
        elevation: 0.0,

      ),
      body: Container(),
    );
  }
}
