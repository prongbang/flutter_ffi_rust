import Flutter
import UIKit

public class SwiftFlutterFfiRustPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_ffi_rust", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterFfiRustPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }

  public func dummyMethodToEnforceBundling() {
    // This will never be executed
    rust_greeting("");
  }
}
