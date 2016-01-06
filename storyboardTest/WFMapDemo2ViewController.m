//
//  WFMapDemo2ViewController.m
//  storyboardTest
//
//  Created by sam on 15/11/16.
//  Copyright © 2015年 huguiqi. All rights reserved.
//

#import "WFMapDemo2ViewController.h"
#import <MapKit/MapKit.h>

@interface WFMapDemo2ViewController ()<MKMapViewDelegate>


@property(nonatomic,weak) IBOutlet MKMapView *mapView;

@end

@implementation WFMapDemo2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mapView.delegate = self;
    // Do any additional setup after loading the view.
    [self.mapView setCenterCoordinate:CLLocationCoordinate2DMake(35.702069, 139.775327) animated:YES];
    [self.mapView setRegion:MKCoordinateRegionMake(CLLocationCoordinate2DMake(35.702069, 139.775327), MKCoordinateSpanMake(0.1, 0.1)) animated:YES];
    self.mapView.showsUserLocation = YES;
    self.mapView.userTrackingMode = MKUserTrackingModeFollow;
    
    [self.mapView setZoomEnabled:YES];
    
}

- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated{

    self.mapView.showsUserLocation = NO;
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
