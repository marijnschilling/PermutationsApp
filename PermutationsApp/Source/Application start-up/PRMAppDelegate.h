#import <UIKit/UIKit.h>

@interface PRMAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (void)assignRootViewController;
- (BOOL)makeWindowKeyAndVisible;

@end