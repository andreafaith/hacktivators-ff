// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import '../actions/unity_actions.dart';

class UnityWidgetView extends StatefulWidget {
  const UnityWidgetView({
    Key? key,
    this.width,
    this.height,
    this.fullscreen = false,
    this.webUrl,
  }) : super(key: key);

  // FlutterFlow parameters
  final double? width;
  final double? height;
  final bool fullscreen;
  final String? webUrl;

  @override
  State<UnityWidgetView> createState() => _UnityWidgetViewState();
}

class _UnityWidgetViewState extends State<UnityWidgetView> {
  // Unity controller
  UnityWidgetController? _unityWidgetController;

  @override
  void dispose() {
    _unityWidgetController?.dispose();
    super.dispose();
  }

  // Unity callbacks
  void onUnityCreated(controller) {
    _unityWidgetController = controller;
    // Set controller in UnityActions for FlutterFlow custom actions
    UnityActions.setController(controller);
  }

  void onUnityMessage(dynamic message) {
    debugPrint('Unity Message: ${message.toString()}');
  }

  void onUnitySceneLoaded(SceneLoaded? sceneInfo) {
    if (sceneInfo != null) {
      debugPrint('Unity Scene: ${sceneInfo.name}');
    }
  }

  Widget _buildUnityWidget() {
    // Web platform handling
    if (kIsWeb && widget.webUrl != null) {
      return Container(
        width: widget.width ?? MediaQuery.of(context).size.width,
        height: widget.height ?? MediaQuery.of(context).size.height,
        child: HtmlElementView(
          viewType: 'unity-web-player',
          onPlatformViewCreated: (int id) {
            // Web initialization
          },
        ),
      );
    }

    // Native platforms (iOS, Android)
    final unityWidget = UnityWidget(
      onUnityCreated: onUnityCreated,
      onUnityMessage: onUnityMessage,
      onUnitySceneLoaded: onUnitySceneLoaded,
      fullscreen: widget.fullscreen,
    );

    // Add pointer interceptor for web
    if (kIsWeb) {
      return PointerInterceptor(child: unityWidget);
    }

    return unityWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? MediaQuery.of(context).size.width,
      height: widget.height ?? MediaQuery.of(context).size.height,
      child: _buildUnityWidget(),
    );
  }
}
