import 'package:bgifter/models/gift_product.dart';
import 'package:bgifter/screens/contact_screen.dart';
import 'package:bgifter/screens/create_event_screen.dart';
import 'package:bgifter/screens/edit_profile_screen.dart';
import 'package:bgifter/screens/invitations_all.dart';
import 'package:bgifter/screens/login_screen.dart';
import 'package:bgifter/screens/my_wish_list_screen.dart';
import 'package:bgifter/screens/product_details_screen.dart';
import 'package:bgifter/screens/recently_hosted_events_screen.dart';
import 'package:bgifter/screens/settings.dart';
import 'package:bgifter/screens/user_activity_list.dart';
import 'package:bgifter/screens/user_event_list.dart';
import 'package:bgifter/widgets/event_view_item.dart';
import 'package:bgifter/widgets/product_list_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:bgifter/util/my_colors.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

GiftProduct giftProduct = new GiftProduct.dummy();
var proPicDefault = AssetImage("images/user_unknown.png");
var _checkLoaded = false;

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int createdEventCount = 0;
  int invitationCount = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,

        body: ListView(
          children: <Widget>[
            _buildProfileInfoSection(),
            SizedBox(
              height: 16.0,
            ),
            _buildMyWishListSection(),
            SizedBox(
              height: 16.0,
            ),
            _buildInvitedEvents(),
            SizedBox(
              height: 16.0,
            ),
            _recentlyHostedEvents(),
            SizedBox(
              height: 16.0,
            ),
          ],
        ));
  }

  _buildProfileInfoSection() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 8.0,
              ),
              Container(
                height: 120.0,
                width: 120.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(
                          "https://i.pinimg.com/originals/52/86/29/528629803cfb99f88666c272e69e75b2.jpg"),
                      fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10.0,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                'Sumaia Promy',
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              SizedBox(
                height: 4.0,
              ),
              Text(
                'Hey there i\'m using Gifter',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Container(
            height: 4.0,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [MyColors.orangeLight, MyColors.orange])),
          ),
        ),
        SizedBox(height: 16.0),
        Container(
          decoration: BoxDecoration(
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              getSelectOptionCard(
                  "Contacts",
                  IconData(0xf0c0,fontFamily: "Font Awesome 5 Pro Solid",),
                  Colors.black87,
                  () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => ContactScreen()))),
              getSelectOptionCard(
                  "Activity List",
                  IconData(0xf0ca,fontFamily: "Font Awesome 5 Pro Solid",),
                  Colors.black87,
                  () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => UserActivityList()))),
              getSelectOptionCard(
                  "Edit Profile",
                  IconData(0xf4ff,fontFamily: "Font Awesome 5 Pro Solid",),
                  Colors.black87,
                  () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => EditProfileScreen()))),
              getSelectOptionCard(
                  "More",
                  IconData(0xf141,fontFamily: "Font Awesome 5 Pro Solid",),
                  Colors.black87,
                  (){_settingModalBottomSheet(context);}),
            ],
          ),
        ),
      ],
    );
  }

  Widget getSelectOptionCard(
    String label,
    IconData icon,
    Color color,
    Function action,
  ) {
    return Expanded(
      child: Material(
        child: InkWell(
          onTap: action,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 5.0),
            child: Column(
              children: <Widget>[
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.withOpacity(0.1)
                  ),
                  child: Icon(
                    icon,
                    size: 24,
                  ),
                ),
                Text(
                  label,
                  style: TextStyle(color: color),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildMyWishListSection() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            color: Color(0xFFEFEFEF),
            child: ListTile(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MyWishListScreen())),
              title: Text("My Wish List"),
              subtitle: Text('31 Wishes in 5 categories'),
              trailing: Text("View All",style: TextStyle(color: MyColors.red),),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Container(
              height: 200.0,
              child: ListView(
                padding: EdgeInsets.all(0.0),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  FittedBox(child: ProductsListItem()),
                  FittedBox(child: ProductsListItem()),
                  FittedBox(child: ProductsListItem()),
                  FittedBox(child: ProductsListItem()),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildInvitedEvents() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            color: Color(0xFFEFEFEF),
            child: ListTile(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>InvitationsAll()));},
              title:      Text("Invitations",style: TextStyle(),),
              subtitle: Text("You Have total 21 invitations",style: TextStyle(),),
              trailing: Text("View All",style: TextStyle(fontWeight: FontWeight.bold,color: MyColors.defaultAppColor,
              ),),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          invitationCount != 0?Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            height: 150.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                EventViewItem(
                    Icons.cake, 'Zahid\'s Birthday', 'Invite by Zahid'),
                EventViewItem(FontAwesomeIcons.hollyBerry,
                    'Zahid\'s Wedding Ceremony', 'Invite by Mehedi'),
                EventViewItem(FontAwesomeIcons.playCircle, 'Opening Ceremony',
                    '4  days ago'),
                EventViewItem(Icons.wb_sunny, 'Birthday', 'Invite by Shofiul'),
                EventViewItem(Icons.wb_sunny, 'Birthday', 'Invite by Rakib'),
              ],
            ),
          ):Container(
            height: 150.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.error_outline,size: 40,color: Colors.black.withOpacity(0.5),),
                Text("You Don't Have Any Invitation",style: TextStyle(fontSize: 17,color: Colors.grey),),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _recentlyHostedEvents() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            color: Color(0xFFEFEFEF),
            child: ListTile(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => UserEventListScreen())),
              title: Text("Recently Hosted Events"),
              subtitle: Text('31 events in 5 categories'),
              trailing: ClipOval(
                child: Container(
                    height: 40.0,
                    width: 40.0,
                    color: MyColors.redLight,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CreateEventScreen())),
                      icon: Icon(Icons.add),
                      color: MyColors.red,
                      tooltip: "Create New Events",
                    )),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          createdEventCount != 0
              ? Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  height: 150.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      EventViewItem(
                          Icons.cake, 'Zahid\'s Birthday', 'Invite by Zahid'),
                      EventViewItem(FontAwesomeIcons.hollyBerry,
                          'Zahid\'s Wedding Ceremony', 'Invite by Mehedi'),
                      EventViewItem(FontAwesomeIcons.playCircle,
                          'Opening Ceremony', '4  days ago'),
                      EventViewItem(
                          Icons.wb_sunny, 'Birthday', 'Invite by Shofiul'),
                      EventViewItem(
                          Icons.wb_sunny, 'Birthday', 'Invite by Rakib'),
                    ],
                  ),
                )
              : Container(
                  height: 150.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      IconButton(onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CreateEventScreen())),
                      icon:  Icon(Icons.add_circle_outline,size: 40,color: MyColors.red.withOpacity(0.7),),),
                      Text(
                        "You Didn't Create Any Event",
                        style: TextStyle(fontSize: 17,color: Colors.grey)
                      )
                    ],
                  ),
                ),
        ],
      ),
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(10.0),
                    topRight: const Radius.circular(10.0))),
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: Icon(LineAwesomeIcons.gear),
                  title: Text('Settings'),
                  onTap: (){
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            Settings()));
                  },
                ),
                ListTile(
                    leading: Icon(LineAwesomeIcons.edit),
                    title: Text('Edit Profile'),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              EditProfileScreen()));
                    }),
                ListTile(
                    leading: Icon(LineAwesomeIcons.magic),
                    title: Text('Edit My Wish List'),
                    onTap: (){
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => MyWishListScreen()));}
                    ),
                ListTile(
                    leading: Icon(LineAwesomeIcons.list),
                    title: Text('My Activity'),
                    onTap: () {  Navigator.of(context).pop(); Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => UserActivityList()));}
                    ),
                ListTile(
                    leading: Icon(LineAwesomeIcons.power_off),
                    title: Text('Log Out'),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/login', (Route<dynamic> route) => false);
                    }),
              ],
            ),
          ),
        );
      },
    );
  }
}
