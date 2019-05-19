import 'package:bgifter/models/gift_product.dart';
import 'package:bgifter/screens/create_event_screen.dart';
import 'package:bgifter/screens/event_details.dart';
import 'package:bgifter/screens/home_screen_content.dart';
import 'package:bgifter/widgets/event_view_item.dart';
import 'package:bgifter/widgets/product_list_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:bgifter/util/my_colors.dart';

class UserEventListScreen extends StatefulWidget {
  @override
  _UserEventListScreenState createState() => _UserEventListScreenState();
}

GiftProduct giftProduct = new GiftProduct();

var profileImage = CachedNetworkImageProvider(
    "https://i.pinimg.com/originals/52/86/29/528629803cfb99f88666c272e69e75b2.jpg");

class _UserEventListScreenState extends State<UserEventListScreen> {
  int createdEventCount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop()),
        title: Text(
          "My Events",
          style: TextStyle(color: Colors.white),
        ),
          backgroundColorStart:   Color(0xFFD62E63),
          backgroundColorEnd:  Color(0xFFFD9157)
      ),
      body: ListView(
        primary: true,
        children: <Widget>[
          ListTile(
            title: Text(
              "My Events",
            ),
            subtitle: Text('31 Events in 5 categories'),
            trailing: ClipOval(
              child: Container(
                  height: 40.0,
                  width: 40.0,
                  color: MyColors.redLight,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(LineAwesomeIcons.edit),
                    color: MyColors.red,
                    tooltip: "Add New Event",
                  )),
            ),
          ),
          _getEvents(Icons.cake, 'Zahid\'s Birthday', 'Organized 2 days ago'),
          _getEvents(Icons.cake, 'Zahid\'s Birthday', 'Organized 2 days ago'),
          _getEvents(Icons.cake, 'Zahid\'s Birthday', 'Organized 2 days ago'),
          _getEvents(Icons.cake, 'Zahid\'s Birthday', 'Organized 2 days ago'),
          _getEvents(Icons.cake, 'Zahid\'s Birthday', 'Organized 2 days ago'),
          _getEvents(Icons.cake, 'Zahid\'s Birthday', 'Organized 2 days ago'),
          _getEvents(Icons.cake, 'Zahid\'s Birthday', 'Organized 2 days ago'),
          _getEvents(Icons.cake, 'Zahid\'s Birthday', 'Organized 2 days ago'),
          _getEvents(Icons.cake, 'Zahid\'s Birthday', 'Organized 2 days ago'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => CreateEventScreen()));
        },
        tooltip: "Edit Wish",
        child: Icon(Icons.add),
      ),
    );
  }

  _getEvents(icon, name, time) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => EventDetails(event)));
        },
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/event_image1.png"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    boxShadow: [BoxShadow(blurRadius: 2, color: Colors.grey)],
                  ),
                ),
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: Colors.black.withOpacity(0.6),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 40.0,
                              width: 40.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                        "https://i.pinimg.com/originals/52/86/29/528629803cfb99f88666c272e69e75b2.jpg"),
                                  )),
                            ),
                            SizedBox(width: 5,),
                            Container(
                              padding: EdgeInsets.only(top: 12),
                                child: Text('promy',style: TextStyle(color: Colors.white),)),
                            Spacer(),
                            Container(
                                height: 60,
                                width: 55,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "24",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: "Quicksand"),
                                    ),
                                    Divider(
                                      height: 1,
                                    ),
                                    Text(
                                      "Mar",
                                      style: TextStyle(),
                                    ),
                                    Spacer(),
                                    Divider(
                                      height: 1,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 1, top: 1),
                                        child: Center(
                                          child: Text(
                                            "2019",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13),
                                          ),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(5),
                                              bottomRight: Radius.circular(5)),
                                          color: Colors.lightGreen),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                                Text(
                                  "Nurerchala Road, Vatara, Gulshan",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.access_time,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                                Text(
                                  "1.30 AM, Sunday",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Material(
              color: Color(0xEEeeeeee),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.event_note,
                      size: 18,
                    ),
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(right: 10, bottom: 5, top: 5),
                    height: 40,
                    width: 40,
                    child: IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.redAccent,
                        ),
                        onPressed: () {}),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
