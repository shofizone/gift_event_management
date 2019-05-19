import 'package:bgifter/models/gift_product.dart';
import 'package:bgifter/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:bgifter/util/my_colors.dart';


class ProductsListItem extends StatelessWidget {
  final GiftProduct product = new GiftProduct.dummy();
   final bool dual;
  ProductsListItem({this.dual});


  @override
  Widget build(BuildContext context) {




    return (dual != null)?Row(crossAxisAlignment:CrossAxisAlignment.center,children: <Widget>[
      _buildProductItemCard(context),
      SizedBox(width: 5.0,),
      _buildProductItemCard(context),
    ],):Container(child: _buildProductItemCard(context),margin: EdgeInsets.only(right: 8.0),);
  }

  _buildProductItemCard(BuildContext context, ) {
    return InkWell(
      onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>ProductDetailsScreen(product))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Image(image: product.images[0],fit: BoxFit.cover,),
            height: 150.0,
            width: MediaQuery.of(context).size.width / 2.2,
          ),
          SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Flexible(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.35,
                    child: Text(
                       product.name,
                        maxLines: null,
                        softWrap: true,
                        style: TextStyle(fontSize: 16.0, ),
                      ),
                  ),
                ),

                SizedBox(
                  height: 2.0,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "\$${product.price}",
                      style: TextStyle(fontSize: 16.0, color: MyColors.red,fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[

                        Text(
                          "\$${product.price}",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          "${"2"}% off",
                          style: TextStyle(fontSize: 12.0, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}