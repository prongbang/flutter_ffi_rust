import 'dart:async';
import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ffi_rust/dynamic_library_loader.dart';
import 'package:flutter_ffi_rust/rust_greeting_native_library.dart';

class FlutterFfiRust {
  static const MethodChannel _channel = MethodChannel('flutter_ffi_rust');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> rustGreeting() async {
    final DynamicLibrary dynamicLibrary =
        DynamicLibraryLoader.load('librust_greeter.so');
    final rustGreeting = RustGreetingNativeLibrary(dynamicLibrary);

    // Prepare the parameters
    const nameStr = "John Smith";
    final Pointer<Int8> namePtr = nameStr.toNativeUtf8().cast<Int8>();
    print("- Calling rust_greeting with argument: $namePtr");

    // Call rust_greeting
    final Pointer<Int8> resultPtr = rustGreeting.rust_greeting(namePtr);
    print("- Result pointer: $resultPtr");

    // Handle the result pointer
    final String greetingStr = resultPtr.cast<Utf8>().toDartString();
    print("- Response string: $greetingStr");

    return greetingStr;
  }
}
