import 'package:bgifter/models/event.dart';
import 'package:bgifter/models/gift_product.dart';
import 'package:bgifter/screens/cart.dart';
import 'package:bgifter/screens/event_details.dart';
import 'package:bgifter/screens/invitations_all.dart';
import 'package:bgifter/screens/my_wish_list_screen.dart';
import 'package:bgifter/screens/products_in_group.dart';
import 'package:bgifter/screens/search_screen.dart';
import 'package:bgifter/screens/settings.dart';
import 'package:bgifter/screens/user_event_list.dart';
import 'package:bgifter/widgets/custom_shape_clipper_home.dart';
import 'package:bgifter/widgets/event_view_item.dart';
import 'package:bgifter/widgets/product_list_item.dart';
import 'package:bgifter/widgets/shop_slider.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:bgifter/util/my_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

// IMAGES
var defaultAstImg = "images/bgifter.png";
var eventCardImage =
    'https://i.ibb.co/4PMFytC/web-zuerich-home-topevents-1600x900.jpg';
var giftListViewImage =
    "https://www.signupgenius.com/cms/images/home/valentines-gift-ideas.jpg";
var recentEventCardTitle = "Birthday";
var recentEventCardSubTitle = "Hosted by Someone";
var productImages = [
  AssetImage(defaultAstImg),
  NetworkImage(
    "https://www.signupgenius.com/cms/images/home/valentines-gift-ideas.jpg",
  ),
  NetworkImage(
    "https://www.signupgenius.com/cms/images/home/valentines-gift-ideas.jpg",
  ),
  NetworkImage(
    "https://www.signupgenius.com/cms/images/home/valentines-gift-ideas.jpg",
  ),
  NetworkImage(
    "https://www.signupgenius.com/cms/images/home/valentines-gift-ideas.jpg",
  ),
];

var images = [
  'https://i01.appmifile.com/webfile/globalimg/Iris/C3G-Banner-PC.jpg',
 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqfbSgkq4ih27E6ffaa8K6AWHdOvIidiK6dB-CsJ7MC6WJiNX8Kw',
  'https://images-eu.ssl-images-amazon.com/images/G/31/img18/Jew/Jan/Vday/pc/final-desktop_08._CB489610913_.jpg',
'https://i.ibb.co/4PMFytC/web-zuerich-home-topevents-1600x900.jpg',
];

var event = new Event();

class _HomeContentState extends State<HomeContent>
    with TickerProviderStateMixin {
  var _searchQuery;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    event.eventId = "event_001";
    event.eventTitle = "Promy's 90'th Birthday Event";
    event.eventPrivacy = "Private";
    event.eventDescription = "A Event hosted by promy";
    event.eventCategory = "Birthday";
    event.startTime = "17-02-19 : 10.30 AM";
    event.endTime = "17-02-19 : 10.30 PM";
    event.location = "Dhaka,Baridhara, j Block";
    event.address = "Baridhara - J Block, Gulshan";
    event.imageUrl =
        'https://i.ibb.co/4PMFytC/web-zuerich-home-topevents-1600x900.jpg';
    event.creatorId = "user_123";
    event.creatorUserName = "promy";
    event.coHosts = [];

    GiftProduct giftProduct = new GiftProduct.dummy();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          padding: EdgeInsets.all(0),
      children: <Widget>[
        _buildTopBar(),
        // SizedBox(height: 16.0),
        // ShopSlider(images),
        SizedBox(height: 16.0),
        _buildQuickAccess(),
        SizedBox(height: 16.0),
        _buildPackages(),

        SizedBox(height: 16.0),

        _buildInvitedEvents(),
        SizedBox(height: 16.0),
        GiftItemsList(),
        SizedBox(height: 16.0),
        _buildTopCategories(),
      ],
    ));
  }

  _buildHomeScreenSlider() {
    int itemNumber = images.length;
    TabController imagesController =
        TabController(length: itemNumber, vsync: this);

    return Container(
      height: 180,
      child: Center(
        child: DefaultTabController(
          length: itemNumber,
          child: Stack(
            children: <Widget>[
              TabBarView(
                controller: imagesController,
                children: List<Widget>.generate(itemNumber, (int index) {
                  return InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            EventDetails(event))),
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                              image: CachedNetworkImageProvider(images[index]),
                            fit: BoxFit.cover,
                          )),
                        ),
//
                        Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                Colors.black.withOpacity(0.1),
                                Colors.black
                              ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Spacer(),
                              Text(
                                event.eventTitle,
                                style: TextStyle(
                                    color: MyColors.textYellow,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24.0,
                                    letterSpacing: 1.1),
                              ),
                              Text(
                                event.eventDescription,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    letterSpacing: 1.1),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
              Container(
                alignment: FractionalOffset(0.5, 0.95),
                child: TabPageSelector(
                  controller: imagesController,
                  selectedColor: MyColors.orange,
                  color: MyColors.orangeLight,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildTopBar() {
    return Stack(
      children: <Widget>[

        ClipPath(
            clipper:CustomShapeClipper(),
          child:   Container(
            height: 180.0,
            //Background
            child: Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Color(0xFFD62E63),
                          Color(0xFFFD9157),
                        ],
                    )
                  ),
                ),
                Positioned(
                  bottom: 40.0,
                  right: 130.0,
                  child: Container(
                    height: 370,
                    width: 370,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      color: Color(0x33ffffff),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 60.0,
                  left: 190.0,
                  child: Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      color: Color(0x33ffffff),
                    ),
                  ),
                ),
              ],
            ),
          ),

        ),
        Container(

          child: Column(
            children: <Widget>[
              SizedBox(height: 35.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                        onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>SearchScreen())),
                        child: Material(
                          child: Container(
                            height: 35,
                            child: Row(
                              children: <Widget>[
                                SizedBox(width: 10,),
                                Icon(Icons.search,size: 20,color: Colors.grey),
                                SizedBox(width: 4,),
                                Text("Search",style: TextStyle(color: Colors.grey,fontFamily: "Oxygen"),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Material(
                      child: Container(
                        height: 35,
                        child: IconButton(
                          onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>Cart())),
                          icon: Icon(FontAwesomeIcons.shoppingCart,size: 20,color: Colors.grey,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
             // _buildHomeScreenSlider(),
              ShopSlider(images),
            ],
          ),
        ),
      ],
    );
  }



  _buildQuickAccess() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: ListTile(
              title: Text(
                "Quick Access",
                style: TextStyle(
                    fontFamily: 'Quicksand', fontWeight: FontWeight.bold,fontSize: 20),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: GridView.count(
              shrinkWrap: true,
              primary: false,
              crossAxisCount: 3,
              childAspectRatio: 2 / 1.4,
              children: <Widget>[
                _buildQuickAccessItem(
                    "My Wishes", IconData(0xf762,fontFamily: "Font Awesome 5 Pro"), Colors.blue, () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => MyWishListScreen()));
                }),
                _buildQuickAccessItem(
                    "Friends Wishes", IconData(0xf762,fontFamily: "Font Awesome 5 Pro Solid"), Colors.deepOrange,
                    () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => MyWishListScreen()));
                }),
                _buildQuickAccessItem(
                    "My Events", IconData(0xf073,fontFamily: "Font Awesome 5 Pro"), Colors.green, () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => UserEventListScreen()));
                }),
                _buildQuickAccessItem(
                    "Exclussive Gifts", IconData(0xf79c,fontFamily: "Font Awesome 5 Pro"), Colors.pink, () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => ProductsInGroups()));
                }),
                _buildQuickAccessItem(
                    "Bye Packages", IconData(0xf49c,fontFamily: "Font Awesome 5 Pro Solid"), Colors.red, () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => ProductsInGroups()));
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildQuickAccessItem(
    String name,
    IconData icon,
    var color,
    var action,
  ) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: action,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            CircleAvatar(
              radius: 28,
              child: Icon(
                icon,
                color: Colors.white,
              ),
              backgroundColor: color,
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              name,
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  _buildPackages() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: ListTile(
              onTap: () {},
              title: Text(
                "Packages",
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
              subtitle: Text(
                "Complete packages to organize a event",
                style: TextStyle(
                    fontFamily: 'Quicksand', fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                "View All",
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                    color: MyColors.defaultAppColor,
                    fontSize: 18.0),
              ),
            ),
          ),
          GridView.count(
              crossAxisCount: 2,
            shrinkWrap: true,
            primary: false,
            children: <Widget>[
              buildPackageItem("Weding","images/wedding.png",(){}),
              buildPackageItem("Birthday","images/birthday.png",(){}),


            ],
          )

        ],
      ),
    );
  }

  buildPackageItem(String name,String imgUri,action){
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: action,
        child: Container(
         child: Image(image: AssetImage(imgUri),fit: BoxFit.contain,),
        ),
      ),
    );
  }

  _buildInvitedEvents() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => InvitationsAll()));
              },
              title: Text(
                "Invitations",
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
              subtitle: Text(
                "You Have total 21 invitations",
                style: TextStyle(
                    fontFamily: 'Quicksand', fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                "View All",
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                    color: MyColors.defaultAppColor,
                    fontSize: 18.0),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
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
          ),
        ],
      ),
    );
  }
  _buildTopCategories() {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Text(
                  'Top Categories',
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Card(
                        child: ListTile(
                          onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>ProductsInGroups()));},
                          leading: Icon(IconData(0xf3cd,fontFamily: "Font Awesome 5 Pro Solid")),
                          title: Text("Mobile Phones"),
                          subtitle: Text("300 products"),
                        ),
                      )),
                  Expanded(
                      child: Card(
                        child: ListTile(
                          onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>ProductsInGroups()));},
                          leading: Icon(IconData(0xf390,fontFamily: "Font Awesome 5 Pro Solid")),
                          title: Text("Computers"),
                          subtitle: Text("300 products"),
                        ),
                      )),
                ],
              ),

              Row(
                children: <Widget>[
                  Expanded(
                      child: Card(
                        child: ListTile(
                          onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>ProductsInGroups()));},
                          leading: Icon(IconData(0xf6b6,fontFamily: "Font Awesome 5 Pro")),
                          title: Text("Electronics & Appliances"),
                          subtitle: Text("4100 products"),
                        ),
                      )),
                  Expanded(
                      child: Card(
                        child: ListTile(
                          onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>ProductsInGroups()));},
                          leading: Icon(IconData(0xf554 ,fontFamily: "Font Awesome 5 Pro")),
                          title: Text("Lifestyle & Personal Care"),
                          subtitle: Text("6000 Products"),
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
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
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Settings()));
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

//old slider
class EventSliderView extends StatelessWidget {
  const EventSliderView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 8.0, bottom: 16.0),
          alignment: Alignment.topLeft,
          child: Text(
            'Recent Events',
            style: TextStyle(fontSize: 22.0, color: Colors.black54),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            height: 120.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                getEventCardItem(context, event),
                getEventCardItem(context, event),
                getEventCardItem(context, event),
                getEventCardItem(context, event),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget getEventCardItem(context, Event event) {
    String title = event.eventCategory;
    String subTitle = "Hosted by ${event.creatorUserName}";
    String imgUrl = event.imageUrl;

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        height: 160.0,
        width: 350.0,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(imgUrl), fit: BoxFit.cover)),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => EventDetails(event)));
          },
          child: Stack(
            children: <Widget>[
              Container(
                height: 160.0,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.black.withOpacity(0.1), Colors.black],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Spacer(),
                    Text(
                      title,
                      style: TextStyle(
                          color: MyColors.textYellow,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                          letterSpacing: 1.1),
                    ),
                    Text(
                      subTitle,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          letterSpacing: 1.1),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

class GiftItemsList extends StatelessWidget {
  const GiftItemsList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
//     Text("Invitations",style: TextStyle(fontFamily: 'Quicksand',fontWeight: FontWeight.bold,fontSize: 20.0),),
      children: <Widget>[
        Container(
          child: ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => ProductsInGroups()));
            },
            title: Text(
              'Popular Gifts',
              style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            trailing: Text(
              "View More",
              style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: MyColors.defaultAppColor),
            ),
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        FittedBox(
            child: ProductsListItem(
          dual: true,
        )),
        FittedBox(
            child: ProductsListItem(
          dual: true,
        )),
        FittedBox(
            child: ProductsListItem(
          dual: true,
        )),
      ],
    );
  }
}
