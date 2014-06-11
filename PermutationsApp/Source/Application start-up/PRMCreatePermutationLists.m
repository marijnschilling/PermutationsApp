#import "PRMCreatePermutationLists.h"

@interface PRMCreatePermutationLists ()
@property(nonatomic, strong) NSArray *numbers;
@property(nonatomic, strong) NSArray *operators;
@property(nonatomic, strong) NSMutableArray *numberPermutations;
@end

@implementation PRMCreatePermutationLists

- (id)init
{
    self = [super init];

    if (self)
    {
        self.numbers = @[@2, @4,@8, @16, @32];
        self.operators = @[@"+", @"-", @"*", @"/"];
        self.numberPermutations = [NSMutableArray array];
    }

    return self;
}

- (void)execute
{
    NSMutableArray *result = [NSMutableArray array];
    NSMutableArray *leftover = [self.numbers mutableCopy];
    [self findNumberPermutationsRecursivelyfromLeftover:leftover andResult:result];
    NSLog(@"Found %@", self.numberPermutations);
//    [self findOperatorPermutationsRecursively]

    [self.delegate foundAllPermutations];
}



- (void)findNumberPermutationsRecursivelyfromLeftover:(NSMutableArray *)leftover andResult:(NSMutableArray *)result
{
    if([leftover count] == 0)
    {
        [self.numberPermutations addObject:result];
    }
    else
    {
        for(NSUInteger i = 0; i < [leftover count]; i++)
        {
            NSMutableArray * leftoverCopy = [leftover mutableCopy];
            NSMutableArray * resultCopy = [result mutableCopy];

            [resultCopy addObject:leftoverCopy[i]];
            [leftoverCopy removeObjectAtIndex:i];

            [self findNumberPermutationsRecursivelyfromLeftover:leftoverCopy andResult:resultCopy];
        }
    }
}

@end