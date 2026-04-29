import '/backend/schema/structs/index.dart';
import '/components/post/expanded_custom_post_feed/expanded_custom_post_feed_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'detail_widget.dart' show DetailWidget;
import 'package:flutter/material.dart';

class DetailModel extends FlutterFlowModel<DetailWidget> {
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

  // Stores action output result for [Custom Action - getCommentThreads] action in Detail widget.
  List<CommentStruct>? commentsOutput;
  // Model for ExpandedCustomPostFeed component.
  late ExpandedCustomPostFeedModel expandedCustomPostFeedModel;

  @override
  void initState(BuildContext context) {
    expandedCustomPostFeedModel =
        createModel(context, () => ExpandedCustomPostFeedModel());
  }

  @override
  void dispose() {
    expandedCustomPostFeedModel.dispose();
  }
}
