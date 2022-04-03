#import <Flutter/Flutter.h>

@interface FlutterFfiRustPlugin : NSObject<FlutterPlugin>
@end

// NOTE: Append the lines below to ios/Classes/FlutterFfiRustPlugin.h

char *rust_greeting(const char *to);

void cstring_free(char *str);
