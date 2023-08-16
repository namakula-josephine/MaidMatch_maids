import 'package:flutter/material.dart';
import 'package:maidsmatch_maids/admin/bottomnav.dart';
//import 'package:maidsmatch_maids/welcome.dart';
//import 'package:maidsmatch_maids/welcome_scrn.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: botttomnav());
  }
}
