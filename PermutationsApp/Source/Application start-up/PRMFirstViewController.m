#import "PRMFirstViewController.h"

@implementation PRMFirstViewController

- (id)init
{
    self = [super init];

    if (self)
    {
        self.title = NSLocalizedString(@"FIRST_TITLE", @"TribalMask");
    }

    return self;
}

- (void)loadView
{
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor whiteColor];
}

@end