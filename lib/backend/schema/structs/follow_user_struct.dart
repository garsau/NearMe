// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FollowUserStruct extends BaseStruct {
  FollowUserStruct({
    String? id,
    String? username,
    String? avatarUrl,
    bool? isFollowing,
  })  : _id = id,
        _username = username,
        _avatarUrl = avatarUrl,
        _isFollowing = isFollowing;

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

  // "is_following" field.
  bool? _isFollowing;
  bool get isFollowing => _isFollowing ?? false;
  set isFollowing(bool? val) => _isFollowing = val;

  bool hasIsFollowing() => _isFollowing != null;

  static FollowUserStruct fromMap(Map<String, dynamic> data) =>
      FollowUserStruct(
        id: data['id'] as String?,
        username: data['username'] as String?,
        avatarUrl: data['avatar_url'] as String?,
        isFollowing: data['is_following'] as bool?,
      );

  static FollowUserStruct? maybeFromMap(dynamic data) => data is Map
      ? FollowUserStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'username': _username,
        'avatar_url': _avatarUrl,
        'is_following': _isFollowing,
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
        'is_following': serializeParam(
          _isFollowing,
          ParamType.bool,
        ),
      }.withoutNulls;

  static FollowUserStruct fromSerializableMap(Map<String, dynamic> data) =>
      FollowUserStruct(
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
        isFollowing: deserializeParam(
          data['is_following'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'FollowUserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FollowUserStruct &&
        id == other.id &&
        username == other.username &&
        avatarUrl == other.avatarUrl &&
        isFollowing == other.isFollowing;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, username, avatarUrl, isFollowing]);
}

FollowUserStruct createFollowUserStruct({
  String? id,
  String? username,
  String? avatarUrl,
  bool? isFollowing,
}) =>
    FollowUserStruct(
      id: id,
      username: username,
      avatarUrl: avatarUrl,
      isFollowing: isFollowing,
    );
