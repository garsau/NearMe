// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_maps_flutter/google_maps_flutter.dart' as gmaps;

class ClickableMap extends StatefulWidget {
  const ClickableMap({
    super.key,
    this.width,
    this.height,
    this.initialLocation,
    this.borderRadius = 12.0,
    this.onLocationSelected,
  });

  final double? width;
  final double? height;
  final LatLng? initialLocation;
  final double borderRadius;
  final Future Function(LatLng? selectedLocation)? onLocationSelected;

  @override
  State<ClickableMap> createState() => _ClickableMapState();
}

class _ClickableMapState extends State<ClickableMap> {
  gmaps.LatLng? _selectedPoint;
  late gmaps.LatLng _initialCenter;
  gmaps.GoogleMapController? _controller;

  @override
  void initState() {
    super.initState();
    // Convertimos el LatLng de FF al de la librería de Google Maps
    _initialCenter = gmaps.LatLng(
      widget.initialLocation?.latitude ?? 0.0,
      widget.initialLocation?.longitude ?? 0.0,
    );

    // Si queremos que el marcador aparezca en la posición inicial por defecto:
    if (widget.initialLocation != null) {
      _selectedPoint = _initialCenter;
    }
  }

  void _handleTap(gmaps.LatLng tappedPoint) async {
    setState(() {
      _selectedPoint = tappedPoint;
    });

    // Creamos el objeto LatLng compatible con FlutterFlow para exportarlo
    final ffLatLng = LatLng(tappedPoint.latitude, tappedPoint.longitude);

    // Ejecutamos la acción definida en FlutterFlow
    if (widget.onLocationSelected != null) {
      await widget.onLocationSelected!(ffLatLng);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: gmaps.GoogleMap(
          initialCameraPosition: gmaps.CameraPosition(
            target: _initialCenter,
            zoom: 14,
          ),
          onTap: _handleTap,
          onMapCreated: (gmaps.GoogleMapController controller) {
            _controller = controller;
          },
          // Si el marcador existe, lo dibujamos
          markers: _selectedPoint == null
              ? {}
              : {
                  gmaps.Marker(
                    markerId: const gmaps.MarkerId('selected_location'),
                    position: _selectedPoint!,
                    icon: gmaps.BitmapDescriptor.defaultMarkerWithHue(
                      gmaps.BitmapDescriptor.hueRed,
                    ),
                  ),
                },
          // Configuraciones adicionales útiles
          myLocationEnabled: false,
          myLocationButtonEnabled: false,
          compassEnabled: false,
          mapToolbarEnabled: false,
        ),
      ),
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
