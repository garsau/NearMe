import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_userProfile')) {
        try {
          final serializedData = prefs.getString('ff_userProfile') ?? '{}';
          _userProfile =
              ProfileStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _localPostsMap = prefs
              .getStringList('ff_localPostsMap')
              ?.map((x) {
                try {
                  return PostViewStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _localPostsMap;
    });
    _safeInit(() {
      _localPostsFeed = prefs
              .getStringList('ff_localPostsFeed')
              ?.map((x) {
                try {
                  return PostViewStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _localPostsFeed;
    });
    _safeInit(() {
      _feedOffset = prefs.getInt('ff_feedOffset') ?? _feedOffset;
    });
    _safeInit(() {
      _localCommentsFeed = prefs
              .getStringList('ff_localCommentsFeed')
              ?.map((x) {
                try {
                  return CommentStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _localCommentsFeed;
    });
    _safeInit(() {
      _cityName = prefs.getString('ff_cityName') ?? _cityName;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  ProfileStruct _userProfile = ProfileStruct();
  ProfileStruct get userProfile => _userProfile;
  set userProfile(ProfileStruct value) {
    _userProfile = value;
    prefs.setString('ff_userProfile', value.serialize());
  }

  void updateUserProfileStruct(Function(ProfileStruct) updateFn) {
    updateFn(_userProfile);
    prefs.setString('ff_userProfile', _userProfile.serialize());
  }

  List<PostViewStruct> _localPostsMap = [];
  List<PostViewStruct> get localPostsMap => _localPostsMap;
  set localPostsMap(List<PostViewStruct> value) {
    _localPostsMap = value;
    prefs.setStringList(
        'ff_localPostsMap', value.map((x) => x.serialize()).toList());
  }

  void addToLocalPostsMap(PostViewStruct value) {
    localPostsMap.add(value);
    prefs.setStringList(
        'ff_localPostsMap', _localPostsMap.map((x) => x.serialize()).toList());
  }

  void removeFromLocalPostsMap(PostViewStruct value) {
    localPostsMap.remove(value);
    prefs.setStringList(
        'ff_localPostsMap', _localPostsMap.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromLocalPostsMap(int index) {
    localPostsMap.removeAt(index);
    prefs.setStringList(
        'ff_localPostsMap', _localPostsMap.map((x) => x.serialize()).toList());
  }

  void updateLocalPostsMapAtIndex(
    int index,
    PostViewStruct Function(PostViewStruct) updateFn,
  ) {
    localPostsMap[index] = updateFn(_localPostsMap[index]);
    prefs.setStringList(
        'ff_localPostsMap', _localPostsMap.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInLocalPostsMap(int index, PostViewStruct value) {
    localPostsMap.insert(index, value);
    prefs.setStringList(
        'ff_localPostsMap', _localPostsMap.map((x) => x.serialize()).toList());
  }

  List<PostViewStruct> _localPostsFeed = [];
  List<PostViewStruct> get localPostsFeed => _localPostsFeed;
  set localPostsFeed(List<PostViewStruct> value) {
    _localPostsFeed = value;
    prefs.setStringList(
        'ff_localPostsFeed', value.map((x) => x.serialize()).toList());
  }

  void addToLocalPostsFeed(PostViewStruct value) {
    localPostsFeed.add(value);
    prefs.setStringList('ff_localPostsFeed',
        _localPostsFeed.map((x) => x.serialize()).toList());
  }

  void removeFromLocalPostsFeed(PostViewStruct value) {
    localPostsFeed.remove(value);
    prefs.setStringList('ff_localPostsFeed',
        _localPostsFeed.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromLocalPostsFeed(int index) {
    localPostsFeed.removeAt(index);
    prefs.setStringList('ff_localPostsFeed',
        _localPostsFeed.map((x) => x.serialize()).toList());
  }

  void updateLocalPostsFeedAtIndex(
    int index,
    PostViewStruct Function(PostViewStruct) updateFn,
  ) {
    localPostsFeed[index] = updateFn(_localPostsFeed[index]);
    prefs.setStringList('ff_localPostsFeed',
        _localPostsFeed.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInLocalPostsFeed(int index, PostViewStruct value) {
    localPostsFeed.insert(index, value);
    prefs.setStringList('ff_localPostsFeed',
        _localPostsFeed.map((x) => x.serialize()).toList());
  }

  int _feedOffset = 0;
  int get feedOffset => _feedOffset;
  set feedOffset(int value) {
    _feedOffset = value;
    prefs.setInt('ff_feedOffset', value);
  }

  List<CommentStruct> _localCommentsFeed = [];
  List<CommentStruct> get localCommentsFeed => _localCommentsFeed;
  set localCommentsFeed(List<CommentStruct> value) {
    _localCommentsFeed = value;
    prefs.setStringList(
        'ff_localCommentsFeed', value.map((x) => x.serialize()).toList());
  }

  void addToLocalCommentsFeed(CommentStruct value) {
    localCommentsFeed.add(value);
    prefs.setStringList('ff_localCommentsFeed',
        _localCommentsFeed.map((x) => x.serialize()).toList());
  }

  void removeFromLocalCommentsFeed(CommentStruct value) {
    localCommentsFeed.remove(value);
    prefs.setStringList('ff_localCommentsFeed',
        _localCommentsFeed.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromLocalCommentsFeed(int index) {
    localCommentsFeed.removeAt(index);
    prefs.setStringList('ff_localCommentsFeed',
        _localCommentsFeed.map((x) => x.serialize()).toList());
  }

  void updateLocalCommentsFeedAtIndex(
    int index,
    CommentStruct Function(CommentStruct) updateFn,
  ) {
    localCommentsFeed[index] = updateFn(_localCommentsFeed[index]);
    prefs.setStringList('ff_localCommentsFeed',
        _localCommentsFeed.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInLocalCommentsFeed(int index, CommentStruct value) {
    localCommentsFeed.insert(index, value);
    prefs.setStringList('ff_localCommentsFeed',
        _localCommentsFeed.map((x) => x.serialize()).toList());
  }

  String _cityName = 'Muchamiel';
  String get cityName => _cityName;
  set cityName(String value) {
    _cityName = value;
    prefs.setString('ff_cityName', value);
  }

  PostViewStruct _selectedPostMap = PostViewStruct();
  PostViewStruct get selectedPostMap => _selectedPostMap;
  set selectedPostMap(PostViewStruct value) {
    _selectedPostMap = value;
  }

  void updateSelectedPostMapStruct(Function(PostViewStruct) updateFn) {
    updateFn(_selectedPostMap);
  }

  bool _showSelectedPostMap = false;
  bool get showSelectedPostMap => _showSelectedPostMap;
  set showSelectedPostMap(bool value) {
    _showSelectedPostMap = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
