// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostViewStruct extends BaseStruct {
  PostViewStruct({
    String? id,
    String? content,
    bool? isBottle,
    int? votesScore,
    DateTime? createdAt,
    double? lat,
    double? lng,
    String? username,
    String? avatarUrl,
    String? authorId,
  })  : _id = id,
        _content = content,
        _isBottle = isBottle,
        _votesScore = votesScore,
        _createdAt = createdAt,
        _lat = lat,
        _lng = lng,
        _username = username,
        _avatarUrl = avatarUrl,
        _authorId = authorId;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  set content(String? val) => _content = val;

  bool hasContent() => _content != null;

  // "is_bottle" field.
  bool? _isBottle;
  bool get isBottle => _isBottle ?? false;
  set isBottle(bool? val) => _isBottle = val;

  bool hasIsBottle() => _isBottle != null;

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

  // "lat" field.
  double? _lat;
  double get lat => _lat ?? 0.0;
  set lat(double? val) => _lat = val;

  void incrementLat(double amount) => lat = lat + amount;

  bool hasLat() => _lat != null;

  // "lng" field.
  double? _lng;
  double get lng => _lng ?? 0.0;
  set lng(double? val) => _lng = val;

  void incrementLng(double amount) => lng = lng + amount;

  bool hasLng() => _lng != null;

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

  static PostViewStruct fromMap(Map<String, dynamic> data) => PostViewStruct(
        id: data['id'] as String?,
        content: data['content'] as String?,
        isBottle: data['is_bottle'] as bool?,
        votesScore: castToType<int>(data['votes_score']),
        createdAt: data['created_at'] as DateTime?,
        lat: castToType<double>(data['lat']),
        lng: castToType<double>(data['lng']),
        username: data['username'] as String?,
        avatarUrl: data['avatar_url'] as String?,
        authorId: data['author_id'] as String?,
      );

  static PostViewStruct? maybeFromMap(dynamic data) =>
      data is Map ? PostViewStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'content': _content,
        'is_bottle': _isBottle,
        'votes_score': _votesScore,
        'created_at': _createdAt,
        'lat': _lat,
        'lng': _lng,
        'username': _username,
        'avatar_url': _avatarUrl,
        'author_id': _authorId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
        'is_bottle': serializeParam(
          _isBottle,
          ParamType.bool,
        ),
        'votes_score': serializeParam(
          _votesScore,
          ParamType.int,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'lat': serializeParam(
          _lat,
          ParamType.double,
        ),
        'lng': serializeParam(
          _lng,
          ParamType.double,
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
      }.withoutNulls;

  static PostViewStruct fromSerializableMap(Map<String, dynamic> data) =>
      PostViewStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        content: deserializeParam(
          data['content'],
          ParamType.String,
          false,
        ),
        isBottle: deserializeParam(
          data['is_bottle'],
          ParamType.bool,
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
        lat: deserializeParam(
          data['lat'],
          ParamType.double,
          false,
        ),
        lng: deserializeParam(
          data['lng'],
          ParamType.double,
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
      );

  @override
  String toString() => 'PostViewStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PostViewStruct &&
        id == other.id &&
        content == other.content &&
        isBottle == other.isBottle &&
        votesScore == other.votesScore &&
        createdAt == other.createdAt &&
        lat == other.lat &&
        lng == other.lng &&
        username == other.username &&
        avatarUrl == other.avatarUrl &&
        authorId == other.authorId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        content,
        isBottle,
        votesScore,
        createdAt,
        lat,
        lng,
        username,
        avatarUrl,
        authorId
      ]);
}

PostViewStruct createPostViewStruct({
  String? id,
  String? content,
  bool? isBottle,
  int? votesScore,
  DateTime? createdAt,
  double? lat,
  double? lng,
  String? username,
  String? avatarUrl,
  String? authorId,
}) =>
    PostViewStruct(
      id: id,
      content: content,
      isBottle: isBottle,
      votesScore: votesScore,
      createdAt: createdAt,
      lat: lat,
      lng: lng,
      username: username,
      avatarUrl: avatarUrl,
      authorId: authorId,
    );
