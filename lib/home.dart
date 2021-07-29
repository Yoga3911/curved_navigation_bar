import 'package:coba/page1.dart';
import 'package:coba/page2.dart';
import 'package:coba/page3.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Align iconBotBar(IconData icon) {
    return Align(
        alignment: Alignment(0, 0.3),
        child: Icon(
          icon,
          color: Colors.white,
        ));
  }

  int _page = 0;

  List<Widget> dataWidget = [Page1(), Page2(), Page3()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text('My Galaxy'),
          centerTitle: true,
          leading: Icon(Icons.android),
          actions: [
            IconButton(
              icon: Icon(Icons.info),
              onPressed: () {},
            ),
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          animationCurve: Curves.easeInOut,
          items: [
            iconBotBar(Icons.home),
            iconBotBar(Icons.add),
            iconBotBar(Icons.person),
          ],
          color: Colors.purple,
          backgroundColor: Colors.white,
          height: MediaQuery.of(context).size.height * 0.07,
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
        body: dataWidget[_page]);
  }
}
