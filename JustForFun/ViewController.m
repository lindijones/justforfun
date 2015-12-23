//
//  ViewController.m
//  JustForFun
//
//  Created by Linder, Thomas L. (415) on 26.11.15.
//  Copyright © 2015 Linder, Thomas L. (415). All rights reserved.
//

#import "ViewController.h"
#import <PureLayout/PureLayout.h>

@interface ViewController ()
@property(nonatomic, strong) UIView *square;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.square = [[UIView alloc] initWithFrame:CGRectMake(30.0, 30.0, 100.0, 100.0)];
    self.square.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.square];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
