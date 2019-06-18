//todo 4
import 'package:flutter/material.dart';
import './FirstPage.dart' as first;
import './SecondPage.dart' as second;
import './ThirdPage.dart' as third;

void main(){
  runApp(new MaterialApp(
    home: new MyTabs(),
  ));
}

class MyTabs extends StatefulWidget{
  @override
  MyTabsState createState() => new MyTabsState();
}

class MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin{
  TabController controller;

  //dijalankan pertama kali
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      //bagian atas
      appBar: new AppBar(
        title: new Text("Page Zein"),
        backgroundColor: Colors.redAccent,
        bottom: new TabBar(
          controller: controller,
          tabs: <Tab>[
            new Tab(icon: new Icon(Icons.arrow_forward),),
            new Tab(icon: new Icon(Icons.arrow_downward),),
            new Tab(icon: new Icon(Icons.arrow_back),)
          ],
        ),
      ),
      //bagian bawah
      bottomNavigationBar: new Material(
        color: Colors.deepOrange,
        child: new TabBar(
          controller: controller,
          tabs: <Tab>[
            new Tab(icon: new Icon(Icons.arrow_forward),),
            new Tab(icon: new Icon(Icons.arrow_downward),),
            new Tab(icon: new Icon(Icons.arrow_back),)
          ],
        ),
      ),
      //bagian konten
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new first.First(),
          new second.Second(),
          new third.Third()
        ],
      ),
    );
  }
}