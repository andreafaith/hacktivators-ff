import 'package:flutter/material.dart';
import '/backend/backend.dart';
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

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _pauseUnityContent = '';
  String get pauseUnityContent => _pauseUnityContent;
  set pauseUnityContent(String value) {
    _pauseUnityContent = value;
  }

  String _sendUnityMessage = '';
  String get sendUnityMessage => _sendUnityMessage;
  set sendUnityMessage(String value) {
    _sendUnityMessage = value;
  }

  String _unloadUnityContent = '';
  String get unloadUnityContent => _unloadUnityContent;
  set unloadUnityContent(String value) {
    _unloadUnityContent = value;
  }

  String _resumeUnityContent = '';
  String get resumeUnityContent => _resumeUnityContent;
  set resumeUnityContent(String value) {
    _resumeUnityContent = value;
  }

  String _UnityActions = '';
  String get UnityActions => _UnityActions;
  set UnityActions(String value) {
    _UnityActions = value;
  }
}
