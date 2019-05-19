import 'package:bgifter/screens/event_details.dart';
import 'package:bgifter/screens/home_screen_content.dart';
import 'package:bgifter/util/my_colors.dart';
import 'package:flutter/material.dart';

class EventViewItem extends StatefulWidget {
  final icon;
  final name;
  final tasks;

  const EventViewItem(this.icon, this.name, this.tasks);

  @override
  _EventViewItemState createState() =>
      _EventViewItemState(this.icon, this.name, this.tasks);
}

class _EventViewItemState extends State<EventViewItem> {
  final icon;
  final name;
  final tasks;

  _EventViewItemState(this.icon, this.name, this.tasks);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => EventDetails(event)));
        },
        child: Container(
          width: 200.0,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/event_image1.png"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.srgbToLinearGamma()),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(blurRadius: 2, color: Colors.grey)],
          ),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black.withOpacity(0.6),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  icon,
                  color: Colors.white,
                ),
                Spacer(),
                ListTile(
                  title: Text(
                    name,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    tasks,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
