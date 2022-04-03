// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
import 'dart:ffi' as ffi;

/// Bindings to `rust/target/rust_greeting.h`.
class RustGreetingNativeLibrary {
  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  RustGreetingNativeLibrary(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  RustGreetingNativeLibrary.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  ffi.Pointer<ffi.Int8> rust_greeting(
    ffi.Pointer<ffi.Int8> to,
  ) {
    return _rust_greeting(
      to,
    );
  }

  late final _rust_greetingPtr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<ffi.Int8> Function(
              ffi.Pointer<ffi.Int8>)>>('rust_greeting');
  late final _rust_greeting = _rust_greetingPtr
      .asFunction<ffi.Pointer<ffi.Int8> Function(ffi.Pointer<ffi.Int8>)>();

  void cstring_free(
    ffi.Pointer<ffi.Int8> str,
  ) {
    return _cstring_free(
      str,
    );
  }

  late final _cstring_freePtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Int8>)>>(
          'cstring_free');
  late final _cstring_free =
      _cstring_freePtr.asFunction<void Function(ffi.Pointer<ffi.Int8>)>();
}
