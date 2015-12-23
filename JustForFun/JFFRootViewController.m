//
//  JFFRootViewController.m
//  JustForFun
//
//  Created by Linder, Thomas L. (415) on 29.11.15.
//  Copyright © 2015 Linder, Thomas L. (415). All rights reserved.
//

#import "JFFRootViewController.h"

@interface JFFRootViewController ()
@property (nonatomic,strong) UIButton *scrollViewButton;
@property (nonatomic,strong) UIButton *tableViewButton;
@end

@implementation JFFRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    // configure the navigation bar
    self.navigationController.navigationBar.topItem.title = @"Home";
    
    self.view.backgroundColor = [UIColor yellowColor];
    [self.view setUserInteractionEnabled:YES];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    // create the buttons
    
    //scrollVC button
    self.scrollViewButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.scrollViewButton.frame = CGRectMake(20, 10, 100, 30);
    self.scrollViewButton.backgroundColor = [UIColor greenColor];
    [self.scrollViewButton setTitle:@"ScrollVC" forState:UIControlStateNormal];
    [self.scrollViewButton setTitleColor:[UIColor colorWithRed:36/255.0 green:71/255.0 blue:113/255.0 alpha:1.0] forState:UIControlStateNormal];
    [self.scrollViewButton addTarget:self action:@selector(showScrollVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollViewButton setEnabled:YES];
    
    
    
    // tableVC button
    self.tableViewButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 150, 100, 30)];
    [self.tableViewButton setTitle:@"TableVC" forState:UIControlStateNormal];
    [self.tableViewButton setTitleColor:[UIColor colorWithRed:36/255.0 green:71/255.0 blue:113/255.0 alpha:1.0] forState:UIControlStateNormal];
    self.tableViewButton.backgroundColor = [UIColor redColor];
    [self.tableViewButton addTarget:self action:@selector(showTableVC:) forControlEvents:UIControlEventTouchUpInside];
    
    // add the buttons to the VC
    [self.view addSubview:self.scrollViewButton];
    [self.view addSubview:self.tableViewButton];
    
    // after adding the buttons as subviews do some layout
    [self.scrollViewButton autoAlignAxis:ALAxisVertical toSameAxisOfView:self.view];
    [self.scrollViewButton autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.view withOffset:40];
    
    [self.tableViewButton autoAlignAxis:ALAxisVertical toSameAxisOfView:self.view];
    [self.tableViewButton autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.view withOffset:100];
    
    
    
    // Do any additional setup after loading the view.
    
    
    //DEBUG
    JFFTableViewController *tableVC = [JFFTableViewController new];
    [self.navigationController pushViewController:tableVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showScrollVC:(id)sender
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    JFFScrollViewController *scrollVC = [JFFScrollViewController new];
    //[self presentViewController:scrollVC animated:YES completion:nil];
    [self.navigationController pushViewController:scrollVC animated:YES];
}

-(void)showTableVC:(id)sender
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    JFFTableViewController *tableVC = [JFFTableViewController new];
    [self.navigationController pushViewController:tableVC animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
