import '/backend/schema/structs/index.dart';
import '/components/post/expanded_custom_post_feed/expanded_custom_post_feed_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'detail_widget.dart' show DetailWidget;
import 'package:flutter/material.dart';

class DetailModel extends FlutterFlowModel<DetailWidget> {
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
