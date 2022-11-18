import 'package:flutter/material.dart';
import 'package:google_maps/geocoading_loaction.dart';
import 'package:google_maps/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      // home: GeoCoadingLocation(),
    );
  }
}
