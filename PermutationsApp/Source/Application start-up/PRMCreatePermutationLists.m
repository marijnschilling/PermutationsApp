#import "PRMCreatePermutationLists.h"

@interface PRMCreatePermutationLists ()
@property(nonatomic, strong) NSArray *numbers;
@property(nonatomic, strong) NSArray *operators;
@property(nonatomic, strong) NSMutableArray *numberPermutations;
@property(nonatomic, strong) NSMutableArray *operationPermutations;
@end

@implementation PRMCreatePermutationLists

- (id)init
{
    self = [super init];

    if (self)
    {
        self.numbers = @[@2, @4, @8, @16, @32];
        self.operators = @[@"+", @"-", @"*", @"/"];
        self.numberPermutations = [NSMutableArray array];
        self.operationPermutations = [NSMutableArray array];
    }

    return self;
}

- (void)execute
{
    NSMutableArray *result = [NSMutableArray array];
    NSMutableArray *leftover = [self.numbers mutableCopy];
    [self findNumberPermutationsRecursivelyfromLeftover:leftover andResult:result];

    [self findOperatorPermutations];
    NSLog(@"number of operation permutations %u", [self.operationPermutations count]);
}

- (void)findNumberPermutationsRecursivelyfromLeftover:(NSMutableArray *)leftover andResult:(NSMutableArray *)result
{
    if ([leftover count] == 0)
    {
        [self.numberPermutations addObject:result];
    }
    else
    {
        for (NSUInteger i = 0; i < [leftover count]; i++)
        {
            NSMutableArray *leftoverCopy = [leftover mutableCopy];
            NSMutableArray *resultCopy = [result mutableCopy];

            [resultCopy addObject:leftoverCopy[i]];
            [leftoverCopy removeObjectAtIndex:i];

            [self findNumberPermutationsRecursivelyfromLeftover:leftoverCopy andResult:resultCopy];
        }
    }
}

- (void)findOperatorPermutations
{
    for (NSUInteger i = 0; i < [self.operators count]; i++)
    {
        for (NSUInteger j = 0; j < [self.operators count]; j++)
        {
            for (NSUInteger k = 0; k < [self.operators count]; k++)
            {
                for (NSUInteger l = 0; l < [self.operators count]; l++)
                {
                    NSArray *operationsPermutation;
                    operationsPermutation = @[@[self.operators[i]], @[self.operators[j]], @[self.operators[k]], @[self.operators[l]]];
                    [self.operationPermutations addObject:operationsPermutation];
                }
            }
        }
    }
}

@end
