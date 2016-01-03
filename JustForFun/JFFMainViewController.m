//
//  StartViewController.m
//  JustForFun
//
//  Created by Thomas Linder on 30.12.15.
//  Copyright © 2015 Linder, Thomas L. (415). All rights reserved.
//

#import "JFFMainViewController.h"

#import "JFFTableViewController.h"
#import "JFFMainTableViewController.h"

@interface JFFMainViewController ()
@property (nonatomic,strong) UIButton *captureMoment;
@property (nonatomic,strong) MKMapView *mapView;
@property (nonatomic,strong) CLLocationManager *locationManager;
@property (nonatomic,strong) UILabel *accuracy;
@property (nonatomic, strong) JFFTableViewController *tvc;
@property (nonatomic,strong) JFFMainTableViewController *mainTVC;
@end

@implementation JFFMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // set the color to prevent the push animation bug :-S
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configureLocationManager];
    [self configureCaptureButton];
    [self configureMapView];
    //[self configureAccuracyLabel];
    [self configureTVC];
    //[self configureMainTVC];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appWillResignActive:) name:UIApplicationWillResignActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appDidEnterBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];

    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appDidBecomeActive:) name:UIApplicationDidBecomeActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appWillEnterForeground:) name:UIApplicationWillEnterForegroundNotification object:nil];
}

- (void)appWillResignActive:(NSNotification *)notification {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)appDidEnterBackground:(NSNotification *)notification {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}


- (void)appDidBecomeActive:(NSNotification *)notification {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [self.locationManager requestLocation];

}

- (void)appWillEnterForeground:(NSNotification *)notification {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

-(void)viewDidAppear:(BOOL)animated{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    // after the map view is configured get the locaion one time
    [self.locationManager requestLocation];
}

-(void)configureLocationManager{
    self.locationManager = [CLLocationManager new];
    [self.locationManager requestWhenInUseAuthorization];
    self.locationManager.delegate = self;
    //[self.locationManager startUpdatingLocation];
}

-(void)configureCaptureButton{
    
    // mainVC button
    self.captureMoment = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
    //[self.captureMoment setTitle:@"Capture" forState:UIControlStateNormal];
    [self.captureMoment setTitleColor:[UIColor colorWithRed:36/255.0 green:71/255.0 blue:113/255.0 alpha:1.0] forState:UIControlStateNormal];
    //self.captureMoment.backgroundColor = [UIColor blueColor];
    [self.captureMoment addTarget:self action:@selector(captureMoment:) forControlEvents:UIControlEventTouchUpInside];
    [self.captureMoment addTarget:self action:@selector(holdDown:) forControlEvents:UIControlEventTouchDown];

    
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
    //[self.captureMoment autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.view];
    [self.captureMoment autoPinToBottomLayoutGuideOfViewController:self withInset:self.view.frame.size.height*0.05];
    
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
    self.mapView.showsUserLocation = YES;

    
    // constraints
    // size
    [self.mapView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.view withMultiplier:1.0];
    [self.mapView autoMatchDimension:ALDimensionHeight toDimension:ALDimensionWidth ofView:self.mapView withMultiplier:0.4];
    // after adding the buttons as subviews do some layout
    [self.mapView autoAlignAxis:ALAxisVertical toSameAxisOfView:self.view];
    [self.mapView autoPinToTopLayoutGuideOfViewController:self withInset:0];
}

-(void)configureAccuracyLabel{
    self.accuracy = [UILabel new];
    [self.view addSubview:self.accuracy];
    
    // constraints
    // size
    [self.accuracy autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.view withMultiplier:0.8];
    
    // do some layout
    [self.accuracy autoAlignAxis:ALAxisVertical toSameAxisOfView:self.view];
    [self.accuracy autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.mapView withOffset:15];
    
    //self.accuracy.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    
}

-(void)setAccuracyValue:(float)accuracy{
    self.accuracy.backgroundColor = [UIColor whiteColor];
    
    //NSString *fontName = @"HelveticaNeue-UltraLight";
    NSString *fontName = @"HelveticaNeue-Thin";

    NSDictionary *firstAttributes = @{NSForegroundColorAttributeName: [UIColor darkGrayColor], NSBackgroundColorAttributeName: [UIColor whiteColor], NSFontAttributeName: [UIFont fontWithName:fontName size:25.0] };
    NSDictionary *secondAttributes = @{ NSForegroundColorAttributeName: [UIColor blackColor], NSBackgroundColorAttributeName: [UIColor whiteColor], NSFontAttributeName: [UIFont fontWithName:fontName size:40.0]  };
    
    
    NSString *string = [NSString stringWithFormat:@"Accuracy: %.f m", accuracy];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    
    [attributedString addAttributes:firstAttributes range:[string rangeOfString:@"Accuracy:"]];
    [attributedString addAttributes:secondAttributes range:[string rangeOfString:[NSString stringWithFormat:@" %.f m", accuracy]]];
    
    self.accuracy.attributedText = attributedString;
}

-(void)configureTVC{
    self.tvc = [JFFTableViewController new];
    [self.view addSubview:self.tvc.view];
    
    // constraints
    // size
    [self.tvc.view autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.view withMultiplier:1];
    //[self.tvc.view autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:self.view withMultiplier:0.4];
    
    // do some layout
    [self.tvc.view autoAlignAxis:ALAxisVertical toSameAxisOfView:self.view];
    [self.tvc.view autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.mapView withOffset:0];
    [self.tvc.view autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self.captureMoment withOffset:-10];
}

-(void)configureMainTVC{
    self.mainTVC = [JFFMainTableViewController new];
    [self.view addSubview:self.mainTVC.view];
    
    // constraints
    // size
    [self.mainTVC.view autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.view withMultiplier:1];
    
    // do some layout
    [self.mainTVC.view autoAlignAxis:ALAxisVertical toSameAxisOfView:self.view];
    [self.mainTVC.view autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.mapView withOffset:0];
    [self.mainTVC.view autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self.captureMoment withOffset:-10];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)holdDown:(id)sender{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    CABasicAnimation *pulseAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulseAnimation.duration = .05;
    pulseAnimation.toValue = [NSNumber numberWithFloat:1.3];
    pulseAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pulseAnimation.autoreverses = YES;
    pulseAnimation.repeatCount = 1;
    [self.captureMoment.layer addAnimation:pulseAnimation forKey:nil];
    
    // second animation
    CABasicAnimation *theAnimation;
    theAnimation=[CABasicAnimation animationWithKeyPath:@"opacity"];
    theAnimation.duration=.05;
    theAnimation.repeatCount=1;
    theAnimation.autoreverses=YES;
    theAnimation.fromValue=[NSNumber numberWithFloat:1.0];
    theAnimation.toValue=[NSNumber numberWithFloat:0.0];
    [self.captureMoment.layer addAnimation:theAnimation forKey:@"animateOpacity"]; //myButton.layer instead of
    
}

-(void)captureMoment:(id)sender{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

#pragma mark - CLLocationManagerDelegate

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    CLLocation *lastLocation = locations.lastObject;
    NSLog(@"Location: Long: %f Lat: %f", lastLocation.coordinate.longitude, lastLocation.coordinate.latitude);
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(lastLocation.coordinate, 500, 500);
    MKCoordinateRegion adjustedRegion = [self.mapView regionThatFits:viewRegion];
    [self.mapView setRegion:adjustedRegion animated:YES];
    
    // set the accuracy label
    //[self setAccuracyValue:lastLocation.horizontalAccuracy];
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"%s ==> Error: %@", __PRETTY_FUNCTION__, error);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
