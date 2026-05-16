import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'new_post_widget.dart' show NewPostWidget;
import 'package:flutter/material.dart';

class NewPostModel extends FlutterFlowModel<NewPostWidget> {
  ///  Local state fields for this page.

  LatLng? selectedLocation;

  String? errorMsg;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getPostsByRecent] action in Button widget.
  List<PostViewStruct>? postsOutputRefresh;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
