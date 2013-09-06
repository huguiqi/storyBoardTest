//
//  MapKitViewController.m
//  storyboardTest
//
//  Created by 胡 桂祁 on 8/23/13.
//  Copyright (c) 2013 huguiqi. All rights reserved.
//

#import "MapKitViewController.h"
#import "HotelAnnotation.h"
#import <CoreLocation/CLLocation.h>
#import "HotelAnnotationView.h"


@interface MapKitViewController ()

@end

@implementation MapKitViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mapAnnotations = [[NSMutableArray alloc] initWithCapacity:10];
    HotelAnnotation *hotelAnnotation1 = [[HotelAnnotation alloc] init];
    hotelAnnotation1.thieCoordinate = CLLocationCoordinate2DMake(31.271508470221, 121.484069824219);
    hotelAnnotation1.place = @"复旦大学";
    hotelAnnotation1.imageName = @"teagarden.png";
    hotelAnnotation1.price = 380;
    [self.mapAnnotations addObject:hotelAnnotation1];
    
    HotelAnnotation *hotelAnnotation2 = [[HotelAnnotation alloc] init];
    hotelAnnotation2.place = @"五角场";
    hotelAnnotation2.imageName = @"teagarden.png";
    hotelAnnotation2.price = 4800;
    hotelAnnotation2.thieCoordinate = CLLocationCoordinate2DMake(31.296154530194, 121.496772766113);
    [self.mapAnnotations addObject:hotelAnnotation2];
    
    HotelAnnotation *hotelAnnotation3 = [[HotelAnnotation alloc] init];
    hotelAnnotation3.place = @"外国语大学";
    hotelAnnotation3.imageName = @"teagarden.png";
    hotelAnnotation3.price = 38;
    hotelAnnotation3.thieCoordinate = CLLocationCoordinate2DMake(31.283245492651, 121.492996215820);
    [self.mapAnnotations addObject:hotelAnnotation3];
}

- (void)mapViewWillStartLoadingMap:(MKMapView *)mapView
{
    [self gotoLocation];
    [self.mapView removeAnnotations:self.mapView.annotations];  // remove any annotations that exist
    
    [self.mapView addAnnotations:self.mapAnnotations];
}

- (void)gotoLocation
{
    // start off by default in ShangHai
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = 31.230393000000;
    newRegion.center.longitude = 121.473704000000;
    newRegion.span.latitudeDelta = 0.112872;
    newRegion.span.longitudeDelta = 0.109863;
    
    [self.mapView setRegion:newRegion animated:YES];
}


// user tapped the disclosure button in the callout
//
- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    // here we illustrate how to detect which annotation type was clicked on for its callout
    id <MKAnnotation> annotation = [view annotation];
    if ([annotation isKindOfClass:[HotelAnnotation class]])
    {
        NSLog(@"clicked HotelAnnotation annotation");
    }
    
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    // in case it's the user location, we already have an annotation, so just return nil
    if ([annotation isKindOfClass:[MKUserLocation class]])
    {
        return nil;
    }
    if ([annotation isKindOfClass:[HotelAnnotation class]]){
        static NSString *HotelAnnotationIdentifier = @"HotelAnnotationIdentifier";
        
        HotelAnnotationView *annotationView =
        (HotelAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:HotelAnnotationIdentifier];
        if (annotationView == nil)
        {
            annotationView = [[HotelAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:HotelAnnotationIdentifier];
        }
        annotationView.canShowCallout = YES;
        
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [rightButton addTarget:nil action:nil forControlEvents:UIControlEventTouchUpInside];
        annotationView.rightCalloutAccessoryView = rightButton;
        return annotationView;
    }

    return nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
