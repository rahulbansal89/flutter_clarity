import 'flutter_clarity_platform_interface.dart';

import 'dart:io';

/// Provides action to integrate and initialize Microsoft Clarity
class FlutterClarityPlugin {
  /// No work is done when instantiating the plugin. It's safe to call this
  /// repeatedly or in performance-sensitive blocks.
  FlutterClarityPlugin();

  // This is to manually endorse the Linux plugin until automatic registration
  // of dart plugins is implemented.
  // See https://github.com/flutter/flutter/issues/52267 for more details.
  static FlutterClarityPlatform get _platform {
    return FlutterClarityPlatform.instance;
  }

  /// Initializes the Clarity plugin with the provided parameters.
  ///
  /// @param projectId     The Clarity project id to send data to.
  /// @param userId        A custom identifier for the current user. If passed as undefined, the user id
  ///                      will be auto generated. The user id in general is sticky across sessions.
  ///                      The provided user id must follow these conditions:
  ///                          1. Cannot be an empty string.
  ///                          2. Should be base36 and smaller than "1Z141Z4".
  /// @param logLevel      The level of logging to show in the device logcat stream ("Verbose", "Debug", "Info", "Warning", "Error", "None").
  /// @param allowMeteredNetworkUsage  Allows uploading session data to the servers on device metered network.
  /// @param enableWebViewCapture    Allows Clarity to capture the web views DOM content.
  /// @param allowedDomains    The whitelisted domains to allow Clarity to capture their DOM content.
  ///                          If it contains "*" as an element, all domains will be captured.
  Future<void> initialize({
    required String projectId,
    String? userId,
    String? logLevel = "None",
    bool? allowMeteredNetworkUsage = false,
    bool? enableWebViewCapture = true,
    List<String>? allowedDomains,
  }) async {
    if (!Platform.isAndroid) {
      // print("Clarity supports Android only for now.");
      return;
    }

    _platform.initialize(
      projectId: projectId,
      userId: userId,
      logLevel: logLevel,
      allowMeteredNetworkUsage: allowMeteredNetworkUsage,
      enableWebViewCapture: enableWebViewCapture,
      allowedDomains: allowedDomains,
    );
  }

  /// Sets a custom user id that can be used to identify the user. It has less
  /// restrictions than the userId parameter. You can pass any string and
  /// you can filter on it on the dashboard side. If you need the most efficient
  /// filtering on the dashboard, use the userId parameter if possible.
  /// <p>
  /// Note: custom user id cannot be null or empty, or consists only of whitespaces.
  /// </p>
  /// @param customUserId   The custom user id to set.
  void setCustomUserId(String customUserId) {
    if (!Platform.isAndroid) {
      // print("Clarity supports Android only for now.");
      return;
    }

    _platform.setCustomUserId(customUserId);
  }

  /// Returns the active session id. This can be used to correlate the Clarity session with other
  /// analytics tools that the developer may be using.
  /// @returns a promise that resolves to the current session id.
  Future<String?> getCurrentSessionId() async {
    if (!Platform.isAndroid) {
      // print("Clarity supports Android only for now.");
      return Future(() => "");
    }

    return _platform.getCurrentSessionId();
  }
}
