// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future createPostRPC(
    String userId, String content, LatLng location, bool isBottle) async {
  final supabase = Supabase.instance.client;

  try {
    await supabase.rpc('create_new_post', params: {
      'p_user_id': userId,
      'p_content': content,
      'p_lat': location.latitude,
      'p_lng': location.longitude,
      'p_is_bottle': isBottle,
    });
  } catch (e) {
    print('Error ejecutando RPC: $e');
    rethrow;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
