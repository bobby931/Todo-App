import 'package:flutter/material.dart';
import 'package:todo/pages/home_page.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


void main() {


//init hive



  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}