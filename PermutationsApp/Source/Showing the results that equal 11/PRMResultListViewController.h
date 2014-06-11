#import <Foundation/Foundation.h>

@interface PRMResultListViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

- (id)initWithResults:(NSMutableArray *)results;
@end