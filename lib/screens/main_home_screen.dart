import 'package:bgifter/models/event.dart';
import 'package:bgifter/screens/CreateScreen.dart';
import 'package:bgifter/screens/create_event_screen.dart';
import 'package:bgifter/screens/home_screen_content.dart';
import 'package:bgifter/screens/notification_screen.dart';
import 'package:bgifter/screens/profile_screen.dart';
import 'package:bgifter/screens/gift_shop_screen.dart';
import 'package:bgifter/util/my_colors.dart';
import 'package:flutter/material.dart';

import 'package:line_awesome_icons/line_awesome_icons.dart';

class MainHomeScreen extends StatefulWidget {
  static String tag = 'home-page';
  @override
  _MainHomeScreenState createState() => _MainHomeScreenState();
}



class _MainHomeScreenState extends State<MainHomeScreen> with SingleTickerProviderStateMixin{
  final PageStorageBucket bucket = PageStorageBucket();
  int currentBottomNavIndex = 0;
  Widget currentPage;
 List<Widget> pages;

  var tabController;

  @override
  void initState() {
    tabController = new TabController(length: 5, vsync: this);
    pages = [
      HomeContent(),
      WishScreen(),
      CreateScreen(),
      NotificationScreen(),
      ProfileScreen(),
    ];
 currentPage = pages[currentBottomNavIndex];

    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        children: pages,
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
            controller: tabController,
            indicatorColor: Colors.transparent,
            unselectedLabelColor: Colors.grey,
            labelColor: MyColors.defaultAppColor,
            tabs: <Widget>[
              Tab(icon: Icon(IconData(0xf80a,fontFamily: "Font Awesome 5 Pro")),),
              Tab(icon: Icon(IconData(0xf06b,fontFamily: "Font Awesome 5 Pro")),),
              Tab(icon: Icon(IconData(0xf055,fontFamily: "Font Awesome 5 Pro")),),
              Tab(icon: Icon(IconData(0xf0f3,fontFamily: "Font Awesome 5 Pro")),),
              Tab(icon: Icon(IconData(0xf007,fontFamily: "Font Awesome 5 Pro")),),

            ]
        ),
      ),
    );
  }
}



//return Scaffold(
//body: PageStorage(
//child: currentPage,
//bucket: bucket,
//),
//bottomNavigationBar: BottomNavigationBar(
//type: BottomNavigationBarType.fixed,
//fixedColor: MyColors.red,iconSize: 30.0,
//currentIndex: currentBottomNavIndex,
//onTap: (int index) {
//setState(() {
//currentBottomNavIndex = index;
//currentPage = pages[currentBottomNavIndex];
//
//});
//},
//items: [
//BottomNavigationBarItem(title: Text("") , icon: Icon(LineAwesomeIcons.home)),
//BottomNavigationBarItem(title: Text(""), icon: Icon(LineAwesomeIcons.gift)),
//BottomNavigationBarItem(title: Text(""), icon: Icon(LineAwesomeIcons.plus_circle,)),
//BottomNavigationBarItem(title: Text(""), icon: Icon(LineAwesomeIcons.bell)),
//BottomNavigationBarItem(title: Text(""), icon: Icon(LineAwesomeIcons.user)),
//
//],
//),
//);