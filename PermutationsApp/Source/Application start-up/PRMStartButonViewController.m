#import "PRMStartButonViewController.h"
#import "PRMDesign.h"
#import "EEEManualLayout.h"
#import "PRMResultListViewController.h"
#import "PRMPermutationCreator.h"
#import "PRMCombinationCalculator.h"

@interface PRMStartButonViewController ()

@property(nonatomic, strong) UIButton *startButton;

@property(nonatomic, strong) NSMutableArray *numberPermutations;
@property(nonatomic, strong) NSMutableArray *operationPermutations;
@end

@implementation PRMStartButonViewController

- (id)init
{
    self = [super init];

    if (self)
    {
        self.title = NSLocalizedString(@"FIRST_TITLE", @"Permutations");
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

    PRMPermutationCreator *permutationCreator = [[PRMPermutationCreator alloc] init];
    //Main thread is blocked, its a NO-GO but the quickest solution for now
    self.numberPermutations = [permutationCreator findNumberPermutations];
    self.operationPermutations = [permutationCreator findOperatorPermutations];

    self.startButton.enabled = YES;

    [self.startButton addTarget:self action:@selector(didTapStartButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.startButton];
}

- (void)didTapStartButton
{
    PRMCombinationCalculator *combinationCalculator = [[PRMCombinationCalculator alloc] init];
    [combinationCalculator startCalculatingWithNumberPermutations: self.numberPermutations operatorPermutations:self.operationPermutations];
    [self.navigationController pushViewController:[[PRMResultListViewController alloc] init] animated:YES];
}

@end