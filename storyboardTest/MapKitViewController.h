//
//  MapKitViewController.h
//  storyboardTest
//
//  Created by 胡 桂祁 on 8/23/13.
//  Copyright (c) 2013 huguiqi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapKitViewController : UIViewController<MKMapViewDelegate>

@property(nonatomic,weak) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) NSMutableArray *mapAnnotations;

@end
