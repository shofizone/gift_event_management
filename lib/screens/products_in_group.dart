import 'package:bgifter/screens/my_wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:bgifter/util/my_colors.dart';


class ProductsInGroups extends StatefulWidget {
  @override
  _ProductsInGroupsState createState() => _ProductsInGroupsState();
}

var popupMenuChoices=[
  "Home",
  "Back",
];


class _ProductsInGroupsState extends State<ProductsInGroups> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.white),
        title: Text(
          "Products",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: MyColors.defaultAppColor,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
          ),


         PopupMenuButton<String>(
           onSelected: _popupMenuActions,
           itemBuilder: (BuildContext context){
             return popupMenuChoices.map((String choice){
               return PopupMenuItem<String>(
                 value: choice,
                 child: Text(choice),
               );

             }).toList();

           },
         ),
        ],
      ),
    );
  }
  _popupMenuActions(String choice){
    if(choice == "Home"){
      Navigator.of(context).pushNamedAndRemoveUntil(
          '/home', (Route<dynamic> route) => false);

    }else if(choice == "Back"){
      Navigator.of(context).pop();

    }
  }
}
