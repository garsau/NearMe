import '/backend/supabase/supabase.dart';
import '/components/bar/custom_profile_app_bar/custom_profile_app_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:flutter/material.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for CustomProfileAppBar component.
  late CustomProfileAppBarModel customProfileAppBarModel;
  bool isDataUploading_uploadAvatar = false;
  FFUploadedFile uploadedLocalFile_uploadAvatar =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadAvatar = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<ProfilesRow>? updateUsername;

  @override
  void initState(BuildContext context) {
    customProfileAppBarModel =
        createModel(context, () => CustomProfileAppBarModel());
  }

  @override
  void dispose() {
    customProfileAppBarModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
