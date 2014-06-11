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
    [self findNumberPermutations:self.numbers succesBlock:^(){
        [self findOperatorPermutations:self.operators succesBlock:^(){
            [self.delegate foundAllPermutations];
        }];
    }];
}

- (void)findNumberPermutations:(NSArray *)numbers succesBlock:(void (^)())succes
{
    NSMutableArray *result = [NSMutableArray array];
    NSMutableArray *leftover = [self.numbers mutableCopy];
    [self findPermutationsRecursivelyfromLeftover:leftover andResult:result];
    succes();
}

- (void)findPermutationsRecursivelyfromLeftover:(NSMutableArray *)leftover andResult:(NSMutableArray *)result
{
    if([leftover count] == 0)
    {
        [self.numberPermutations addObject:result];
        NSLog(@"found %@", result);
    }
    else
    {
        for(NSUInteger i = 0; i < [leftover count]; i++)
        {
            NSMutableArray * leftoverCopy = [leftover mutableCopy];
            NSMutableArray * resultCopy = [result mutableCopy];

            [resultCopy addObject:leftoverCopy[i]];
            [leftoverCopy removeObjectAtIndex:i];

            [self findPermutationsRecursivelyfromLeftover:leftoverCopy andResult:resultCopy];
        }
    }
}

- (void)findOperatorPermutations:(NSArray *)operators succesBlock:(void (^)())succes
{

}

@end