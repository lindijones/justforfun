//
//  JFFTableViewController.m
//  JustForFun
//
//  Created by Linder, Thomas L. (415) on 28.11.15.
//  Copyright © 2015 Linder, Thomas L. (415). All rights reserved.
//

#import "JFFTableViewController.h"
#import "JFFCustomCell.h"
#import "NormalTableViewCell.h"

@interface JFFTableViewController ()
@property (nonatomic,strong) NSMutableArray *content;
@end

@implementation JFFTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.content = [self createFakeContent];
    [self.tableView registerClass:[JFFCustomCell class] forCellReuseIdentifier:@"customCell"];
    [self.tableView registerClass:[NormalTableViewCell class] forCellReuseIdentifier:@"normalCell"];

    self.tableView.delegate = self;
    
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
//    self.tableView.estimatedRowHeight = 120;
    
  
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 160;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return self.content.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"customCell";
    JFFCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    
    cell.customLabel.text = self.content[indexPath.row];
    
    if (indexPath.row % 2 > 0) {
        [cell.iv setImage:[UIImage imageNamed:@"beach.png"]];
    }else if (indexPath.row % 3 > 0){
        [cell.iv setImage:[UIImage imageNamed:@"alps.png"]];
    }else{
        [cell.iv setImage:[UIImage imageNamed:@"san_francisco.png"]];
    }
 
    return cell;
}

-(NSMutableArray *)createFakeContent{
    NSMutableArray *fakeContent = [[NSMutableArray alloc] init];
    int i;
    for (i=0; i<100; i++) {
        [fakeContent addObject:[NSString stringWithFormat:@"%i", i]];
    }
    return fakeContent;
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
