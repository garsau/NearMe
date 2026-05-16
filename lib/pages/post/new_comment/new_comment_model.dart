import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'new_comment_widget.dart' show NewCommentWidget;
import 'package:flutter/material.dart';

class NewCommentModel extends FlutterFlowModel<NewCommentWidget> {
  ///  Local state fields for this page.

  LatLng? selectedLocation;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getCommentThreads] action in Button widget.
  List<CommentStruct>? commentsOutput;
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
