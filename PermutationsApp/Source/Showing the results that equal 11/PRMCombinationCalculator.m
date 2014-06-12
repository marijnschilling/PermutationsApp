#import "PRMCombinationCalculator.h"

@interface PRMCombinationCalculator ()
@property(nonatomic, strong) UIWebView *webview;
@property(nonatomic, strong) NSMutableArray * results;
@end

@implementation PRMCombinationCalculator

- (id)init
{
    self = [super init];

    if (self)
    {
        self.webview = [[UIWebView alloc] init];
        self.results = [[NSMutableArray alloc] init];
    }

    return self;
}

- (NSMutableArray *)startCalculatingWithNumberPermutations:(NSMutableArray *)numbers operatorPermutations:(NSMutableArray *)operations
{
    for (NSUInteger i = 0; i < [numbers count]; i++)
    {
        for (NSUInteger j = 0; j < [operations count]; j++)
        {
            [self calculateNumberPermutation:numbers[i] withOperationPermutation:operations[j]];
        }
    }
    
    return self.results;
}

- (void)calculateNumberPermutation:(NSMutableArray *)numbers withOperationPermutation:(NSMutableArray *)operations
{
    NSMutableString *operation = [NSMutableString string];
    for(NSUInteger i = 0; i < [operations count]; i++)
    {
        NSString *newString = [NSString stringWithFormat:@"%@%@%@", operation, numbers[i], operations[i]];
        operation = [newString mutableCopy];
    }
    NSString *calculation = [NSString stringWithFormat:@"%@%@",operation,[numbers lastObject]];

    NSString *javaScriptString = [NSString stringWithFormat:@"eval(%@)", calculation];
    NSString *result = [self.webview stringByEvaluatingJavaScriptFromString:javaScriptString];

    if ([result isEqualToString:@"11"])
    {
        NSLog(@"11 gevonden! with %@", calculation);
        [self.results addObject:calculation];
    }
}

@end