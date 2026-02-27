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
