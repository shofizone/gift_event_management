import 'package:bgifter/util/my_colors.dart';
import 'package:flutter/material.dart';
class InvitationsAll extends StatefulWidget {
  @override
  _InvitationsAllState createState() => _InvitationsAllState();
}

class _InvitationsAllState extends State<InvitationsAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Invitations"),
        centerTitle: true,
        backgroundColor: MyColors.defaultAppColor,
      ),
    );
  }
}
