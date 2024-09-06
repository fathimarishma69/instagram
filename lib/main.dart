import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/screens/bottomnavigation.dart';
import 'package:instagram/screens/homePage.dart';
import 'package:instagram/screens/loginPage.dart';
import 'package:instagram/screens/registerPage.dart';
import 'package:instagram/screens/userPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
     home: Bottomnavigation(),debugShowCheckedModeBanner: false,
    );
  }
}
