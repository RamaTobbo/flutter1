import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:track_pro/models/location.dart';
import 'dart:math';

class MapScreen extends StatefulWidget {
  const MapScreen(
      {super.key,
      this.location =
          const PlaceLocation(long: 37.422, lat: -122.084, address: ''),
      this.isSelecting = true});
  final PlaceLocation location;
  final bool isSelecting;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  Location _location = Location();
  List<LatLng> _points = [];

  @override
  void initState() {
    super.initState();
    _startLocationTracking();
  }

  void _startLocationTracking() async {
    var permissionStatus = await _location.requestPermission();
    if (permissionStatus != PermissionStatus.granted) {
      return;
    }

    _location.onLocationChanged.listen((LocationData currentLocation) {
      _updateLocation(
          LatLng(currentLocation.latitude!, currentLocation.longitude!));
    });
  }

  void _updateLocation(LatLng newLocation) {
    if (_points.isNotEmpty) {}

    setState(() {
      _points.add(newLocation);
    });
  }

  String _determineActivity() {
    if (_points.length < 2) return "Unknown";

    double timeElapsed = 60.0;

    return "Unknown";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.isSelecting ? 'Pick your Location' : 'Your Location'),
        actions: [
          if (widget.isSelecting)
            IconButton(onPressed: () {}, icon: Icon(Icons.save))
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.location.lat, widget.location.long),
          zoom: 16,
        ),
        markers: {
          if (_points.isNotEmpty)
            Marker(
              markerId: MarkerId('current_location'),
              position: _points.last,
            ),
        },
        polylines: {
          Polyline(
            polylineId: PolylineId('route'),
            points: _points,
            color: Colors.blue,
            width: 5,
          ),
        },
      ),
    );
  }
}
