#import "PRMResultListViewController.h"
#import "PRMAnswerViewCell.h"

@interface PRMResultListViewController ()

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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PRMAnswerViewCell *cell = [tableView dequeueReusableCellWithIdentifier:PRMAnswerViewCellIdentifier forIndexPath:indexPath];

    if(cell == nil)
    {
        [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:PRMAnswerViewCellIdentifier];
    }

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 24;
}

@end