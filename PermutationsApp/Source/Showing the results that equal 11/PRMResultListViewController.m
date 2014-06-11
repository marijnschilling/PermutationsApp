#import "PRMResultListViewController.h"

@interface PRMResultListViewController ()

@property(nonatomic, strong) NSMutableArray * correctAnswersArray;
@end

@implementation PRMResultListViewController

- (id)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];

    if (self)
    {
        self.title = NSLocalizedString(@"TABLEVIEW__TITLE", nil);
        self.navigationItem.hidesBackButton = YES;
        self.tableView = [[UITableView alloc] init];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
    }

    return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    cell.textLabel.text = [self.correctAnswersArray objectAtIndex:(NSUInteger) indexPath.row];
    cell.accessoryType =  UITableViewCellAccessoryDetailButton;

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.correctAnswersArray count];
}

@end