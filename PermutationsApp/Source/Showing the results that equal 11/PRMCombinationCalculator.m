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
//    NSMutableString *operation = [NSMutableString string];
//    for(NSUInteger i = 0; i < [operations count]; i++)
//    {
//        operation = [operation stringByAppendingString:(NSMutableString *)numbers[i]];
//        operation = [operation stringByAppendingString:(NSMutableString *)operations[i]];
//    }

    NSString *n1 = numbers[0];
    NSString *n2 = numbers[1];
    NSString *n3 = numbers[2];
    NSString *n4 = numbers[3];
    NSString *n5 = numbers[4];

    NSString *o1 = operations[0];
    NSString *o2 = operations[1];
    NSString *o3 = operations[2];
    NSString *o4 = operations[3];
    NSString *calculation = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@", n1, o1, n2, o2, n3, o3, n4, o4, n5];

    NSString *javaScriptString = [NSString stringWithFormat:@"eval(%@)", calculation];
    NSString *result = [self.webview stringByEvaluatingJavaScriptFromString:javaScriptString];

    if ([result isEqualToString:@"11"])
    {
        NSLog(@"11 gevonden! with %@", calculation);
        [self.results addObject:calculation];
    }
}

@end