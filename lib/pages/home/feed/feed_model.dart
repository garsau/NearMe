import '/backend/schema/structs/index.dart';
import '/components/bar/custom_app_bar/custom_app_bar_widget.dart';
import '/components/bar/custom_nav_bar/custom_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'feed_widget.dart' show FeedWidget;
import 'package:flutter/material.dart';

class FeedModel extends FlutterFlowModel<FeedWidget> {
  ///  Local state fields for this page.

  List<PostViewStruct> localPosts = [];
  void addToLocalPosts(PostViewStruct item) => localPosts.add(item);
  void removeFromLocalPosts(PostViewStruct item) => localPosts.remove(item);
  void removeAtIndexFromLocalPosts(int index) => localPosts.removeAt(index);
  void insertAtIndexInLocalPosts(int index, PostViewStruct item) =>
      localPosts.insert(index, item);
  void updateLocalPostsAtIndex(int index, Function(PostViewStruct) updateFn) =>
      localPosts[index] = updateFn(localPosts[index]);

  int pageOffset = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getPostsByRecent] action in Feed widget.
  List<PostViewStruct>? postsOutputLoad;
  // Model for CustomAppBar component.
  late CustomAppBarModel customAppBarModel;
  // Stores action output result for [Custom Action - getPostsByRecent] action in Column widget.
  List<PostViewStruct>? postsOutputRefresh;
  // Stores action output result for [Custom Action - getPostsByRecent] action in Button widget.
  List<PostViewStruct>? postsOutputMore;
  // Model for CustomNavBar component.
  late CustomNavBarModel customNavBarModel;

  @override
  void initState(BuildContext context) {
    customAppBarModel = createModel(context, () => CustomAppBarModel());
    customNavBarModel = createModel(context, () => CustomNavBarModel());
  }

  @override
  void dispose() {
    customAppBarModel.dispose();
    customNavBarModel.dispose();
  }
}
