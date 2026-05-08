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

import '/custom_code/widgets/index.dart';
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';
import 'package:flutter/widgets.dart' as widgets;

import 'package:google_maps_flutter/google_maps_flutter.dart' as gmaps;
import 'dart:ui' as ui;
import 'dart:math' as math;
import 'dart:async';

class PostsMap extends StatefulWidget {
  const PostsMap({
    super.key,
    this.width,
    this.height,
    this.initialLocation,
    this.posts = const [],
    this.borderRadius = 0.0,
    this.radiusMeters = 10000,
    this.onPostSelected,
  });

  final double? width;
  final double? height;
  final LatLng? initialLocation;
  final List<PostViewStruct> posts;
  final double borderRadius;
  final int radiusMeters;
  final Future Function(PostViewStruct? selectedPost)? onPostSelected;

  @override
  State<PostsMap> createState() => _PostsMapState();
}

class _PostsMapState extends State<PostsMap> {
  gmaps.GoogleMapController? _controller;
  final Map<gmaps.MarkerId, gmaps.Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _buildMarkers();
  }

  @override
  void didUpdateWidget(PostsMap oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.posts != widget.posts) {
      _buildMarkers();
    }
  }

  double _getZoomForRadius(int radiusMeters) {
    return 14 - math.log(radiusMeters / 1000) / math.log(2);
  }

  Future<void> _buildMarkers() async {
    final Map<gmaps.MarkerId, gmaps.Marker> newMarkers = {};

    for (final post in widget.posts) {
      if (post.lat == null || post.lng == null) continue;

      final markerId = gmaps.MarkerId(post.id ?? '');
      final icon = await _buildMarkerIcon(post);

      final marker = gmaps.Marker(
        markerId: markerId,
        position: gmaps.LatLng(post.lat!, post.lng!),
        icon: icon,
        anchor: const Offset(0.5, 0.5),
        onTap: () => _onMarkerTap(post),
      );

      newMarkers[markerId] = marker;
    }

    if (mounted) {
      setState(() {
        _markers.clear();
        _markers.addAll(newMarkers);
      });
    }
  }

  Future<gmaps.BitmapDescriptor> _buildMarkerIcon(PostViewStruct post) async {
    const double size = 44.0;

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    final shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.2)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);
    canvas.drawCircle(
      const Offset(size / 2, size / 2 + 2),
      size / 2 - 2,
      shadowPaint,
    );

    final bgPaint = Paint()..color = Colors.white;
    canvas.drawCircle(
      const Offset(size / 2, size / 2),
      size / 2 - 2,
      bgPaint,
    );

    final borderPaint = Paint()
      ..color = Colors.black.withOpacity(0.12)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    canvas.drawCircle(
      const Offset(size / 2, size / 2),
      size / 2 - 2,
      borderPaint,
    );

    if (post.avatarUrl != null && post.avatarUrl!.isNotEmpty) {
      try {
        final imageProvider = NetworkImage(post.avatarUrl!);
        final completer = Completer<ui.Image>();
        imageProvider.resolve(const ImageConfiguration()).addListener(
              ImageStreamListener((info, _) => completer.complete(info.image)),
            );
        final avatarImage = await completer.future.timeout(
          const Duration(seconds: 3),
          onTimeout: () => throw Exception('timeout'),
        );

        final clipPath = Path()
          ..addOval(Rect.fromCircle(
            center: const Offset(size / 2, size / 2),
            radius: size / 2 - 2,
          ));
        canvas.clipPath(clipPath);
        canvas.drawImageRect(
          avatarImage,
          Rect.fromLTWH(0, 0, avatarImage.width.toDouble(),
              avatarImage.height.toDouble()),
          Rect.fromLTWH(0, 0, size, size),
          Paint(),
        );
      } catch (_) {
        _drawInitial(canvas, post, size);
      }
    } else {
      _drawInitial(canvas, post, size);
    }

    final picture = recorder.endRecording();
    final image = await picture.toImage(size.toInt(), size.toInt());
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final bytes = byteData!.buffer.asUint8List();

    return gmaps.BitmapDescriptor.fromBytes(bytes);
  }

  void _drawInitial(Canvas canvas, PostViewStruct post, double size) {
    final initial = (post.username?.isNotEmpty == true)
        ? post.username![0].toUpperCase()
        : '?';

    final textPainter = widgets.TextPainter(
      text: TextSpan(
        text: initial,
        style: TextStyle(
          color: Colors.black.withOpacity(0.7),
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      textDirection: widgets.TextDirection.ltr,
    )..layout();

    textPainter.paint(
      canvas,
      Offset(
        (size - textPainter.width) / 2,
        (size - textPainter.height) / 2,
      ),
    );
  }

  Set<gmaps.Circle> _buildRadiusCircle(gmaps.LatLng center, int radiusMeters) {
    return {
      gmaps.Circle(
        circleId: const gmaps.CircleId('radius_circle'),
        center: center,
        radius: radiusMeters.toDouble(),
        fillColor: Colors.transparent,
        strokeColor: Colors.white.withOpacity(0.6),
        strokeWidth: 2,
      ),
    };
  }

  void _onMarkerTap(PostViewStruct post) async {
    if (widget.onPostSelected != null) {
      await widget.onPostSelected!(post);
    }
  }

  @override
  Widget build(BuildContext context) {
    final center = gmaps.LatLng(
      widget.initialLocation?.latitude ?? 0.0,
      widget.initialLocation?.longitude ?? 0.0,
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: gmaps.GoogleMap(
          initialCameraPosition: gmaps.CameraPosition(
            target: center,
            zoom: _getZoomForRadius(widget.radiusMeters),
          ),
          markers: Set<gmaps.Marker>.of(_markers.values),
          circles: _buildRadiusCircle(center, widget.radiusMeters),
          onMapCreated: (c) => _controller = c,
          myLocationEnabled: false,
          myLocationButtonEnabled: false,
          compassEnabled: false,
          mapToolbarEnabled: false,
          zoomControlsEnabled: false,
        ),
      ),
    );
  }
}
