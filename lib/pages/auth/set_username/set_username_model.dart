import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'set_username_widget.dart' show SetUsernameWidget;
import 'package:flutter/material.dart';

class SetUsernameModel extends FlutterFlowModel<SetUsernameWidget> {
  ///  Local state fields for this page.

  bool userExistsText = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for newUsername widget.
  FocusNode? newUsernameFocusNode;
  TextEditingController? newUsernameTextController;
  String? Function(BuildContext, String?)? newUsernameTextControllerValidator;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<ProfilesRow>? updateUsername;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    newUsernameFocusNode?.dispose();
    newUsernameTextController?.dispose();
  }
}
