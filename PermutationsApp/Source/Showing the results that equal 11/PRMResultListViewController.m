#import "PRMResultListViewController.h"

@implementation PRMResultListViewController

- (id)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];

    if (self)
    {
        self.title = NSLocalizedString(@"TABLEVIEW__TITLE", nil);
        self.navigationItem.hidesBackButton = YES;
    }

    return self;
}

@end