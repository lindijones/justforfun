//
//  JFFScrollViewController.m
//  JustForFun
//
//  Created by Linder, Thomas L. (415) on 29.11.15.
//  Copyright © 2015 Linder, Thomas L. (415). All rights reserved.
//

#import "JFFScrollViewController.h"

@interface JFFScrollViewController ()
@property (nonatomic,strong) UIScrollView *scrollView;
@end

@implementation JFFScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // show under nav bar or not?
    //self.edgesForExtendedLayout = UIRectEdgeNone;
    
    //configure the scrollview
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    self.scrollView.backgroundColor = [UIColor redColor];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 2, self.view.bounds.size.height);
    
    // adjust scroll view inset for iOS 7 translucent nav bar
    self.automaticallyAdjustsScrollViewInsets = YES;
    
    [self.view addSubview:self.scrollView];
    
    // add some subviews to the scrollview
    
    float width = 50;
    float height = 50;
    float xPos = 10;
    float yPos = 10;
    
    UIView* view1 = [[UIView alloc] initWithFrame:CGRectMake(xPos, yPos, width, height)];
    view1.backgroundColor = [UIColor blueColor];
    [self.scrollView addSubview:view1];
    
    UIView* view2 = [[UIView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width + xPos, yPos, width, height)];
    view2.backgroundColor = [UIColor greenColor];
    [self.scrollView addSubview:view2];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
