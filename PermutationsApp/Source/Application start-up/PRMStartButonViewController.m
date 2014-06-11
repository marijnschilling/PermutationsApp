#import "PRMStartButonViewController.h"
#import "PRMDesign.h"
#import "EEEManualLayout.h"
#import "PRMResultListViewController.h"
#import "PRMCreatePermutationLists.h"

@interface PRMStartButonViewController ()

@property(nonatomic, strong) UIButton *startButton;

@end

@implementation PRMStartButonViewController

- (id)init
{
    self = [super init];

    if (self)
    {
        self.title = NSLocalizedString(@"FIRST_TITLE", @"Permutations");
        PRMCreatePermutationLists *test = [[PRMCreatePermutationLists alloc] init];

        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [test execute];

            dispatch_async(dispatch_get_main_queue(), ^{
                [self foundAllPermutations];
            });

        });
    }

    return self;
}

- (void)loadView
{
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor whiteColor];

    self.startButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.startButton setTitle:@"START" forState:UIControlStateNormal];
    [self.startButton setTintColor:[UIColor whiteColor]];

    CGRect startButtonFrame = CGRectMake(0, 0, PRMDesignButtonSize, PRMDesignButtonSize);
    startButtonFrame = EEECGRectAlignToRect(startButtonFrame, self.view.bounds, EEECGAlignCenterHorizontally | EEECGAlignCenterVertically);
    self.startButton.frame = startButtonFrame;

    self.startButton.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin;

    self.startButton.backgroundColor = [UIColor greenColor];
    self.startButton.layer.cornerRadius = PRMDesignButtonSize / 2;
    self.startButton.layer.masksToBounds = YES;

    self.startButton.enabled = NO;

    [self.startButton addTarget:self action:@selector(didTapStartButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.startButton];
}

- (void)didTapStartButton
{
    [self.navigationController pushViewController:[[PRMResultListViewController alloc] init] animated:YES];
}

- (void)foundAllPermutations
{
    self.startButton.enabled = YES;
}

@end