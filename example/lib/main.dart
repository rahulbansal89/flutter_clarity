import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_clarity/flutter_clarity.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _flutterClarityPlugin = FlutterClarityPlugin();
  String _sessionId = 'Unknown';

  @override
  void initState() {
    super.initState();
    initClarityState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initClarityState() async {
    String sessionId;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      // Demo project id : fwof4hmuvb
      await _flutterClarityPlugin.initialize(projectId: 'fwof4hmuvb');

      sessionId = await _flutterClarityPlugin.getCurrentSessionId() ??
          'Unknown clarity session';
    } on PlatformException {
      sessionId = 'Failed to get clarity session.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _sessionId = sessionId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Clarity example app'),
        ),
        body: Center(
          child: Text('Clarity session: $_sessionId\n'),
        ),
      ),
    );
  }
}
