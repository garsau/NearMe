import '/backend/schema/structs/index.dart';
import '/components/post/custom_post_feed/custom_post_feed_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'comments_widget.dart' show CommentsWidget;
import 'package:flutter/material.dart';

class CommentsModel extends FlutterFlowModel<CommentsWidget> {
  ///  Local state fields for this page.

  List<CommentStruct> localComments = [];
  void addToLocalComments(CommentStruct item) => localComments.add(item);
  void removeFromLocalComments(CommentStruct item) =>
      localComments.remove(item);
  void removeAtIndexFromLocalComments(int index) =>
      localComments.removeAt(index);
  void insertAtIndexInLocalComments(int index, CommentStruct item) =>
      localComments.insert(index, item);
  void updateLocalCommentsAtIndex(
          int index, Function(CommentStruct) updateFn) =>
      localComments[index] = updateFn(localComments[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getCommentThreads] action in Comments widget.
  List<CommentStruct>? commentsOutput;
  // Model for CustomPostFeed component.
  late CustomPostFeedModel customPostFeedModel;

  @override
  void initState(BuildContext context) {
    customPostFeedModel = createModel(context, () => CustomPostFeedModel());
  }

  @override
  void dispose() {
    customPostFeedModel.dispose();
  }
}
