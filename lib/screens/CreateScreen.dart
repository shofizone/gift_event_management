import 'package:bgifter/screens/create_event_screen.dart';
import 'package:bgifter/screens/my_wish_list_screen.dart';
import 'package:bgifter/util/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class CreateScreen extends StatefulWidget {
  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        iconTheme: new IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColorStart:   Color(0xFFD62E63),
        backgroundColorEnd:  Color(0xFFFD9157),
        elevation: 0.0,
        title: Text("Create",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 8.0,),
          Container(
            margin: EdgeInsets.all(8.0),
            height: 50,
            child: Container(
              decoration: BoxDecoration(

                gradient: LinearGradient(
                    colors: [
                    Color(0xFFD62E63),
                  Color(0xFFFD9157),
                    ]
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: InkWell(
                onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>CreateEventScreen()));},
                child: Center(
                  child: Text(
                    "Create New Event",
                    style: TextStyle(
                      fontSize: 18,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.all(8.0),
            height: 50,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0xFFD62E63),
                      Color(0xFFFD9157),
                    ]
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: InkWell(
                onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>MyWishListScreen()));},
                child: Center(
                  child: Text(
                    "Modify My Wish List",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
