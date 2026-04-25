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

  LatLng? _userLocation = LatLng(38.401717, -0.4356604);
  LatLng? get userLocation => _userLocation;
  set userLocation(LatLng? value) {
    _userLocation = value;
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
