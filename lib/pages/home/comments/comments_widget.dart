import '/backend/schema/structs/index.dart';
import '/components/post/custom_comment/custom_comment_widget.dart';
import '/components/post/custom_post_feed/custom_post_feed_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'comments_model.dart';
export 'comments_model.dart';

class CommentsWidget extends StatefulWidget {
  const CommentsWidget({
    super.key,
    required this.post,
  });

  final PostViewStruct? post;

  static String routeName = 'Comments';
  static String routePath = '/comments';

  @override
  State<CommentsWidget> createState() => _CommentsWidgetState();
}

class _CommentsWidgetState extends State<CommentsWidget> {
  late CommentsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommentsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.commentsOutput = await actions.getCommentThreads(
        widget.post!.id,
        widget.post!.authorId,
      );
      _model.localComments =
          _model.commentsOutput!.toList().cast<CommentStruct>();
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.safePop();
                          },
                          child: Icon(
                            Icons.close_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  wrapWithModel(
                    model: _model.customPostFeedModel,
                    updateCallback: () => safeSetState(() {}),
                    child: CustomPostFeedWidget(
                      postView: widget.post!,
                    ),
                  ),
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        final listComments = _model.localComments.toList();

                        return ListView.builder(
                          padding: EdgeInsets.fromLTRB(
                            0,
                            0,
                            0,
                            75.0,
                          ),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listComments.length,
                          itemBuilder: (context, listCommentsIndex) {
                            final listCommentsItem =
                                listComments[listCommentsIndex];
                            return Container(
                              child: CustomCommentWidget(
                                key: Key(
                                    'Key74s_${listCommentsIndex}_of_${listComments.length}'),
                                comment: listCommentsItem,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
