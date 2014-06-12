#import "PRMCombinationCalculator.h"

@interface PRMCombinationCalculator ()

@property(nonatomic, strong) UIWebView *webview;
@property(nonatomic, strong) NSMutableArray * resultsThatEqual11;

@end

@implementation PRMCombinationCalculator

- (id)init
{
    self = [super init];

    if (self)
    {
        self.webview = [[UIWebView alloc] init];
        self.resultsThatEqual11 = [[NSMutableArray alloc] init];
    }

    return self;
}

- (NSMutableArray *)startCalculatingNumberPermutations:(NSMutableArray *)numbers withOperatorPermutations:(NSMutableArray *)operations
{
    for (NSUInteger i = 0; i < [numbers count]; i++)
    {
        for (NSUInteger j = 0; j < [operations count]; j++)
        {
            [self calculateNumberPermutation:numbers[i] withOperationPermutation:operations[j]];
        }
    }
    
    return self.resultsThatEqual11;
}

- (void)calculateNumberPermutation:(NSMutableArray *)numbers withOperationPermutation:(NSMutableArray *)operations
{
    NSMutableString *operation = [NSMutableString string];
    for(NSUInteger i = 0; i < [operations count]; i++)
    {
        NSString *addedNumberAndOperator = [NSString stringWithFormat:@"%@%@%@", operation, numbers[i], operations[i]];
        operation = [addedNumberAndOperator mutableCopy];
    }
    NSString *calculation = [NSString stringWithFormat:@"%@%@",operation,[numbers lastObject]];

    NSString *javaScript = [NSString stringWithFormat:@"eval(%@)", calculation];
    NSString *result = [self.webview stringByEvaluatingJavaScriptFromString:javaScript];


    if ([result isEqualToString:@"11"])
    {
        NSString *calculationWithResult = [NSString stringWithFormat:@"%@ = %@", calculation, result];
        [self.resultsThatEqual11 addObject:calculationWithResult];
    }
}

@end