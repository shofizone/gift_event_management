import 'package:bgifter/models/gift_product.dart';
import 'package:bgifter/screens/all_products_category_screen.dart';
import 'package:bgifter/screens/cart.dart';
import 'package:bgifter/screens/my_wish_list_screen.dart';
import 'package:bgifter/screens/product_details_screen.dart';
import 'package:bgifter/screens/products_in_group.dart';
import 'package:bgifter/screens/search_screen.dart';
import 'package:bgifter/screens/settings.dart';
import 'package:bgifter/widgets/product_list_item.dart';
import 'package:bgifter/widgets/shop_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:bgifter/util/my_colors.dart';

class WishScreen extends StatefulWidget {
  @override
  _WishScreenState createState() => _WishScreenState();
}

GiftProduct giftProduct = new GiftProduct();


var images = [
  'https://i01.appmifile.com/webfile/globalimg/Iris/C3G-Banner-PC.jpg',
  'https://images-eu.ssl-images-amazon.com/images/G/31/img18/Jew/Jan/Vday/pc/final-desktop_08._CB489610913_.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqfbSgkq4ih27E6ffaa8K6AWHdOvIidiK6dB-CsJ7MC6WJiNX8Kw',
  'https://img.giftstoindia24x7.com/Pictures/chapter/chao_bengali_new_year_gftIdeas.jpg',
  'https://images-eu.ssl-images-amazon.com/images/G/31/img18/Jew/Jan/Vday/pc/final-desktop_08._CB489610913_.jpg',
  'https://i.ibb.co/4PMFytC/web-zuerich-home-topevents-1600x900.jpg',
];


class _WishScreenState extends State<WishScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var _searchQuery;
    return Scaffold(
        appBar: AppBar(
          iconTheme: new IconThemeData(color: Colors.white),
          title: Text(
            "Gift Shop",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: MyColors.defaultAppColor,
          actions: <Widget>[
            IconButton(
              onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>Cart())),
              icon: Icon(Icons.shopping_cart),
            ),
            IconButton(
              onPressed: () {_settingModalBottomSheet(context);},
              icon: Icon(Icons.more_vert),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              SizedBox(height: 30.0,),
              ListTile(title: Text('Categories',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
              ListTile(title: Text('Category One',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),),
              ListTile(title: Text('Category Two',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),),

            ],
          ),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              backgroundColor: MyColors.defaultAppColor,
             automaticallyImplyLeading: false,
              title: Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: TextField(
                          onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>SearchScreen())),
                          controller: _searchQuery,
                          style: TextStyle(
                            color: MyColors.red,
                          ),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.search,
                                color: MyColors.red,
                              ),
                              hintText: "Search Your Gifts",
                              hintStyle: TextStyle(color: Colors.grey)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                SizedBox(
                  height: 16.0,
                ),
                ShopSlider(images),
              //  _buildImageSlider(),
                SizedBox(height: 16.0,),
                _buildOptionBar(),
                SizedBox(height: 16.0,),
                GiftItemsList(),
                SizedBox(
                  height: 16.0,
                ),
                _buildTopCategories(),
              ]),
            ),
          ],
        ));
  }

  _buildImageSlider() {
    int itemNumber = images.length;
    TabController imagesController =
        TabController(length: itemNumber, vsync: this);

    return Container(
      height: 120.0,
      child: Center(
        child: DefaultTabController(
          length: itemNumber,
          child: Stack(
            children: <Widget>[
              TabBarView(
                controller: imagesController,
                children: List<Widget>.generate(itemNumber, (int index) {
                  return InkWell(
                    onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>ProductsInGroups())),
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Container(
                          width: 350.0,
                          margin: EdgeInsets.symmetric(vertical: 5.0),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(color: Colors.black, blurRadius: 4),
                            ],
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                                image: CachedNetworkImageProvider(images[index]), fit: BoxFit.cover),
                            color: Colors.grey,
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

_buildOptionBar(){
    return Container(
      height: 100.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          OptionBarItem("All Categories",Colors.red,Icons.offline_bolt,(){Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>AllProductsCategory()));}),
          OptionBarItem("Exclussive Gifts",Colors.blue,Icons.card_giftcard,(){Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>ProductsInGroups()));}),
          OptionBarItem("Friends Wishes",Colors.green,Icons.star,(){Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>ProductsInGroups()));}),





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
                  onTap: (){
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            Settings()));
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

class GiftItemsList extends StatelessWidget {
  const GiftItemsList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text(
                'Featured Gifts',
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.0),
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

class OptionBarItem extends StatelessWidget {
  final name;
  final icon;
  final color;
  final action;


  OptionBarItem(this.name,  this.color,this.icon, this.action);

  @override
  Widget build(BuildContext context) {
    return   Container(
      width: 70.0,
      child: InkWell(
        onTap: action,
        child: Column(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: color,
              radius: 25.0,
              child: Icon(icon),
            ),
            Flexible(child: Text(name,softWrap: true,maxLines: 2,textAlign: TextAlign.center,)),
          ],
        ),
      ),
    );
  }
}
