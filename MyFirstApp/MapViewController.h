//
//  MapViewController.h
//  MyFirstApp
//
//  Created by qburst on 05/07/16.
//  Copyright © 2016 qburst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <MapKit/MKAnnotation.h>

@interface MapViewController : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate>

#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property(nonatomic, retain) CLLocationManager *locationManager;

- (IBAction)cancelButton:(id)sender;

@property (strong, nonatomic) NSString *lattitude;

@property (strong, nonatomic) NSString *longitude;

@end
