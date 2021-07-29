import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment(0.9, 0.95),
            child: FloatingActionButton(
              elevation: 2,
              onPressed: () {},
              child: Icon(Icons.search),
              backgroundColor: Colors.purple,
            ),
          ),
          Center(
              child: Container(
            color: Colors.red,
            height: 200,
            width: 200,
          )),
        ],
      ),
    );
  }
}
