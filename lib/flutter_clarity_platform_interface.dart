import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_clarity_method_channel.dart';

abstract class FlutterClarityPlatform extends PlatformInterface {
  /// Constructs a FlutterClarityPlatform.
  FlutterClarityPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterClarityPlatform _instance = MethodChannelFlutterClarity();

  /// The default instance of [FlutterClarityPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterClarity].
  static FlutterClarityPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterClarityPlatform] when
  /// they register themselves.
  static set instance(FlutterClarityPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> initialize({
    required String projectId,
    String? userId,
    String? logLevel = "None",
    bool? allowMeteredNetworkUsage = false,
    bool? enableWebViewCapture = true,
    List<String>? allowedDomains,
  }) {
    throw UnimplementedError('initialize() has not been implemented.');
  }

  void setCustomUserId(String customUserId) {
    throw UnimplementedError('setCustomUserId() has not been implemented.');
  }

  Future<String?> getCurrentSessionId() {
    throw UnimplementedError('getCurrentSessionId() has not been implemented.');
  }
}
