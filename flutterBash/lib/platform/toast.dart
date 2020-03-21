import 'package:flutter/services.dart';

const platform = const MethodChannel("com.boybian.flutter_system/toast");

/// show a toast
Future<void> showToast(String message) async {
  await platform.invokeMethod("showToast", message);
}
