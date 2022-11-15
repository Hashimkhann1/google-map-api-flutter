import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
          mapType: MapType.hybrid,
            initialCameraPosition: CameraPosition(
            target: LatLng(34.1612, 71.8453),
            zoom: 14.0
        ))
      ),
    );
  }
}
