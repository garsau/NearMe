import '/components/custom_app_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'feed_widget.dart' show FeedWidget;
import 'package:flutter/material.dart';

class FeedModel extends FlutterFlowModel<FeedWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for CustomAppBar component.
  late CustomAppBarModel customAppBarModel;

  @override
  void initState(BuildContext context) {
    customAppBarModel = createModel(context, () => CustomAppBarModel());
  }

  @override
  void dispose() {
    customAppBarModel.dispose();
  }
}
