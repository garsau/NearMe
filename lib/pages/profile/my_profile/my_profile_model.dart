import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/bar/custom_profile_app_bar/custom_profile_app_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'my_profile_widget.dart' show MyProfileWidget;
import 'package:flutter/material.dart';

class MyProfileModel extends FlutterFlowModel<MyProfileWidget> {
  ///  Local state fields for this page.

  List<PostViewStruct> profilePosts = [];
  void addToProfilePosts(PostViewStruct item) => profilePosts.add(item);
  void removeFromProfilePosts(PostViewStruct item) => profilePosts.remove(item);
  void removeAtIndexFromProfilePosts(int index) => profilePosts.removeAt(index);
  void insertAtIndexInProfilePosts(int index, PostViewStruct item) =>
      profilePosts.insert(index, item);
  void updateProfilePostsAtIndex(
          int index, Function(PostViewStruct) updateFn) =>
      profilePosts[index] = updateFn(profilePosts[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in MyProfile widget.
  List<PostsWithAuthorsRow>? postsOutputLoad;
  // Model for CustomProfileAppBar component.
  late CustomProfileAppBarModel customProfileAppBarModel;

  @override
  void initState(BuildContext context) {
    customProfileAppBarModel =
        createModel(context, () => CustomProfileAppBarModel());
  }

  @override
  void dispose() {
    customProfileAppBarModel.dispose();
  }
}
