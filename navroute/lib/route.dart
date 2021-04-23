import 'package:flutter/material.dart';

class Route_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Routeing page"),
        
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Text("it's from homepage"),
          ],
        ),
      ),
    );
  }
}