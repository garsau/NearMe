// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProfileStruct extends BaseStruct {
  ProfileStruct({
    String? id,
    String? username,
    String? avatarUrl,
    String? bio,
    int? followersCount,
    int? followingCount,
    DateTime? createdAt,
    int? postsCount,
  })  : _id = id,
        _username = username,
        _avatarUrl = avatarUrl,
        _bio = bio,
        _followersCount = followersCount,
        _followingCount = followingCount,
        _createdAt = createdAt,
        _postsCount = postsCount;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

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

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  set bio(String? val) => _bio = val;

  bool hasBio() => _bio != null;

  // "followers_count" field.
  int? _followersCount;
  int get followersCount => _followersCount ?? 0;
  set followersCount(int? val) => _followersCount = val;

  void incrementFollowersCount(int amount) =>
      followersCount = followersCount + amount;

  bool hasFollowersCount() => _followersCount != null;

  // "following_count" field.
  int? _followingCount;
  int get followingCount => _followingCount ?? 0;
  set followingCount(int? val) => _followingCount = val;

  void incrementFollowingCount(int amount) =>
      followingCount = followingCount + amount;

  bool hasFollowingCount() => _followingCount != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "posts_count" field.
  int? _postsCount;
  int get postsCount => _postsCount ?? 0;
  set postsCount(int? val) => _postsCount = val;

  void incrementPostsCount(int amount) => postsCount = postsCount + amount;

  bool hasPostsCount() => _postsCount != null;

  static ProfileStruct fromMap(Map<String, dynamic> data) => ProfileStruct(
        id: data['id'] as String?,
        username: data['username'] as String?,
        avatarUrl: data['avatar_url'] as String?,
        bio: data['bio'] as String?,
        followersCount: castToType<int>(data['followers_count']),
        followingCount: castToType<int>(data['following_count']),
        createdAt: data['created_at'] as DateTime?,
        postsCount: castToType<int>(data['posts_count']),
      );

  static ProfileStruct? maybeFromMap(dynamic data) =>
      data is Map ? ProfileStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'username': _username,
        'avatar_url': _avatarUrl,
        'bio': _bio,
        'followers_count': _followersCount,
        'following_count': _followingCount,
        'created_at': _createdAt,
        'posts_count': _postsCount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'username': serializeParam(
          _username,
          ParamType.String,
        ),
        'avatar_url': serializeParam(
          _avatarUrl,
          ParamType.String,
        ),
        'bio': serializeParam(
          _bio,
          ParamType.String,
        ),
        'followers_count': serializeParam(
          _followersCount,
          ParamType.int,
        ),
        'following_count': serializeParam(
          _followingCount,
          ParamType.int,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'posts_count': serializeParam(
          _postsCount,
          ParamType.int,
        ),
      }.withoutNulls;

  static ProfileStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProfileStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
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
        bio: deserializeParam(
          data['bio'],
          ParamType.String,
          false,
        ),
        followersCount: deserializeParam(
          data['followers_count'],
          ParamType.int,
          false,
        ),
        followingCount: deserializeParam(
          data['following_count'],
          ParamType.int,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        postsCount: deserializeParam(
          data['posts_count'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ProfileStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProfileStruct &&
        id == other.id &&
        username == other.username &&
        avatarUrl == other.avatarUrl &&
        bio == other.bio &&
        followersCount == other.followersCount &&
        followingCount == other.followingCount &&
        createdAt == other.createdAt &&
        postsCount == other.postsCount;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        username,
        avatarUrl,
        bio,
        followersCount,
        followingCount,
        createdAt,
        postsCount
      ]);
}

ProfileStruct createProfileStruct({
  String? id,
  String? username,
  String? avatarUrl,
  String? bio,
  int? followersCount,
  int? followingCount,
  DateTime? createdAt,
  int? postsCount,
}) =>
    ProfileStruct(
      id: id,
      username: username,
      avatarUrl: avatarUrl,
      bio: bio,
      followersCount: followersCount,
      followingCount: followingCount,
      createdAt: createdAt,
      postsCount: postsCount,
    );
