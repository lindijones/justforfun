//
//  StartViewController.m
//  JustForFun
//
//  Created by Thomas Linder on 30.12.15.
//  Copyright © 2015 Linder, Thomas L. (415). All rights reserved.
//

#import "JFFMainViewController.h"

@interface JFFMainViewController ()
@property (nonatomic,strong) UIButton *captureMoment;
@property (nonatomic,strong) MKMapView *mapView;
@end

@implementation JFFMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // set the color to prevent the push animation bug :-S
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configureCaptureButton];
    [self configureMapView];
    
   
 
}

-(void)configureCaptureButton{
    
    // mainVC button
    self.captureMoment = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
    //[self.captureMoment setTitle:@"Capture" forState:UIControlStateNormal];
    [self.captureMoment setTitleColor:[UIColor colorWithRed:36/255.0 green:71/255.0 blue:113/255.0 alpha:1.0] forState:UIControlStateNormal];
    //self.captureMoment.backgroundColor = [UIColor blueColor];
    [self.captureMoment addTarget:self action:@selector(captureMoment:) forControlEvents:UIControlEventTouchUpInside];
    
    //[self.captureMoment setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    UIImage *idleCam = [UIImage imageNamed:@"camera-outline.png"];
    UIImage *higlightedCam = [UIImage imageNamed:@"camera-full.png"];
    [self.captureMoment setImage:[idleCam imageByScalingProportionallyToSize:CGSizeMake(80,80)] forState:UIControlStateNormal];
    [self.captureMoment setImage:[higlightedCam imageByScalingProportionallyToSize:CGSizeMake(80,80)] forState:UIControlStateHighlighted];
    
    
    //[self.captureMoment setImage:[UIImage imageNamed:@"camera-outline.png"] forState:UIControlStateNormal];
    //[self.captureMoment setImage:[UIImage imageNamed:@"camera-full.png"] forState:UIControlStateHighlighted];
    [self.captureMoment setContentMode:UIViewContentModeScaleAspectFill];
    
    
    //add the button to the main view
    [self.view addSubview:self.captureMoment];
    
    // after adding the buttons as subviews do some layout
    [self.captureMoment autoAlignAxis:ALAxisVertical toSameAxisOfView:self.view];
    [self.captureMoment autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.view];
    
    // size
    [self.captureMoment autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.view withMultiplier:0.3];
    [self.captureMoment autoMatchDimension:ALDimensionHeight toDimension:ALDimensionWidth ofView:self.captureMoment];
    
    // important for settings the constraints / frames correctly after initializing the cell values
    [self.captureMoment setNeedsLayout];
    [self.captureMoment layoutIfNeeded];
    
    // make it round
    self.captureMoment.layer.cornerRadius = self.captureMoment.frame.size.height/2;
    self.captureMoment.layer.borderColor = [[UIColor grayColor] CGColor];
    self.captureMoment.layer.borderWidth = 2;
    self.captureMoment.layer.masksToBounds = YES;

}

-(void)configureMapView{
    // now a map view
    self.mapView = [[MKMapView alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
    [self.view addSubview:self.mapView];
    
    // constraints
    // size
    [self.mapView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.view withMultiplier:0.7];
    [self.mapView autoMatchDimension:ALDimensionHeight toDimension:ALDimensionWidth ofView:self.mapView withMultiplier:0.4];
    // after adding the buttons as subviews do some layout
    [self.mapView autoAlignAxis:ALAxisVertical toSameAxisOfView:self.view];
    [self.mapView autoPinToTopLayoutGuideOfViewController:self withInset:10];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)captureMoment:(id)sender{
    NSLog(@"%s", __PRETTY_FUNCTION__);
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
