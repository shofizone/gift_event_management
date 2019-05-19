import 'package:bgifter/models/gift_product.dart';
import 'package:bgifter/screens/cart.dart';
import 'package:bgifter/widgets/product_list_item.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:bgifter/util/my_colors.dart';

class ProductDetailsScreen extends StatefulWidget {
  final GiftProduct product;

  ProductDetailsScreen(this.product);

  @override
  _ProductDetailsScreenState createState() =>
      _ProductDetailsScreenState(product);
}

var defaultAstImg = "images/bgifter.png";
var rating = 0.0;



class _ProductDetailsScreenState extends State<ProductDetailsScreen>
    with TickerProviderStateMixin {
  GiftProduct product;

  _ProductDetailsScreenState(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: InkWell(
              onTap: ()=>Navigator.of(context).pop(),
              child: Container(
                margin: EdgeInsets.all(10),
                child: Icon(Icons.arrow_back),
                decoration: BoxDecoration(
                  color: MyColors.defaultAppColor.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20)
                ),
              ),
            ),
            elevation: 0.0,
            backgroundColor: MyColors.defaultAppColor,
            expandedHeight: 300,
            floating: false,
            pinned: true,
            actions: <Widget>[
              InkWell(
                onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>Cart())),
                child: CircleAvatar(
                  radius: 18.0,
                  backgroundColor: MyColors.defaultAppColor.withOpacity(0.7),
                  child: Container(
                    child: Icon(Icons.shopping_cart,color: Colors.white,),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                child: InkWell(
                  onTap: (){
                    _settingModalBottomSheet(context);
                  },
                  child: CircleAvatar(
                    radius: 18.0,
                    backgroundColor: MyColors.defaultAppColor.withOpacity(0.7),
                    child: Container(
                      child: Icon(Icons.more_vert,color: Colors.white,),
                    ),
                  ),
                ),
              ),

            ],
            flexibleSpace: FlexibleSpaceBar(
              background:  _buildProductImagesWidgets(),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            _buildProductDetailsPage(context),
          ])),
        ],
      ),
    );
  }

  _buildProductDetailsPage(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Card(
      elevation: 4.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildPriceWidgets(),
          SizedBox(height: 12.0),
          _buildProductTitleWidget(),
          SizedBox(height: 12.0),
          _buildProductRating(),
          SizedBox(height: 12.0),
          _buildProductColor(),
          SizedBox(height: 12.0),
          _buildDivider(screenSize),
          SizedBox(height: 12.0),
          _buildFurtherInfoWidget(),
          SizedBox(height: 12.0),
          _buildDivider(screenSize),
          SizedBox(height: 12.0),
          _buildSizeChartWidgets(),
          SizedBox(height: 12.0),
       //   _buildDetailsAndMaterialWidgets(),
          SizedBox(height: 12.0),
          _buildStyleNoteHeader(),
          SizedBox(height: 6.0),
          _buildDivider(screenSize),
          SizedBox(height: 4.0),
          _buildStyleNoteData(),
          SizedBox(height: 20.0),
          _buildMoreInfoHeader(),
          SizedBox(height: 6.0),
          _buildDivider(screenSize),
          SizedBox(height: 4.0),
          _buildMoreInfoData(),
          SizedBox(height: 6.0),
          _getRecommendationProduct(),
          SizedBox(height: 24.0),
        ],
      ),
    );
  }

  _buildDivider(Size screenSize) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.grey[600],
          width: screenSize.width,
          height: 0.25,
        ),
      ],
    );
  }

  _buildProductImagesWidgets() {
    TabController imagesController =
        TabController(length: product.images.length, vsync: this);

    return Container(
      child: Center(
        child: DefaultTabController(
          length: product.images.length,
          child: Stack(
            children: <Widget>[
              TabBarView(
                controller: imagesController,
                children:
                    List<Widget>.generate(product.images.length, (int index) {
                  return Image(
                    image: product.images[index],
                    fit: BoxFit.cover,
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

  _buildPriceWidgets() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "৳${product.price}",
            style: TextStyle(
                fontSize: 20.0, color: MyColors.red, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(
                width: 8.0,
              ),
              Text(
                "৳${product.price}",
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
                "-1% Off",
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.blue[700],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildProductTitleWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        child: Text(
          //name,
          product.name,
          style: TextStyle(fontSize: 20.0, color: Colors.black),
        ),
      ),
    );
  }

  _buildProductRating() {
    return Container(
      child: SmoothStarRating(
        allowHalfRating: true,
        onRatingChanged: (v) {
          setState(() {
            rating = v;
          });
        },
        starCount: 5,
        rating: rating,
        size: 20.0,
        color: MyColors.orange,
        borderColor: MyColors.orange,
      ),
    );
  }

  _buildProductColor() {
    var selected;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(child: Text('Color'),padding: EdgeInsets.all(10.0),),
        Row(
          children: <Widget>[
            InkWell(
              onTap: (){setState(() {

              });},
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 30,
                width: 30,
                color: Colors.blue,
              ),
            ),
            InkWell(
              onTap: (){setState(() {

              });},
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 30,
                width: 30,
                color: Colors.black,
              ),
            ),
            InkWell(
              onTap: (){setState(() {

              });},
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 30,
                width: 30,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ],
    );
  }

  _buildFurtherInfoWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.local_offer,
            color: Colors.grey[500],
          ),
          SizedBox(
            width: 12.0,
          ),
          Text(
            "Tap to get further info",
            style: TextStyle(
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  _buildSizeChartWidgets() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.straighten,
                color: Colors.grey[600],
              ),
              SizedBox(
                width: 12.0,
              ),
              Text(
                "Size",
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          Text(
            "SIZE CHART",
            style: TextStyle(
              color: Colors.blue[400],
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }

  _buildDetailsAndMaterialWidgets() {
    TabController tabController = new TabController(length: 2, vsync: this);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TabBar(
            controller: tabController,
            tabs: <Widget>[
              Tab(
                child: Text(
                  "DETAILS",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "MATERIAL & CARE",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            height: 60.0,
            child: TabBarView(
              controller: tabController,
              children: <Widget>[
                Text(
                  "76% acrylic, 19% polyster, 5% metallic yarn Hand-wash cold",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                Text(
                  "86% acrylic, 9% polyster, 1% metallic yarn Hand-wash cold",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildStyleNoteHeader() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12.0,
      ),
      child: Text(
        "STYLE NOTE",
        style: TextStyle(
          color: Colors.grey[800],
        ),
      ),
    );
  }

  _buildStyleNoteData() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12.0,
      ),
      child: Text(
        product.description == null
            ? "Details unavailable"
            : product.description,
        style: TextStyle(
          color: Colors.grey[600],
        ),
      ),
    );
  }

  _buildMoreInfoHeader() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12.0,
      ),
      child: Text(
        "MORE INFO",
        style: TextStyle(
          color: Colors.grey[800],
        ),
      ),
    );
  }

  _buildMoreInfoData() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12.0,
      ),
      child: Text(
        "Product Code: ${product.id}\nTax info: Applicable GST will be charged at the time of chekout",
        style: TextStyle(
          color: Colors.grey[600],
        ),
      ),
    );
  }

  _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(
          color: Colors.black,
          blurRadius: 6.0
        )]
      ),
      width: MediaQuery.of(context).size.width,
      height: 40.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              onPressed: () {},
              color: Colors.blue,
              child: Center(
                child: Text(
                  "Add to My Wish",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),

          Expanded(
            child: RaisedButton(
              onPressed: () {},
              color: MyColors.orange,
              child: Center(
                child: Text(
                  "Send Gift",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: RaisedButton(
              onPressed: () {},
              color: Color(0xFFEF5650),
              child: Center(
                child: Text(
                  "Add to Cart",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _getRecommendationProduct() {
    return Column(
      children: <Widget>[
        Divider(
          height: 2.0,
        ),
        ListTile(
          title: Text("Recommendation"),
          trailing: InkWell(child: Text("View More",style: TextStyle(color: MyColors.orange),),onTap: (){},),
        ),
        SizedBox(
          height: 8.0,
        ),
        Column(
          children: <Widget>[
            FittedBox(child: ProductsListItem(dual: true,)),
            FittedBox(child: ProductsListItem(dual: true,)),
            FittedBox(child: ProductsListItem(dual: true,)),


          ],
        )
      ],
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
                  leading: Icon(LineAwesomeIcons.home),
                  title: Text('Back to Home'),
                  onTap: (){
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/home', (Route<dynamic> route) => false);
                  },
                ),
                ListTile(
                  leading: Icon(LineAwesomeIcons.magic),
                  title: Text('Add to my wish list'),
                  onTap: (){
                    Navigator.of(context).pop();
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
