// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future sendUnityMessage(
  String gameObject,
  String method,
  String message,
) async {
  UnityActions.sendMessageToUnity(
    gameObject: gameObject,
    method: method,
    message: message,
  );
}
