import '/backend/schema/structs/index.dart';
import '/components/bar/custom_app_bar/custom_app_bar_widget.dart';
import '/components/bar/custom_nav_bar/custom_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  List<PostViewStruct> localPostsMap = [];
  void addToLocalPostsMap(PostViewStruct item) => localPostsMap.add(item);
  void removeFromLocalPostsMap(PostViewStruct item) =>
      localPostsMap.remove(item);
  void removeAtIndexFromLocalPostsMap(int index) =>
      localPostsMap.removeAt(index);
  void insertAtIndexInLocalPostsMap(int index, PostViewStruct item) =>
      localPostsMap.insert(index, item);
  void updateLocalPostsMapAtIndex(
          int index, Function(PostViewStruct) updateFn) =>
      localPostsMap[index] = updateFn(localPostsMap[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getPostsForMap] action in HomePage widget.
  List<PostViewStruct>? postsOutputForMap;
  // Model for CustomAppBar component.
  late CustomAppBarModel customAppBarModel;
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
