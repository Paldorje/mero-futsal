// ignore_for_file: unnecessary_null_comparison

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../components/directions_repository.dart';
import '../models/directions.dart';

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(34.4279613358864, -122.885749655962),
    zoom: 11.5,
  );

  late GoogleMapController _googleMapController;
  // Marker _origin = '' as Marker;
  // Marker _destination= '' as Marker;
  // late Directions _info;

  Completer <GoogleMapController> _controller = Completer();


  @override
  void initState(){
    super.initState();
  }
  // @override
  // void dispose() {
  //   _googleMapController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Location'),
        // actions: [
        //   if(_origin != null)
        //   TextButton(
        //       onPressed: () => _googleMapController.animateCamera(
        //           CameraUpdate.newCameraPosition(CameraPosition(target: _origin.position,zoom: 14.5,tilt:50.0),),),
        //       style: TextButton.styleFrom(
        //         primary: Colors.green,
        //         textStyle: const TextStyle(fontWeight: FontWeight.w600),
        //       ),
        //       child: const Text('Origin')),
        //   if (_destination != null)
        //   TextButton(
        //       onPressed: () => _googleMapController.animateCamera(
        //         CameraUpdate.newCameraPosition(CameraPosition(target: _destination.position,zoom: 14.5,tilt:50.0),),),
        //       style: TextButton.styleFrom(
        //         primary: Colors.blue,
        //         textStyle: const TextStyle(fontWeight: FontWeight.w600),
        //       ),
        //       child: const Text('Origin')),
        // ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [GoogleMap(
          // myLocationButtonEnabled: true,
          // zoomControlsEnabled: false,
          // mapType: MapType.satellite,
          initialCameraPosition: _initialCameraPosition,
          onMapCreated: (GoogleMapController controller){
            _controller.complete(controller);
          },
          // onMapCreated: (controller) => _googleMapController = controller,
          // markers: {
          //   if (_origin != null) _origin,
          //   if (_destination != null) _destination,
          // },
          // polylines: {
          //   if(_info != null)
          //     Polyline(
          //         polylineId: const PolylineId('overview_polyline'),
          //       color: Colors.red,
          //       width: 5,
          //       points: _info.polylinePoints
          //         .map((e) => LatLng(e.latitude, e.longitude))
          //         .toList(),
          //     ),
          // },
          // onLongPress: _addMarker,
        ),
      ],
      ),
    );
  }
  // void _addMarker(LatLng pos) async {
  //   if(_origin == null || (_origin != null && _destination != null)){
  //     setState(() {
  //       _origin = Marker(markerId: const MarkerId('origin'),
  //       infoWindow: const InfoWindow(title: 'Origin' ),
  //         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
  //         position: pos,
  //       );
  //       // _destination = null;
  //
  //       // _info = null;
  //     });
  //   }else{
  //     setState(() {
  //       _origin = Marker(markerId: const MarkerId('destination'),
  //         infoWindow: const InfoWindow(title: 'Destination' ),
  //         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
  //         position: pos,
  //       );
  //     });
  //
  //     final directions = await DirectionRepository()
  //     .getDirections(origin: _origin.position,
  //         destination: _destination.position,
  //     );
  //     setState(() => _info = directions!);
  //   }
  // }
}
