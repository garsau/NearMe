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

//
Future<List<CommentStruct>> getCommentThreads(
  String postId,
  String userId,
) async {
  final supabase = Supabase.instance.client;

  try {
    final response = await supabase.rpc('get_post_comments', params: {
      'p_post_id': postId,
      'p_user_id': userId,
    });

    final rows = response as List<dynamic>;

    final list = rows.map((row) {
      return CommentStruct(
        id: row['id'] as String?,
        postId: row['post_id'] as String?,
        parentCommentId: row['parent_comment_id'] as String?,
        content: row['content'] as String?,
        votesScore: row['votes_score'] as int?,
        createdAt: row['created_at'] != null
            ? DateTime.parse(row['created_at'])
            : null,
        username: row['username'] as String?,
        avatarUrl: row['avatar_url'] as String?,
        authorId: row['author_id'] as String?,
        depth: row['depth'] as int?,
        userVote: row['user_vote'] as int?,
        isLastInThread: false,
      );
    }).toList();

    for (int i = 0; i < list.length; i++) {
      final currentDepth = list[i].depth ?? 0;
      final nextDepth = i + 1 < list.length ? list[i + 1].depth ?? 0 : 0;

      list[i] = CommentStruct(
        id: list[i].id,
        postId: list[i].postId,
        parentCommentId: list[i].parentCommentId,
        content: list[i].content,
        votesScore: list[i].votesScore,
        createdAt: list[i].createdAt,
        username: list[i].username,
        avatarUrl: list[i].avatarUrl,
        authorId: list[i].authorId,
        depth: list[i].depth,
        userVote: list[i].userVote,
        isLastInThread: currentDepth > 0 && nextDepth == 0,
      );
    }

    return list;
  } catch (e) {
    print('Error en getCommentThreads: $e');
    rethrow;
  }
}
