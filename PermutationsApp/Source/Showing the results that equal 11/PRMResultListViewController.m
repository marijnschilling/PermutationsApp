#import "PRMResultListViewController.h"

@interface PRMResultListViewController ()

@property(nonatomic, strong) NSMutableArray *correctAnswersArray;
@end

@implementation PRMResultListViewController

- (id)initWithResults:(NSMutableArray *)results
{
    self = [super initWithStyle:UITableViewStyleGrouped];

    if (self)
    {
        self.title = NSLocalizedString(@"TABLEVIEW__TITLE", nil);
        self.tableView = [[UITableView alloc] init];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.correctAnswersArray = results;
    }

    return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    cell.textLabel.text = [self.correctAnswersArray objectAtIndex:(NSUInteger) indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.correctAnswersArray count];
}

@end