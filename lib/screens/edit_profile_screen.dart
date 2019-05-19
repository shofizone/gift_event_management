import 'dart:io';
import 'package:bgifter/screens/my_wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:bgifter/util/my_colors.dart';
class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}



var eventPrivacy = ['Male', 'Female', 'Others'];
String selectedDropdownItm = eventPrivacy[0];
//String _ctgry = '';

class _EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new
  GlobalKey<ScaffoldState>();


  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Edit Profile"),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesomeIcons.check,
              color: Colors.green,
            ),
            onPressed: ()=>Navigator.pop(context),
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {_settingModalBottomSheet(context);},
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 8.0,
                  ),
                  Container(
                    height: 105.0,
                    width: 105.0,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 100.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                                image:  _image!=null?AssetImage(_image.path):profileImage, fit: BoxFit.cover),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 10.0,
                              ),
                            ],
                          ),
                        ),
                        Container(
                            alignment: Alignment(1.1, 1.0),
                          child: CircleAvatar(
                            backgroundColor: MyColors.orange,
                            child: IconButton(
                                icon: Icon(
                                  LineAwesomeIcons.camera,
                                  color: Colors.white,

                                ),
                                onPressed: () { getImage();}),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),


                  Container(
//                    padding: EdgeInsets.only(
//                        left: 5.0, top: 2.0, bottom: 5.0, right: 5.0),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: const InputDecoration(
                            icon: const Icon(LineAwesomeIcons.user),
                            hintText: 'eg. Rakib Ahmed',
                            labelText: 'Name',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18.0),
                            //fillColor: Colors.red,
                          ),
                          validator: (String value) {
                            if (value.trim().isEmpty) {
                              return 'Name is required';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.text,
                          style: new TextStyle(
                              fontFamily: "Poppins",
                              color: Colors.black,
                              fontSize: 20.0),
                        ),
                        const SizedBox(height: 5.0),
                        TextFormField(
                          decoration: const InputDecoration(
                            icon: const Icon(LineAwesomeIcons.envelope_o),
                            hintText: 'eg. email@example.com',
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18.0),
                            //fillColor: Colors.black,
                          ),
                          validator: (String value) {
                            if (value.trim().isEmpty) {
                              return 'Email is required';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          style: new TextStyle(
                              fontFamily: "Poppins",
                              color: Colors.black,
                              fontSize: 20.0),
                        ),
                        const SizedBox(height: 5.0),
                        TextFormField(
                          decoration: const InputDecoration(
                            icon: const Icon(LineAwesomeIcons.phone),
                            hintText: 'eg. +8801XXXXXX',
                            labelText: 'Phone Number',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18.0),
                            //fillColor: Colors.black,
                          ),
                          validator: (String value) {
                            if (value.trim().isEmpty) {
                              return 'Phone number is required';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.phone,
                          style: new TextStyle(
                              fontFamily: "Poppins",
                              color: Colors.black,
                              fontSize: 20.0),
                        ),

                        FormField(
                          builder: (FormFieldState state) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                icon: const Icon(LineAwesomeIcons.transgender),
                                labelText: 'Gender',
                                fillColor: Colors.black,
                              ),
                              baseStyle: TextStyle(fontSize: 20.0),
                              isEmpty: selectedDropdownItm == '',
                              child: new DropdownButtonHideUnderline(
                                child: new DropdownButton(
                                  value: selectedDropdownItm,
                                  isDense: true,
                                  onChanged: (String newValue) {
                                    setState(() {
                                      //newContact.favoriteColor = newValue;
                                      selectedDropdownItm = newValue;
                                      state.didChange(newValue);
                                    });
                                  },
                                  items: eventPrivacy.map((String value) {
                                    return new DropdownMenuItem(
                                      value: value,
                                      child: new Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            );
                          },
                        ),

                        //details text fields---------------------------------------------------------------------------
                        const SizedBox(height: 5.0),
                        Container(
                          child: TextFormField(
                            decoration: const InputDecoration(
                                icon: const Icon(LineAwesomeIcons.comment_o),
                                hintText: 'Hey there i\'m using Gifter',
                                labelText: 'Status',
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 18.0),
                                //fillColor: Colors.black,
                                ),
                            keyboardType: TextInputType.multiline,
                            style: new TextStyle(
                                fontFamily: "Poppins",
                                color: Colors.black,
                                fontSize: 20.0),
                          ),
                        ),

                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),

            
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }


  void _settingModalBottomSheet(context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc){
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
                    leading: Icon(Icons.save),
                      title:  Text('Save'),
                      onTap: () => {}
                  ),
                   ListTile(
                    leading:  Icon(Icons.backspace),
                    title:  Text('Discard'),
                    onTap: () => {},
                  ),
                ],
              ),
            ),
          );
        },

    );
  }

}
