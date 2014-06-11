#import <Foundation/Foundation.h>

@interface PRMCombinationCalculator : NSObject

- (NSMutableArray *)startCalculatingWithNumberPermutations:(NSMutableArray *)numbers operatorPermutations:(NSMutableArray *)operations;

@end