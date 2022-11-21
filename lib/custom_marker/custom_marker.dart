import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class CustomMarker extends StatefulWidget {
  CustomMarker({Key? key}) : super(key: key);

  @override
  State<CustomMarker> createState() => _CustomMarkerState();
}

class _CustomMarkerState extends State<CustomMarker> {
  Uint8List? markerIcon;

  List<Marker> listMarkers = [];

  List<String> imagesPath = [
    'images/motorcycle.png'
    'images/delivery-truck.png',
    'images/bicycle.png' , 'images/car.png' , 'images/car1.png',
    'images/car2.png', 'images/hatchback.png',
  ];

  List<LatLng> listCoordinates = [
    LatLng(33.7008, 72.9682),LatLng(33.6941, 72.9734),
    LatLng(33.6992, 72.9744), LatLng(33.6939, 72.9771),
    LatLng(33.7036, 72.9785), LatLng(33.7008, 72.9682),
    LatLng(34.0000, 71.4757),
  ];

  loadImages() async {
    for(int i = 0; i < imagesPath.length; i++){
      markerIcon = await getBytesFromAsset(imagesPath[i], 50);
      listMarkers.add(
        Marker(
            markerId: MarkerId(i.toString()),
          position: listCoordinates[i],
          icon: BitmapDescriptor.fromBytes(markerIcon!),
          infoWindow: InfoWindow(title: 'City${imagesPath[i]}')
        ),
      );
      print('images names markerIcon ${markerIcon}');
      print('cordinates ${listCoordinates[i]}');
    }
  }

  Completer<GoogleMapController> _controller = Completer();

  CameraPosition initialCameraPosition = const CameraPosition(
    target: LatLng(34.1682, 71.7504),
    zoom: 12,
  );

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    print('data \n ${data}');
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    print('Codec \n ${codec}');
    ui.FrameInfo fi = await codec.getNextFrame();
    print('Fi \n ${fi}');
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadImages();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        initialCameraPosition: initialCameraPosition,
        onMapCreated: (GoogleMapController mapController) {
          _controller.complete(mapController);
        },
      markers: Set.from(listMarkers),
    );
  }
}
