# flutter_clarity

A Flutter plugin that allows integrating Microsoft Clarity with your application.

## Installation

```sh
flutter pub add flutter_clarity
```

## Usage

```dart
import 'package:flutter_clarity/flutter_clarity.dart';

// Initialize Clarity.
FlutterClarityPlugin.initialize("<ProjectId>");

// Set custom user id.
FlutterClarityPlugin.setCustomUserId("<UserID>");

// Get current session id to correlate with other tools.
FlutterClarityPlugin.getCurrentSessionId().then((id) => {...});
```

### Initialization arguments

```dart
/**
 * Initializes the Clarity plugin with the provided parameters.
 *
 * @param projectId     The Clarity project id to send data to.
 * @param userId        A custom identifier for the current user. If passed as undefined, the user id
 *                      will be auto generated. The user id in general is sticky across sessions.
 *                      The provided user id must follow these conditions:
 *                          1. Cannot be an empty string.
 *                          2. Should be base36 and smaller than "1Z141Z4".
 * @param logLevel      The level of logging to show in the device logcat stream ("Verbose", "Debug", "Info", "Warning", "Error", "None").
 * @param allowMeteredNetworkUsage  Allows uploading session data to the servers on device metered network.
 * @param enableWebViewCapture    Allows Clarity to capture the web views DOM content.
 * @param allowedDomains    The whitelisted domains to allow Clarity to capture their DOM content.
 *                          If it contains "*" as an element, all domains will be captured.
 */
function initialize(
  projectId: string,
  userId?: string,
  logLevel: string = "None",
  allowMeteredNetworkUsage: boolean = false,
  enableWebViewCapture: boolean = true,
  allowedDomains: string[] = ["*"],
)
```

## License

MIT