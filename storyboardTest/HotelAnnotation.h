//
//  HotelAnnotation.h
//  storyboardTest
//
//  Created by 胡 桂祁 on 8/26/13.
//  Copyright (c) 2013 huguiqi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface HotelAnnotation : NSObject<MKAnnotation>

@property(nonatomic) CLLocationCoordinate2D thieCoordinate;
@property (nonatomic, copy) NSString *place;
@property (nonatomic, copy) NSString *imageName;

@property(nonatomic,copy) NSString *hotelId;
@property (nonatomic, assign) NSInteger price;



@end
