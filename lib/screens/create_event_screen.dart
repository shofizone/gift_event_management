import 'dart:io';

import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bgifter/util/my_colors.dart';

class CreateEventScreen extends StatefulWidget {
  @override
  _CreateEventScreenState createState() => _CreateEventScreenState();
}

var eventPrivacy = ['Private Event', 'Public Event'];
var eventCategory = ['Birthday', 'Wedding Ceremony','Opening Ceremony','Other'];
String selectedPrivacy = eventPrivacy[0];
String selectedCategory = eventCategory[0];
var eventCardImage =
    'https://i.ibb.co/4PMFytC/web-zuerich-home-topevents-1600x900.jpg';

class _CreateEventScreenState extends State<CreateEventScreen> {



  DateTime startDay = new DateTime.now();
  TimeOfDay startTime=new TimeOfDay.now();
  DateTime endDay=new DateTime.now();
  TimeOfDay endTime=new TimeOfDay.now();
//  DateTime date = new DateTime.now();
//  TimeOfDay timeOfDay = new TimeOfDay.now();

  _selectStartDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: startDay,
        firstDate: DateTime(2018),
        lastDate: DateTime(2050));
    if (picked != null && picked != startDay)
      setState(() {
        startDay = picked;
      });
  }

  _selectStartTime(BuildContext context) async {
    final TimeOfDay picked =
    await showTimePicker(context: context, initialTime: startTime);
    if (picked != null && picked != startTime)
      setState(() {
        startTime = picked;
      });
  }


  _selectEndDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: startDay,
        firstDate: DateTime(2018),
        lastDate: DateTime(2050));
    if (picked != null && picked != startDay)
      setState(() {
        endDay = picked;
      });
  }

  _selectEndTime(BuildContext context) async {
    final TimeOfDay picked =
    await showTimePicker(context: context, initialTime: startTime);
    if (picked != null && picked != startTime)
      setState(() {
        endTime = picked;
      });
  }


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
      resizeToAvoidBottomPadding: false,
      appBar: GradientAppBar(
        iconTheme: new IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColorStart:   Color(0xFFD62E63),
        backgroundColorEnd:  Color(0xFFFD9157),
        elevation: 0.0,
        title: Text("Create Event",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
      ),
      body: ListView(
        children: <Widget>[
          //event Cover
          Container(
            height: 220,
            decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: _image != null
                      ? AssetImage(_image.path)
                      : NetworkImage(eventCardImage),
                )),
            child: Center(
              child: InkWell(
                onTap: () {
                  getImage();
                },
                child: Container(
                  width: 128.0,
                  height: 39,
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 2.5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.add_to_photos,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        "Add Image",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          //Bottom of Event Cover

          //Title Block

          Container(
            margin: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 26.0),
                    hintText: "Event Title",
                  ),
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          //Time Block

          Container(
            child: Column(
              children: <Widget>[
                Row(

                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                width: 50.0,
                                child: Icon(
                                  Icons.access_time,
                                  color: Colors.grey,
                                ),
                              ),
                              InkWell(
                                child: Text(
                                    '${formatDate(startDay, [
                                      DD,
                                      '-',
                                      MM,
                                      '-',
                                      yy
                                    ])}',
                                    style: TextStyle(
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w600,color:  Colors.deepOrange)),
                                onTap: () {
                                  _selectStartDate(context);
                                },

                              ),

                              SizedBox(width: 5,),
                              Text("at",style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w600),),
                              SizedBox(width: 5,),

                              InkWell(
                                onTap: ()=> _selectStartTime(context),
                                child: Text(
                                  "${startTime.hourOfPeriod} : ${startTime.minute} ${startTime.periodOffset == 0 ? 'AM' : 'PM'}",
                                  style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.deepOrange
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: 50.0,
                              ),
                              InkWell(
                                child: Text(
                                  "${formatDate(endDay, [
                                    DD,
                                    '-',
                                    MM,
                                    '-',
                                    yy
                                  ])}",
                                  style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w600,color: Colors.deepOrange),
                                ),
                                onTap: () {
                                  _selectEndDate(context);
                                },
                              ),
                              SizedBox(width: 5,),
                              Text("at",style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w600),),
                              SizedBox(width: 5,),

                              InkWell(
                                onTap: ()=> _selectEndTime(context),
                                child: Text(
                                  "${endTime.hourOfPeriod} : ${endTime.minute} ${endTime.periodOffset == 0 ? 'AM' : 'PM'}",
                                  style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w600,
                                    color: Colors.deepOrange
                                  ),
                                  ),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),



                  ],
                ),
              ],
            ),
          ),

          //Location Block
          SizedBox(
            height: 12,
          ),

          Container(
            child: Row(
              children: <Widget>[
                Container(
                  width: 50.0,
                  child: Icon(
                    LineAwesomeIcons.map_marker,
                    color: Colors.grey,
                  ),
                ),

                Container(
                  child: Expanded(
                    child: TextField(
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: "Location",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //Description Block
          SizedBox(
            height: 12,
          ),
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  width: 50.0,
                  child: Icon(
                    LineAwesomeIcons.pencil,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  child: Expanded(
                    child: TextField(
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: "Description",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //Description Block
          SizedBox(
            height: 12,
          ),
          //Co-Host
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  width: 50.0,
                  child: Icon(
                    LineAwesomeIcons.users,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  child: Expanded(
                    child: InkWell(
                      child: Text('Add Co-host',
                          style: TextStyle(
                              fontSize: 17.0, fontWeight: FontWeight.w600)),
                      onTap: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),

          //Privacy
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  width: 50.0,
                  child: Icon(
                    LineAwesomeIcons.shield,
                    color: Colors.grey,
                  ),
                ),
                DropdownButton<String>(
                  items: eventPrivacy.map((String dropdownItem) {
                    return DropdownMenuItem<String>(
                      value: dropdownItem,
                      child: Text(dropdownItem,),
                    );
                  }).toList(),
                  onChanged: (String selectedValue) {
                    setState(() {
                      selectedPrivacy = selectedValue;
                    });
                  },
                  value: selectedPrivacy,
                ),
              ],
            ),
          ),

          //Privacy
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  width: 50.0,
                  child: Icon(
                    LineAwesomeIcons.dropbox,
                    color: Colors.grey,
                  ),
                ),
                DropdownButton<String>(
                  items: eventCategory.map((String dropdownItem) {
                    return DropdownMenuItem<String>(
                      value: dropdownItem,
                      child: Text(dropdownItem,),
                    );
                  }).toList(),
                  onChanged: (String selectedValue) {
                    setState(() {
                      selectedCategory = selectedValue;
                    });
                  },
                  value: selectedCategory,
                ),
              ],
            ),
          ),

          //Privacy
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Row(
              children: <Widget>[
                Spacer(),
                MaterialButton(
            onPressed: (){},
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  child: Text("Create",style: TextStyle(color: Colors.white),),
                  color: MyColors.red,
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }
}
