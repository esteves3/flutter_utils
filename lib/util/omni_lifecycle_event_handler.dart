import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class OmniLifecycleEventHandler extends WidgetsBindingObserver {
  final AsyncCallback? resumeCallBack;
  final AsyncCallback? suspendingCallBack;

  OmniLifecycleEventHandler({
    this.resumeCallBack,
    this.suspendingCallBack,
  });

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        if (resumeCallBack != null) await resumeCallBack!();
        break;
      case AppLifecycleState.hidden:
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        if (suspendingCallBack != null) await suspendingCallBack!();
        break;
    }
  }
}
