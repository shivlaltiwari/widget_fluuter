import 'package:flutter/material.dart';
import 'dart:math';
void main(List<String> args) {
  runApp(
    new MaterialApp(
      title: "loigic app",
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    )
  );
}

class Homepage extends StatefulWidget {

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var num;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Rendom number "),
        centerTitle: true,
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new RaisedButton(onPressed: (){
                num =  generateRendomNum();
                print(num);
            },
            child: Text("Press", style: TextStyle(fontSize: 20.0),),
            color: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.black),
             )
            ),
            Padding(padding: EdgeInsets.all(10.0)),
             new Text("random number is : $num", style: TextStyle(fontSize: 25.0),),

            
          ],
        ),
      ),
      
    );
  }
  void generateRendomNum(){
    var random = Random();
    setState(() {
       int luckynumber = random.nextInt(10);
       return luckynumber;
    });
    // int luckynumber = random.nextInt(10); 
  }
}