import 'package:flutter/material.dart';
import 'model/constantes.dart';
import 'view/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constantes.app_title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Constantes.app_color,
      ),
      home: MyHome(),
    );
  }
}
