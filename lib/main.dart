import 'package:flutter/material.dart';
import 'package:google_maps/custom_marker/custom_marker.dart';
import 'package:google_maps/geocoading_loaction.dart';
import 'package:google_maps/home_screen.dart';
import 'package:google_maps/user_current_location/user_current_location.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomeScreen(),
      home: UserCurrentLocation(),
      // home: CustomMarker(),
      // home: GeoCoadingLocation(),
    );
  }
}
