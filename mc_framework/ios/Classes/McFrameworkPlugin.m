#import "McFrameworkPlugin.h"

@implementation McFrameworkPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"mc_framework"
            binaryMessenger:[registrar messenger]];
  McFrameworkPlugin* instance = [[McFrameworkPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSArray * methods = @[@"getName", @"goPage"];
    NSInteger index = [methods indexOfObject:call.method];
    switch (index) {
        case 0: {
            // 获取名字
            result(@"iOS");
            break;
        }
        case 1: {
            // 跳转
            UIViewController * vc = [[[UIApplication sharedApplication] keyWindow] rootViewController];
            UIViewController * newViewController = [[UIViewController alloc] init];
            newViewController.view.backgroundColor = [UIColor redColor];
            [vc presentViewController:newViewController animated:YES completion:^{
                [newViewController dismissViewControllerAnimated:YES completion:nil];
            }];
            break;
        }
    }
}

@end
