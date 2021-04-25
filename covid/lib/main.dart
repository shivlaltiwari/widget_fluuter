// import 'dart:html';
// import 'dart:math';

import 'package:flutter/material.dart';
import './Homepage/Home.dart';
import './dataSource/datasource.dart';
void main(List<String> args) {
  
  runApp(
    new MaterialApp(
      title: "Covid App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'circular',
        primaryColor:primaryBlack,
        // brightness: Brightness.dark,
      ),
      home: Home(),
    )
  );
}

