import 'dart:async';

import 'package:bgifter/screens/products_in_group.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:bgifter/util/my_colors.dart';
class ShopSlider extends StatefulWidget {
  var images;

  ShopSlider(this.images);

  @override
  _ShopSliderState createState() => _ShopSliderState(images);
}

class _ShopSliderState extends State<ShopSlider> with TickerProviderStateMixin{
  var images;
  int itemNumber;
  TabController imagesController;
  _ShopSliderState(this.images);

initState(){
  super.initState();
  itemNumber = images.length;
  imagesController = TabController(length: itemNumber, vsync: this,initialIndex: 0,);
  Timer.periodic(Duration(seconds: 5), (timer){
    if(imagesController.index< itemNumber-1){
      imagesController.index++;
    }else{
      imagesController.index=0;
    }

  });
}

  @override
  Widget build(BuildContext context) {
    return _buildImageSlider();
  }


  _buildImageSlider() {
    return Container(
      height: 140.0,
      child: Center(
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
                        width: MediaQuery.of(context).size.width-30,

                        margin: EdgeInsets.symmetric(vertical: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          image: DecorationImage(
                              image:CachedNetworkImageProvider(images[index]) , fit: BoxFit.cover),
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
                selectedColor: MyColors.defaultAppColor,
                color: MyColors.orangeLight.withOpacity(0.3),
              ),
            )
          ],
        ),
      ),
    );
  }

}
