import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'custom_post_feed_widget.dart' show CustomPostFeedWidget;
import 'package:flutter/material.dart';

class CustomPostFeedModel extends FlutterFlowModel<CustomPostFeedWidget> {
  ///  Local state fields for this component.

  int componentVotes = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in CircleImage widget.
  List<ProfilesRow>? userProfile;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
