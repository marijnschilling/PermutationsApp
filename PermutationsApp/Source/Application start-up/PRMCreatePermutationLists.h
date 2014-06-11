#import <Foundation/Foundation.h>

@protocol PRMCreatePermutationListsDelegate;

@interface PRMCreatePermutationLists : NSObject

@property (nonatomic, weak) id<PRMCreatePermutationListsDelegate> delegate;

- (void)execute;

@end

@protocol PRMCreatePermutationListsDelegate <NSObject>
@required

-(void)foundAllPermutations;

@end