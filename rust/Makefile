build_ios:
	cargo lipo --release
	cbindgen ./src/lib.rs -c cbindgen.toml | grep -v \#include | uniq > target/rust_greeting.h
	cat ./target/rust_greeting.h >> ../ios/Classes/FlutterFfiRustPlugin.h

build_android:
	cargo ndk -t armeabi-v7a -t arm64-v8a -t x86 -o ../android/src/main/jniLibs build --release