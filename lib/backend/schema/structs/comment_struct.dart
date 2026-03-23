// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentStruct extends BaseStruct {
  CommentStruct({
    String? id,
    String? postId,
    String? parentCommentId,
    String? content,
    int? votesScore,
    DateTime? createdAt,
    String? username,
    String? avatarUrl,
    String? authorId,
    int? depth,
    int? userVote,
    bool? isLastInThread,
  })  : _id = id,
        _postId = postId,
        _parentCommentId = parentCommentId,
        _content = content,
        _votesScore = votesScore,
        _createdAt = createdAt,
        _username = username,
        _avatarUrl = avatarUrl,
        _authorId = authorId,
        _depth = depth,
        _userVote = userVote,
        _isLastInThread = isLastInThread;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "post_id" field.
  String? _postId;
  String get postId => _postId ?? '';
  set postId(String? val) => _postId = val;

  bool hasPostId() => _postId != null;

  // "parent_comment_id" field.
  String? _parentCommentId;
  String get parentCommentId => _parentCommentId ?? '';
  set parentCommentId(String? val) => _parentCommentId = val;

  bool hasParentCommentId() => _parentCommentId != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  set content(String? val) => _content = val;

  bool hasContent() => _content != null;

  // "votes_score" field.
  int? _votesScore;
  int get votesScore => _votesScore ?? 0;
  set votesScore(int? val) => _votesScore = val;

  void incrementVotesScore(int amount) => votesScore = votesScore + amount;

  bool hasVotesScore() => _votesScore != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  set username(String? val) => _username = val;

  bool hasUsername() => _username != null;

  // "avatar_url" field.
  String? _avatarUrl;
  String get avatarUrl => _avatarUrl ?? '';
  set avatarUrl(String? val) => _avatarUrl = val;

  bool hasAvatarUrl() => _avatarUrl != null;

  // "author_id" field.
  String? _authorId;
  String get authorId => _authorId ?? '';
  set authorId(String? val) => _authorId = val;

  bool hasAuthorId() => _authorId != null;

  // "depth" field.
  int? _depth;
  int get depth => _depth ?? 0;
  set depth(int? val) => _depth = val;

  void incrementDepth(int amount) => depth = depth + amount;

  bool hasDepth() => _depth != null;

  // "user_vote" field.
  int? _userVote;
  int get userVote => _userVote ?? 0;
  set userVote(int? val) => _userVote = val;

  void incrementUserVote(int amount) => userVote = userVote + amount;

  bool hasUserVote() => _userVote != null;

  // "isLastInThread" field.
  bool? _isLastInThread;
  bool get isLastInThread => _isLastInThread ?? false;
  set isLastInThread(bool? val) => _isLastInThread = val;

  bool hasIsLastInThread() => _isLastInThread != null;

  static CommentStruct fromMap(Map<String, dynamic> data) => CommentStruct(
        id: data['id'] as String?,
        postId: data['post_id'] as String?,
        parentCommentId: data['parent_comment_id'] as String?,
        content: data['content'] as String?,
        votesScore: castToType<int>(data['votes_score']),
        createdAt: data['created_at'] as DateTime?,
        username: data['username'] as String?,
        avatarUrl: data['avatar_url'] as String?,
        authorId: data['author_id'] as String?,
        depth: castToType<int>(data['depth']),
        userVote: castToType<int>(data['user_vote']),
        isLastInThread: data['isLastInThread'] as bool?,
      );

  static CommentStruct? maybeFromMap(dynamic data) =>
      data is Map ? CommentStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'post_id': _postId,
        'parent_comment_id': _parentCommentId,
        'content': _content,
        'votes_score': _votesScore,
        'created_at': _createdAt,
        'username': _username,
        'avatar_url': _avatarUrl,
        'author_id': _authorId,
        'depth': _depth,
        'user_vote': _userVote,
        'isLastInThread': _isLastInThread,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'post_id': serializeParam(
          _postId,
          ParamType.String,
        ),
        'parent_comment_id': serializeParam(
          _parentCommentId,
          ParamType.String,
        ),
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
        'votes_score': serializeParam(
          _votesScore,
          ParamType.int,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'username': serializeParam(
          _username,
          ParamType.String,
        ),
        'avatar_url': serializeParam(
          _avatarUrl,
          ParamType.String,
        ),
        'author_id': serializeParam(
          _authorId,
          ParamType.String,
        ),
        'depth': serializeParam(
          _depth,
          ParamType.int,
        ),
        'user_vote': serializeParam(
          _userVote,
          ParamType.int,
        ),
        'isLastInThread': serializeParam(
          _isLastInThread,
          ParamType.bool,
        ),
      }.withoutNulls;

  static CommentStruct fromSerializableMap(Map<String, dynamic> data) =>
      CommentStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        postId: deserializeParam(
          data['post_id'],
          ParamType.String,
          false,
        ),
        parentCommentId: deserializeParam(
          data['parent_comment_id'],
          ParamType.String,
          false,
        ),
        content: deserializeParam(
          data['content'],
          ParamType.String,
          false,
        ),
        votesScore: deserializeParam(
          data['votes_score'],
          ParamType.int,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        username: deserializeParam(
          data['username'],
          ParamType.String,
          false,
        ),
        avatarUrl: deserializeParam(
          data['avatar_url'],
          ParamType.String,
          false,
        ),
        authorId: deserializeParam(
          data['author_id'],
          ParamType.String,
          false,
        ),
        depth: deserializeParam(
          data['depth'],
          ParamType.int,
          false,
        ),
        userVote: deserializeParam(
          data['user_vote'],
          ParamType.int,
          false,
        ),
        isLastInThread: deserializeParam(
          data['isLastInThread'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'CommentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CommentStruct &&
        id == other.id &&
        postId == other.postId &&
        parentCommentId == other.parentCommentId &&
        content == other.content &&
        votesScore == other.votesScore &&
        createdAt == other.createdAt &&
        username == other.username &&
        avatarUrl == other.avatarUrl &&
        authorId == other.authorId &&
        depth == other.depth &&
        userVote == other.userVote &&
        isLastInThread == other.isLastInThread;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        postId,
        parentCommentId,
        content,
        votesScore,
        createdAt,
        username,
        avatarUrl,
        authorId,
        depth,
        userVote,
        isLastInThread
      ]);
}

CommentStruct createCommentStruct({
  String? id,
  String? postId,
  String? parentCommentId,
  String? content,
  int? votesScore,
  DateTime? createdAt,
  String? username,
  String? avatarUrl,
  String? authorId,
  int? depth,
  int? userVote,
  bool? isLastInThread,
}) =>
    CommentStruct(
      id: id,
      postId: postId,
      parentCommentId: parentCommentId,
      content: content,
      votesScore: votesScore,
      createdAt: createdAt,
      username: username,
      avatarUrl: avatarUrl,
      authorId: authorId,
      depth: depth,
      userVote: userVote,
      isLastInThread: isLastInThread,
    );
