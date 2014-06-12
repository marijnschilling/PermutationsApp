#import "PRMResultListViewController.h"

@interface PRMResultListViewController ()

@property(nonatomic, strong) NSMutableArray *answers;

@end

@implementation PRMResultListViewController

- (id)initWithResultsThatEqual11:(NSMutableArray *)results
{
    self = [super initWithStyle:UITableViewStyleGrouped];

    if (self)
    {
        self.title = NSLocalizedString(@"TABLEVIEW__TITLE", nil);
        self.tableView = [[UITableView alloc] init];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.answers = results;
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

    cell.textLabel.text = [self.answers objectAtIndex:(NSUInteger) indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.answers count];
}

@end