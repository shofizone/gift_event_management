import 'package:bgifter/util/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var _searchQuery;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
          backgroundColorStart:   Color(0xFFD62E63),
          backgroundColorEnd:  Color(0xFFFD9157),
        title: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.6),width: 1.5)),
                  ),
                  child: TextField(
                    controller: _searchQuery,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                        hintText: " Search Gifts",
                        hintStyle: TextStyle(color: Colors.white)),
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
