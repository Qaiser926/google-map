#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
import GoogleMaps
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
[GMSServices provideAPIKey:@"AIzaSyA5AqTCc8eq5-eQv1M2TpoLTo3bhh_SvZk"];

    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
