import '/backend/schema/structs/index.dart';
import '/components/bar/custom_profile_app_bar/custom_profile_app_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'follows_widget.dart' show FollowsWidget;
import 'package:flutter/material.dart';

class FollowsModel extends FlutterFlowModel<FollowsWidget> {
  ///  Local state fields for this page.

  List<FollowUserStruct> followList = [];
  void addToFollowList(FollowUserStruct item) => followList.add(item);
  void removeFromFollowList(FollowUserStruct item) => followList.remove(item);
  void removeAtIndexFromFollowList(int index) => followList.removeAt(index);
  void insertAtIndexInFollowList(int index, FollowUserStruct item) =>
      followList.insert(index, item);
  void updateFollowListAtIndex(
          int index, Function(FollowUserStruct) updateFn) =>
      followList[index] = updateFn(followList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getFollowers] action in Follows widget.
  List<FollowUserStruct>? followersOutput;
  // Stores action output result for [Custom Action - getFollowing] action in Follows widget.
  List<FollowUserStruct>? followingOutput;
  // Model for CustomProfileAppBar component.
  late CustomProfileAppBarModel customProfileAppBarModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    customProfileAppBarModel =
        createModel(context, () => CustomProfileAppBarModel());
  }

  @override
  void dispose() {
    customProfileAppBarModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
