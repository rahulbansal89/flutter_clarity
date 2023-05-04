import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_clarity_platform_interface.dart';

/// An implementation of [FlutterClarityPlatform] that uses method channels.
class MethodChannelFlutterClarity extends FlutterClarityPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_clarity');

  @override
  Future<void> initialize({
    required String projectId,
    String? userId,
    String? logLevel = "None",
    bool? allowMeteredNetworkUsage = false,
    bool? enableWebViewCapture = true,
    List<String>? allowedDomains,
  }) async {
    await methodChannel.invokeMethod<void>('initialize', {
      'projectId': projectId,
      'userId': userId,
      "logLevel": logLevel,
      "allowMeteredNetworkUsage": allowMeteredNetworkUsage,
      "enableWebViewCapture": enableWebViewCapture,
      "allowedDomains": allowedDomains,
    });
  }

  @override
  void setCustomUserId(String customUserId) async {
    await methodChannel.invokeMethod<void>('setCustomUserId', {
      "customUserId": customUserId,
    });
  }

  @override
  Future<String?> getCurrentSessionId() async {
    String? sessionId =
        await methodChannel.invokeMethod<String>('getCurrentSessionId');
    return sessionId;
  }
}
