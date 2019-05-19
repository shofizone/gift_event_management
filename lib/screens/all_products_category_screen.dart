
import 'package:flutter/material.dart';
import 'package:bgifter/util/my_colors.dart';

class AllProductsCategory extends StatefulWidget {
  @override
  _AllProductsCategoryState createState() => _AllProductsCategoryState();
}

class _AllProductsCategoryState extends State<AllProductsCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.white),
        title: Text(
          "All Categories",
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


          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
    );
  }
}
