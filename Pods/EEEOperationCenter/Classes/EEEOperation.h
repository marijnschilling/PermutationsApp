#import <Foundation/Foundation.h>
#import "EEEInjector.h"

#ifndef OVERRIDE_ATTRIBUTE
    #define OVERRIDE_ATTRIBUTE
#endif

@interface EEEOperation : NSOperation

@property (nonatomic, strong) EEEInjector *injector;

@property(nonatomic) BOOL requiresMainThread;

@property(nonatomic) BOOL isInline;

- (instancetype)queue;

- (instancetype)inline DEPRECATED_ATTRIBUTE; // use operate `instead`
- (instancetype)operate;

- (void)execute OVERRIDE_ATTRIBUTE;

@end