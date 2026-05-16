import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

List<PostViewStruct> mapRowsToPostView(List<PostsWithAuthorsRow> rows) {
  return rows.map((row) {
    return PostViewStruct(
      id: row.id,
      content: row.content,
      isBottle: row.isBottle,
      votesScore: row.votesScore,
      createdAt: row.createdAt,
      lat: row.lat,
      lng: row.lng,
      username: row.username,
      avatarUrl: row.avatarUrl,
      authorId: row.authorId,
    );
  }).toList();
  //
}

ProfileStruct mapRowsToProfile(List<ProfilesRow> row) {
  final profile = row.first;

  return ProfileStruct(
    id: profile.id,
    username: profile.username,
    avatarUrl: profile.avatarUrl,
    bio: profile.bio,
    followersCount: profile.followersCount,
    followingCount: profile.followingCount,
    postsCount: profile.postsCount,
    createdAt: profile.createdAt,
  );
}

String? getStringUrl(String? stringUrl) {
  return stringUrl;
}

List<PostViewStruct> appendPosts(
  List<PostViewStruct> currentPosts,
  List<PostViewStruct> newPosts,
) {
  return [...currentPosts, ...newPosts];
}

bool isWithinRadius(
  LatLng selectedLocation,
  LatLng userLocation,
  int radiusMeters,
) {
  final dLat = (selectedLocation.latitude - userLocation.latitude) * 111320;
  final dLng = (selectedLocation.longitude - userLocation.longitude) * 111320;
  final distanceSquared = dLat * dLat + dLng * dLng;
  return distanceSquared <= (radiusMeters * radiusMeters);
}

String formatDistance(double distanceM) {
  if (distanceM < 1000) {
    return '${distanceM.round()}m';
  } else {
    final km = distanceM / 1000;
    return '${km.toStringAsFixed(1)}km';
  }
}

String formatTime(DateTime createdAt) {
  final now = DateTime.now();
  final diff = now.difference(createdAt);

  if (diff.inMinutes < 1) return 'just now';
  if (diff.inMinutes < 60) return '${diff.inMinutes}m';
  if (diff.inHours < 24) return '${diff.inHours}h';
  if (diff.inDays < 7) return '${diff.inDays}d';
  return '${(diff.inDays / 7).floor()}w';
}

List<FollowUserStruct> filterProfiles(
  List<FollowUserStruct> profiles,
  String query,
) {
  if (query.isEmpty) return profiles;
  final q = query.toLowerCase();
  return profiles
      .where((p) => p.username?.toLowerCase().contains(q) == true)
      .toList();
}
