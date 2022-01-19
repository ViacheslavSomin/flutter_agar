#import "FlutterAgarPlugin.h"
#if __has_include(<flutter_agar/flutter_agar-Swift.h>)
#import <flutter_agar/flutter_agar-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_agar-Swift.h"
#endif

@implementation FlutterAgarPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterAgarPlugin registerWithRegistrar:registrar];
}
@end
