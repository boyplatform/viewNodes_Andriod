import 'package:flutter/services.dart';

const platform = const MethodChannel("samples.flutter.io/pluginAndriod");

/// show a toast
Future<void> showToast(String message) async {
  await platform.invokeMethod("showToast", message);
}
