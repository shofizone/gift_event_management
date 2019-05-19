import 'package:bgifter/screens/about_us.dart';
import 'package:bgifter/screens/notification_settings.dart';
import 'package:bgifter/screens/security_privacy_settings.dart';
import 'package:bgifter/util/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
        backgroundColor: MyColors.red,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.notifications_none),
            title: Text("Notification Setting"),
            onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>NotificationSettings())),
          ),

          ListTile(
            leading: Icon(LineAwesomeIcons.shield),
            title: Text("Security & Privacy"),
            onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>SecurityPrivacySettings())),
          ),

          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text("About us"),
            onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>AboutUs())),
          ),

          ListTile(
            leading: Icon(Icons.power_settings_new),
            title: Text("Log Out"),
            onTap: (){
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/login', (Route<dynamic> route) => false);
            },
          ),
       
        ],
      ),
    );
  }
}

