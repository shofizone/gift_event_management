import 'package:flutter/material.dart';
import 'package:bgifter/util/my_colors.dart';
import 'package:bgifter/util/theme.dart' as Theme;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bgifter/util/bubble_indiaction.dart';
class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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

        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: <Widget>[
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    color: Colors.white24,
                    image: DecorationImage(
                      image: AssetImage('images/bgifter_logo.png'),
                      fit: BoxFit.scaleDown,
                    )),
              ),
              Text("Enter phone number or email"),
              Card(
                elevation: 2.0,
                child: TextField(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16.0,
                ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Phone or Email",
                    hintStyle: TextStyle(
                         fontSize: 17.0),
                  ),

              ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
