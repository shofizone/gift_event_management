import 'package:bgifter/util/my_colors.dart';
import 'package:flutter/material.dart';
class PeopleListOfEvents extends StatefulWidget {
  @override
  _PeopleListOfEventsState createState() => _PeopleListOfEventsState();
}

class _PeopleListOfEventsState extends State<PeopleListOfEvents>  with SingleTickerProviderStateMixin {
 TabController _tabController;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(vsync: this,length: 4, initialIndex: 0);
  }

 @override
 void dispose() {
   _tabController.dispose();
   super.dispose();
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
            tabs: [
          Tab(child: Text("Comming",style: TextStyle(fontSize: 16,color:Colors.white),),),
          Tab(child: Text("Thinking",style: TextStyle(fontSize: 16,color:Colors.white),),),
          Tab(child: Text("Not Comming",style: TextStyle(fontSize: 16,color:Colors.white,),textAlign: TextAlign.center,),),
          Tab(child: Text("All",style: TextStyle(fontSize: 16,color:Colors.white),),),
        ]),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListOfPeople(),
          ListOfPeople(),
          ListOfPeople(),
          ListOfPeople(),

        ],
      ),
    );
  }
}


class ListOfPeople extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
    Card(elevation:2.0,child: ListTile(leading: CircleAvatar(), title: Text("Rakib Ahmed"),subtitle: Text("Accepted invition on 2 dayes ago"),trailing: Icon(Icons.more_horiz),onTap: (){},)),
    Card(elevation:2.0,child: ListTile(leading: CircleAvatar(), title: Text("Rakib Ahmed"),subtitle: Text("Accepted invition on 2 dayes ago"),trailing: Icon(Icons.more_horiz),onTap: (){},)),
    Card(elevation:2.0,child: ListTile(leading: CircleAvatar(), title: Text("Rakib Ahmed"),subtitle: Text("Accepted invition on 2 dayes ago"),trailing: Icon(Icons.more_horiz),onTap: (){},)),
    Card(elevation:2.0,child: ListTile(leading: CircleAvatar(), title: Text("Rakib Ahmed"),subtitle: Text("Accepted invition on 2 dayes ago"),trailing: Icon(Icons.more_horiz),onTap: (){},)),
    Card(elevation:2.0,child: ListTile(leading: CircleAvatar(), title: Text("Rakib Ahmed"),subtitle: Text("Accepted invition on 2 dayes ago"),trailing: Icon(Icons.more_horiz),onTap: (){},)),
    Card(elevation:2.0,child: ListTile(leading: CircleAvatar(), title: Text("Rakib Ahmed"),subtitle: Text("Accepted invition on 2 dayes ago"),trailing: Icon(Icons.more_horiz),onTap: (){},)),
    Card(elevation:2.0,child: ListTile(leading: CircleAvatar(), title: Text("Rakib Ahmed"),subtitle: Text("Accepted invition on 2 dayes ago"),trailing: Icon(Icons.more_horiz),onTap: (){},)),
    Card(elevation:2.0,child: ListTile(leading: CircleAvatar(), title: Text("Rakib Ahmed"),subtitle: Text("Accepted invition on 2 dayes ago"),trailing: Icon(Icons.more_horiz),onTap: (){},)),
    Card(elevation:2.0,child: ListTile(leading: CircleAvatar(), title: Text("Rakib Ahmed"),subtitle: Text("Accepted invition on 2 dayes ago"),trailing: Icon(Icons.more_horiz),onTap: (){},)),
    Card(elevation:2.0,child: ListTile(leading: CircleAvatar(), title: Text("Rakib Ahmed"),subtitle: Text("Accepted invition on 2 dayes ago"),trailing: Icon(Icons.more_horiz),onTap: (){},)),
    Card(elevation:2.0,child: ListTile(leading: CircleAvatar(), title: Text("Rakib Ahmed"),subtitle: Text("Accepted invition on 2 dayes ago"),trailing: Icon(Icons.more_horiz),onTap: (){},)),
    Card(elevation:2.0,child: ListTile(leading: CircleAvatar(), title: Text("Rakib Ahmed"),subtitle: Text("Accepted invition on 2 dayes ago"),trailing: Icon(Icons.more_horiz),onTap: (){},)),
    Card(elevation:2.0,child: ListTile(leading: CircleAvatar(), title: Text("Rakib Ahmed"),subtitle: Text("Accepted invition on 2 dayes ago"),trailing: Icon(Icons.more_horiz),onTap: (){},)),
    Card(elevation:2.0,child: ListTile(leading: CircleAvatar(), title: Text("Rakib Ahmed"),subtitle: Text("Accepted invition on 2 dayes ago"),trailing: Icon(Icons.more_horiz),onTap: (){},)),
    ],
    );
  }
}
