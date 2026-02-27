import '/components/bar/custom_app_bar/custom_app_bar_widget.dart';
import '/components/bar/custom_nav_bar/custom_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

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
