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

Future<List<FollowUserStruct>> getFollowers(
  String profileId,
  String currentUserId,
) async {
  print(
      'getFollowers called with profileId: $profileId, currentUserId: $currentUserId');

  final response = await Supabase.instance.client.rpc(
    'get_followers',
    params: {
      'p_profile_id': profileId,
      'p_current_user_id': currentUserId,
    },
  );

  print('response: $response');

  return (response as List<dynamic>).map((row) {
    return FollowUserStruct(
      id: row['id'] as String?,
      username: row['username'] as String?,
      avatarUrl: row['avatar_url'] as String?,
      isFollowing: row['is_following'] as bool?,
    );
  }).toList();
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
