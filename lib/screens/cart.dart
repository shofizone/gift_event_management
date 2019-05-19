import 'package:flutter/material.dart';
import 'package:bgifter/util/theme.dart' as Theme;
import 'package:bgifter/util/my_colors.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}



class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: MyColors.defaultAppColor,
        title: Text(
          "Cart",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 50.0,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Center(child: Text("Total: 3000 ৳",style: TextStyle(fontSize: 18),)),
            ),
            Expanded(
                child: Container(
                  color: MyColors.color2,
                  child: InkWell(
                    onTap: (){},
                    child: Center(
                      child: Text('Checkout',style: TextStyle(color: Colors.white,fontSize: 18),),
                    ),
                  ),
                ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          _buildListCard(),
          _buildListCard(),
          _buildListCard(),
          _buildListCard(),
          _buildListCard(),
        ],
      ),
    );
  }
  _buildListCard(){
    return Card(
      child: ListTile(
        leading: Container(
          width: 50,
          child: Image.asset("images/bgifter.png"),
        ),
        title: Text("Product Name"),
        subtitle: Row(
          children: <Widget>[
            Text("Price: 300৳",style: TextStyle(fontSize: 16,color: Colors.red),),
            Spacer(),
            Text("Quantity: 2",style: TextStyle(fontSize: 16,color: Colors.red),),
            Spacer(),

          ],
        ),
        trailing: InkWell(child: Text('Remove',style: TextStyle(color: MyColors.color2),),onTap: (){},),
      ),
    );
  }
}
