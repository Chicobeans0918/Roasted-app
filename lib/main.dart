import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Map',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // Example location: Ottawa
  static const LatLng _initialLocation = LatLng(
    45.4215,
    -75.6972,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Map'),
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: _initialLocation,
          zoom: 12,
        ),

        // Marker
        markers: {
          const Marker(
            markerId: MarkerId('ottawa'),
            position: _initialLocation,
            infoWindow: InfoWindow(
              title: 'Ottawa',
              snippet: 'Example marker',
            ),
          ),
        },

        // Map options
        mapType: MapType.normal,
        zoomControlsEnabled: true,
        myLocationButtonEnabled: false,
      ),
    );
  }
}