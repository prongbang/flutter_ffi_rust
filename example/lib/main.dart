import 'package:flutter/material.dart';
import 'package:flutter_ffi_rust/flutter_ffi_rust.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _message = "";

  void _callRustGreating() async {
    final result = await FlutterFfiRust.rustGreeting();
    setState(() {
      _message = result;
    });
  }

  @override
  void initState() {
    super.initState();
    _callRustGreating();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter FFI Rust'),
        ),
        body: Center(
          child: Text('Call Rust Greeting: $_message'),
        ),
      ),
    );
  }
}
