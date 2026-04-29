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
import 'dart:ui' as ui;

class StaticLocationMap extends StatefulWidget {
  const StaticLocationMap({
    super.key,
    this.width,
    this.height,
    required this.lat,
    required this.lng,
    this.borderRadius = 12.0,
  });

  final double? width;
  final double? height;
  final double lat;
  final double lng;
  final double borderRadius;

  @override
  State<StaticLocationMap> createState() => _StaticLocationMapState();
}

class _StaticLocationMapState extends State<StaticLocationMap> {
  gmaps.BitmapDescriptor? _circleMarker;

  @override
  void initState() {
    super.initState();
    _createCircleMarker();
  }

  Future<void> _createCircleMarker() async {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    const size = 24.0;

    final fillPaint = Paint()..color = const Color(0xFF2563EB);
    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    canvas.drawCircle(
      const Offset(size / 2, size / 2),
      size / 2,
      fillPaint,
    );
    canvas.drawCircle(
      const Offset(size / 2, size / 2),
      size / 2,
      borderPaint,
    );

    final picture = recorder.endRecording();
    final image = await picture.toImage(size.toInt(), size.toInt());
    final bytes = await image.toByteData(format: ui.ImageByteFormat.png);

    if (bytes != null && mounted) {
      final descriptor = gmaps.BitmapDescriptor.bytes(
        bytes.buffer.asUint8List(),
        width: size,
        height: size,
      );
      setState(() => _circleMarker = descriptor);
    }
  }

  @override
  Widget build(BuildContext context) {
    final position = gmaps.LatLng(widget.lat, widget.lng);

    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: gmaps.GoogleMap(
          initialCameraPosition: gmaps.CameraPosition(
            target: position,
            zoom: 16.0,
          ),
          markers: _circleMarker == null
              ? {}
              : {
                  gmaps.Marker(
                    markerId: const gmaps.MarkerId('post_location'),
                    position: position,
                    icon: _circleMarker!,
                    anchor: const Offset(0.5, 0.5),
                  ),
                },
          myLocationEnabled: false,
          myLocationButtonEnabled: false,
          compassEnabled: false,
          mapToolbarEnabled: false,
          zoomControlsEnabled: false,
          scrollGesturesEnabled: false,
          zoomGesturesEnabled: false,
          rotateGesturesEnabled: false,
          tiltGesturesEnabled: false,
        ),
      ),
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
