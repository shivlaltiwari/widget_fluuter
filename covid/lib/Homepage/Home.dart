import 'dart:convert';
// import 'dart:ffi';
import 'dart:core';

import 'package:covid/pannel/worldWidepannel.dart';
import 'package:flutter/material.dart';
import '../dataSource/datasource.dart';
import 'package:http/http.dart' as http;


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // String url = "corona.lmao.ninja/v2/all";
  Map worldData;
  fetchWorldWide() async {
     var response = await http.get(Uri.http('corona.lmao.ninja','/all'));
    setState(() {
     if (response.statusCode == 200) {
     worldData = jsonDecode(response.body);
     print("mydata");
  } else {
    throw Exception('Failed to load data');
  }  
  });
   // return worldData;
  }
  @override
  void initState(){
    fetchWorldWide();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Covid-19 Info"),
        centerTitle: true,
       backgroundColor: Colors.purple[300],
      ),
      body:ListView(
         children: [
           Container(
             height: 150.0,
             color: Colors.orange[300],
             padding: EdgeInsets.all(10.0),
             alignment: Alignment.bottomCenter,
             child: Text(datasource.quote, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,color: Colors.black87),),
           ),
           Padding(padding:EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Text("WorldWide", style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),),
            ),
           
          worldData==null? worldWidepannel(worlddata: worldData): worldWidepannel(worlddata: worldData),
         //worldWidepannel(worlddata: worldData,),
         ],
      ),
    );
  }
}