import 'package:bgifter/screens/login_screen.dart';
import 'package:bgifter/screens/main_home_screen.dart';
import 'package:bgifter/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


//void main() => runApp(MyApp());

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(MyApp());
  });
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          title: TextStyle(fontFamily:"Roboto", fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
          primarySwatch: Colors.red,
          accentColor: Colors.redAccent,
      ),
      home: LoginPage(),
      routes: {
        "/login": (_) =>  LoginPage(),
        "/home": (_) =>  MainHomeScreen(),
      },
    );
  }
}
