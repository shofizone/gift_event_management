import 'package:bgifter/models/event.dart';
import 'package:bgifter/models/gift_product.dart';
import 'package:bgifter/screens/my_wish_list_screen.dart';
import 'package:bgifter/screens/people_list_of_events.dart';
import 'package:bgifter/screens/product_details_screen.dart';
import 'package:bgifter/widgets/product_list_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:bgifter/util/my_colors.dart';

class EventDetails extends StatefulWidget {
  final Event event;

  EventDetails(this.event);

  @override
  _EventDetailsState createState() => _EventDetailsState(event);
}

bool _managerAccess = false;
GiftProduct giftProduct = new GiftProduct.dummy();


var eventImage =
    'https://i.ibb.co/4PMFytC/web-zuerich-home-topevents-1600x900.jpg';
var fkaTwigsImage =
    'https://upload.wikimedia.org/wikipedia/en/thumb/7/77/FKA_twigs_-_LP1.png/220px-FKA_twigs_-_LP1.png';

class _EventDetailsState extends State<EventDetails> {
  final Event event;

  _EventDetailsState(this.event);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          primary: true,
          slivers: <Widget>[
            SliverAppBar(
              iconTheme: new IconThemeData(color: Colors.white),
              pinned: true,
              floating: false,
              elevation: 0.0,
              backgroundColor: MyColors.red,
              expandedHeight: 220,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: <Widget>[
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: CachedNetworkImageProvider(
                          event.imageUrl,
                        ),fit: BoxFit.cover )

                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Spacer(),
                          Container(
                            color: Colors.black54,
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(15,8,5,8),
                                  child: Icon(
                                    Icons.access_time,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                                Text(
                                  "24, March 2019 at 1.30 AM, Sunday",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                ListTile(
                  title: Text(
                    event.eventTitle,
                    style: TextStyle(fontSize: 18,fontFamily: "Quicksand",fontWeight: FontWeight.bold),
                  ),
                  trailing: IconButton(icon: Icon(Icons.favorite,color: Colors.redAccent,), onPressed: (){}),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15,8,5,8),
                      child:  Icon(IconData(0xf041,fontFamily: "Font Awesome 5 Pro Solid",),size: 15,),
                    ),
                    Text(
                      event.address,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          _managerAccess
                              ? getSelectOptionCard(
                                  "Invite",
                                  LineAwesomeIcons.envelope,
                                  Colors.black,
                                  () {})
                              : getSelectOptionCard(
                                  "Going",
                                  FontAwesomeIcons.solidCheckCircle,
                              Colors.black,
                                  () {}),
                          _managerAccess
                              ? getSelectOptionCard("Edit",
                                  LineAwesomeIcons.edit, Colors.black, () {})
                              : getSelectOptionCard(
                                  "Thinking",
                              FontAwesomeIcons.exclamationCircle,
                                   Colors.black,
                                  () {}),
                          getSelectOptionCard("Share",
                              FontAwesomeIcons.shareAlt, Colors.black, () {}),
                          getSelectOptionCard("More",
                              FontAwesomeIcons.ellipsisH, Colors.black, () {
                            _settingModalBottomSheet(context);
                          }),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          child: InkWell(
                        onTap: () {
                          if (_managerAccess)
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    PeopleListOfEvents()));
                        },
                        child: ListTile(
                          leading: Icon(IconData(0xf274,fontFamily: "Font Awesome 5 Pro",),),
                          title: Text(!_managerAccess
                              ? "300 Peoples are Going"
                              : "300 Peoples Comming"),
                          subtitle: Text(!_managerAccess
                              ? "Rakib , Zahid and 15 other friends are going"
                              : "90 are Not Comming and 750 are Thinking!"),
                        ),
                      )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          child: ListTile(
                            leading: Icon(IconData(0xf017,fontFamily: "Font Awesome 5 Pro",),),
                        title: Text("Time"),
                        subtitle: Text(
                            "Start Time: ${event.startTime} \nEnd Time:  ${event.endTime}"),
                      )),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                          child: ListTile(
                        leading: Icon(IconData(0xf041,fontFamily: "Font Awesome 5 Pro",),),
                        title: Text("Vanue"),
                        subtitle: Text(event.eventDescription),
                      )),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                          child: ListTile(
                        title: Text("Event Details"),
                        subtitle: Text(event.eventDescription),
                      )),
                    ],
                  ),
                ),
                _managerAccess ? WishListCreator() : WishListViewer(),
                SizedBox(
                  height: 10,
                ),
              ]),
            ),
          ],
        ));
  }

  Widget getSelectOptionCard(
      String label,
      IconData icon,
      Color color,
      Function action,
      ) {
    return Expanded(
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
                  size: 25,
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
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          child: Wrap(
            children: <Widget>[
              ListTile(
                  leading: Icon(FontAwesomeIcons.solidCheckCircle),
                  title: Text('Going'),
                  onTap: () => {}),
              ListTile(
                leading: Icon(FontAwesomeIcons.exclamationCircle),
                title: Text('Thinking'),
                onTap: () => {},
              ),
              ListTile(
                leading: Icon(FontAwesomeIcons.shareAlt),
                title: Text('Share'),
                onTap: () => {},
              ),
            ],
          ),
        );
      },
    );
  }
}

class WishListCreator extends StatelessWidget {
  const WishListCreator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: <Widget>[
          Divider(
            height: 2.0,
          ),
          InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => MyWishListScreen())),
            child: ListTile(
                title: Text("My Wish List"),
                subtitle: Text('Total 31 Wishes'),
                trailing: Text(
                  "See All",
                  style: TextStyle(color: MyColors.orange, fontSize: 16.0),
                )),
          ),
          SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0.0),
            child: Container(
              height: 250.0,
              child: ListView(
                padding: EdgeInsets.all(0.0),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  FittedBox(child: ProductsListItem()),
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


}

class WishListViewer extends StatelessWidget {
  const WishListViewer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: <Widget>[
          Divider(
            height: 2.0,
          ),
          InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => MyWishListScreen())),
            child: ListTile(
              title: Text("Promy's Wish List"),
              subtitle: Text('Promi has made 31 wishes !'),
              trailing: Text("View All")
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              height: 250.0,
              child: ListView(
                padding: EdgeInsets.all(0.0),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  FittedBox(child: ProductsListItem()),
                  ProductsListItem(),
                  ProductsListItem(),
                  ProductsListItem(),
                  ProductsListItem(),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }


}
