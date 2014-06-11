#import "PRMAppDelegate.h"
#import "PRMStartButonViewController.h"

@implementation PRMAppDelegate

- (UIWindow *)window
{
    if (!_window)
    {
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        _window.backgroundColor = [UIColor whiteColor];
        _window.tintColor = [UIColor greenColor];
    }

    return _window;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self assignRootViewController];
    return [self makeWindowKeyAndVisible];
}

- (void)assignRootViewController
{
    UINavigationController *navigationController = [[UINavigationController alloc] init];
    navigationController.viewControllers = @[[[PRMStartButonViewController alloc] init]];
    self.window.rootViewController = navigationController;
}

- (BOOL)makeWindowKeyAndVisible
{
    [self.window makeKeyAndVisible];
    return YES;
}

@end
