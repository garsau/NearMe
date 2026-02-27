import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/bar/custom_app_bar/custom_app_bar_widget.dart';
import '/components/bar/custom_nav_bar/custom_nav_bar_widget.dart';
import '/components/post/custom_post_feed/custom_post_feed_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'feed_model.dart';
export 'feed_model.dart';

class FeedWidget extends StatefulWidget {
  const FeedWidget({super.key});

  static String routeName = 'Feed';
  static String routePath = '/feed';

  @override
  State<FeedWidget> createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  late FeedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.postsOutputLoad = await PostsWithAuthorsTable().queryRows(
        queryFn: (q) => q,
      );
      _model.localPosts = functions
          .mapRowsToPostView(_model.postsOutputLoad!.toList())
          .toList()
          .cast<PostViewStruct>();
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.customAppBarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: CustomAppBarWidget(),
                  ),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        _model.postOutputRefresh =
                            await PostsWithAuthorsTable().queryRows(
                          queryFn: (q) => q,
                        );
                        _model.localPosts = functions
                            .mapRowsToPostView(
                                _model.postOutputRefresh!.toList())
                            .toList()
                            .cast<PostViewStruct>();
                        safeSetState(() {});
                      },
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Builder(
                              builder: (context) {
                                final listPosts = _model.localPosts.toList();

                                return ListView.builder(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    0,
                                    0,
                                    75.0,
                                  ),
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listPosts.length,
                                  itemBuilder: (context, listPostsIndex) {
                                    final listPostsItem =
                                        listPosts[listPostsIndex];
                                    return CustomPostFeedWidget(
                                      key: Key(
                                          'Key1r9_${listPostsIndex}_of_${listPosts.length}'),
                                      postView: listPostsItem,
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.customNavBarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: CustomNavBarWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
