import 'package:bgifter/models/gift_product.dart';
import 'package:bgifter/widgets/product_list_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bgifter/util/my_colors.dart';
class MyWishListScreen extends StatefulWidget {
  @override
  _MyWishListScreenState createState() => _MyWishListScreenState();
}

GiftProduct giftProduct = new GiftProduct();


var profileImage = CachedNetworkImageProvider(
    "https://i.pinimg.com/originals/52/86/29/528629803cfb99f88666c272e69e75b2.jpg");





class _MyWishListScreenState extends State<MyWishListScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<String> items = [
    "1 Demo Gift Pack One For All",
    "2 Demo Gift Pack One For All",
    "3 Demo Gift Pack One For All",
    "4 Demo Gift Pack One For All",
    "5 Demo Gift Pack One For All",
    "6 Demo Gift Pack One For All",
    "7 Demo Gift Pack One For All",
    "8 Demo Gift Pack One For All",

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: GradientAppBar(
        leading: IconButton(icon:Icon( Icons.arrow_back_ios,color: Colors.white,), onPressed: ()=> Navigator.of(context).pop()),
        title: Text("My Wish List",style: TextStyle(color: Colors.white),),
        backgroundColorStart:   Color(0xFFD62E63),
        backgroundColorEnd:  Color(0xFFFD9157),
      ),

      body: ListView(
        primary: true,
        children: <Widget>[
          ListTile(
            title: Text("My Wish List",),
            subtitle: Text('31 Wishes in 5 categories'),
            trailing: ClipOval(
              child: Container(
                  height: 40.0,
                  width: 40.0,
                  color: MyColors.orangeLight,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(LineAwesomeIcons.edit),
                    color: MyColors.orange,
                    tooltip: "Add New Wish",
                  )),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: items.length,
              itemBuilder: (context,i){
              String item = items[i];
              return Dismissible(
                key: Key(UniqueKey().toString()),
                onDismissed: (DismissDirection dir){
                  setState(() {
                    this.items.removeAt(i);
                    Scaffold.of(context).showSnackBar(
                      SnackBar(content: dir == DismissDirection.startToEnd?Text("Item Deleted"):Text("Send Gift"),
                      action: SnackBarAction(label: "UNDO", onPressed: (){
                        setState(() {
                          this.items.insert(i, item);
                        });
                      }),)
                    );
                  });
                },
                background: Container(
                  child: Icon(Icons.delete,color: Colors.white,),
                  color: Colors.red,
                  alignment: Alignment.centerLeft,
                ),
                secondaryBackground: Container(
                  child: Icon(Icons.send,color: Colors.white,),
                  color: Colors.green,
                  alignment: Alignment.centerRight,
                ),
                child: ListTile(
                  onTap: (){},
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("images/bgifter.png")),
                        color: Colors.grey
                    ),
                  ),
                  title: Text("Demo Gift Pack One For All"),
                  subtitle: Text("Price 400 ৳"),
                  trailing: IconButton(icon: Icon(FontAwesomeIcons.ellipsisH), onPressed: (){_buildItemBottomSheet(context);}),
                ),
              );

              }
          )




        ],

      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){},
        tooltip: "Edit Wish",
        child: Icon(Icons.add),
      ),

    );

  }
  _buildWishListItem(){
    return Container(
      child: ListTile(
        onTap: (){},
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("images/bgifter.png")),
            color: Colors.grey
          ),
        ),
        title: Text("Demo Gift Pack One For All"),
        subtitle: Text("Price 400 ৳"),
        trailing: IconButton(icon: Icon(FontAwesomeIcons.ellipsisH), onPressed: (){_buildItemBottomSheet(context);}),
      ),
    );
  }

  void _buildItemBottomSheet(context) {
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
                  leading: Icon(FontAwesomeIcons.minusCircle),
                  title: Text('Remove'),
                  onTap: (){
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



class WishItemList extends StatelessWidget {
  const WishItemList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          SizedBox(height: 16.0),
          FittedBox(child: ProductsListItem(dual: true,)),
          FittedBox(child: ProductsListItem(dual: true,)),
          FittedBox(child: ProductsListItem(dual: true,)),
          FittedBox(child: ProductsListItem(dual: true,)),
          FittedBox(child: ProductsListItem(dual: true,)),

        ],
      ),
    );
  }


}


