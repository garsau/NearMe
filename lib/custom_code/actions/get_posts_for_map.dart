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

Future<List<PostViewStruct>> getPostsForMap(
  LatLng userLocation,
  String userId,
  int radiusMeters,
) async {
  final response = await Supabase.instance.client.rpc(
    'get_posts_by_distance',
    params: {
      'p_user_id': userId,
      'p_lat': userLocation.latitude,
      'p_lng': userLocation.longitude,
      'p_radius_meters': radiusMeters,
      'p_limit': 1000,
      'p_offset': 0,
    },
  );

  return (response as List)
      .map((row) => PostViewStruct(
            id: row['id'],
            content: row['content'],
            isBottle: row['is_bottle'],
            votesScore: row['votes_score'],
            createdAt: DateTime.parse(row['created_at']),
            lat: row['lat'],
            lng: row['lng'],
            username: row['username'],
            avatarUrl: row['avatar_url'],
            authorId: row['author_id'],
            distanceM: row['distance_m'],
            userVote: row['user_vote'],
          ))
      .toList();
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
