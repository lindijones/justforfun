//
//  JFFMainTableViewController.m
//  JustForFun
//
//  Created by Thomas Linder on 03.01.16.
//  Copyright © 2016 Linder, Thomas L. (415). All rights reserved.
//

#import "JFFMainTableViewController.h"

@interface JFFMainTableViewController ()
@property (nonatomic,strong) NSArray *testData;
@end

@implementation JFFMainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.testData = @[@"One", @"Two", @"Three"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.testData.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    
    //self.accuracy.backgroundColor = [UIColor whiteColor];
    
    //NSString *fontName = @"HelveticaNeue-UltraLight";
    NSString *fontName = @"HelveticaNeue-Thin";
    
    NSDictionary *firstAttributes = @{NSForegroundColorAttributeName: [UIColor darkGrayColor], NSBackgroundColorAttributeName: [UIColor whiteColor], NSFontAttributeName: [UIFont fontWithName:fontName size:25.0] };
    NSDictionary *secondAttributes = @{ NSForegroundColorAttributeName: [UIColor blackColor], NSBackgroundColorAttributeName: [UIColor whiteColor], NSFontAttributeName: [UIFont fontWithName:fontName size:40.0]  };
    
    
    NSString *text = [NSString stringWithFormat:@"Accuracy:"];
    
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:text];
    
    NSString *detailText = [NSString stringWithFormat:@"15 m"];
    
    NSMutableAttributedString *attributedDetailText = [[NSMutableAttributedString alloc] initWithString:detailText];
    
    [attributedText addAttributes:firstAttributes range:[text rangeOfString:@"Accuracy:"]];
    [attributedDetailText addAttributes:secondAttributes range:[detailText rangeOfString:[NSString stringWithFormat:@"15 m"]]];
    
    cell.textLabel.attributedText = attributedText;
    cell.detailTextLabel.text = @"hallo";
    
    
    //cell.textLabel.text = self.testData[indexPath.row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
