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

Future createComment(
  String postId,
  String userId,
  String content,
  String? parentCommentId,
) async {
  final supabase = Supabase.instance.client;

  try {
    await supabase.from('comments').insert({
      'post_id': postId,
      'user_id': userId,
      'content': content,
      // Si parentCommentId es null, empty string, o 'null' como texto → manda null
      'parent_comment_id': (parentCommentId == null || parentCommentId.isEmpty)
          ? null
          : parentCommentId,
    });
  } catch (e) {
    print('Error en createComment: $e');
    rethrow;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
