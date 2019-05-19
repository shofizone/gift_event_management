import 'dart:async';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:bgifter/util/my_colors.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

//Iterable<Contact> _contacts;
List<Contact> _contactList;
int count = 0;

class _ContactScreenState extends State<ContactScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getContactReadPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        iconTheme: new IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: MyColors.defaultAppColor,
      ),
      body: _contactList == null
          ? Center(child: SpinKitFadingCircle(
        color: Colors.orange,
        size: 50.0,
      ),)
          : ListView.builder(
        shrinkWrap: true,
              itemCount: _contactList.length,
              itemBuilder: (context, int index) {
                return ListTile(
                  onTap: (){},
                  leading: CircleAvatar(child: Icon(LineAwesomeIcons.user,color: Colors.white,),backgroundColor: Colors.deepOrange,),
                  title: Text(_contactList[index].displayName),
                  subtitle: Text((_contactList[index].phones).isNotEmpty?(_contactList[index].phones).first.value.replaceAll('-','').trim():''),
                );
              },         //((_contactList[index].phones).toList())
            ),
    );
  }

  _getContactReadPermission() async {
    bool contactPermissionStatus =
        await SimplePermissions.checkPermission(Permission.ReadContacts);
    if (!contactPermissionStatus) {
      PermissionStatus status =
          await SimplePermissions.requestPermission(Permission.ReadContacts);
      if (status == PermissionStatus.authorized) {
        _getContacts();
      }
    } else {
      _getContacts();
    }
  }

  _getContacts() async {
    var contacts = await ContactsService.getContacts();
    print("Contact");

    setState(() {
      _contactList = List<Contact>.of(contacts);
    });


//    for (var index in _contacts) {
//      Contact c = index;
//      print(c.displayName);
//      for (var index in c.phones) {
//        var c = index;
//        print(c.value);
//      }
//    }
  }
}

class ContactApp {
  String name;
  String phone;

  ContactApp({this.name, this.phone});
}
