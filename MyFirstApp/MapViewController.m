//
//  MapViewController.m
//  MyFirstApp
//
//  Created by qburst on 05/07/16.
//  Copyright © 2016 qburst. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

@synthesize longitude;
@synthesize lattitude;
@synthesize mapView;

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    self.mapView.delegate = self;
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;

    #ifdef __IPHONE_8_0
    
    if(IS_OS_8_OR_LATER)
    {
        [self.locationManager requestWhenInUseAuthorization];
        [self.locationManager requestAlwaysAuthorization];
    }
    #endif

    [self.locationManager startUpdatingLocation];
    
    mapView.showsUserLocation = YES;
    [mapView setMapType:MKMapTypeStandard];
    [mapView setZoomEnabled:YES];
    [mapView setScrollEnabled:YES];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager startUpdatingLocation];
    //NSLog(@"%@", [self deviceLocation]);
    
    MKCoordinateRegion region = { { 0.0, 0.0 }, { 0.0, 0.0 } };
    region.center.latitude = self.locationManager.location.coordinate.latitude;
    region.center.longitude = self.locationManager.location.coordinate.longitude;
    region.span.longitudeDelta = 0.005f;
    region.span.longitudeDelta = 0.005f;
    [mapView setRegion:region animated:YES];
    
    CLLocationCoordinate2D annotationCoord;
    MKPointAnnotation *annotationPoint = [[MKPointAnnotation alloc] init];
    annotationCoord.latitude = [self.lattitude intValue];
    annotationCoord.longitude = [self.longitude intValue];
    annotationPoint.coordinate = annotationCoord;
    annotationPoint.title = @"Location";
    
    [self.mapView setCenterCoordinate:annotationCoord animated:YES];
    [self.mapView addAnnotation:annotationPoint];
}

//- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
//{
//    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);
//    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
//}

//- (NSString *)deviceLocation
//{
//    return [NSString stringWithFormat:@"latitude: %f longitude: %f", self.locationManager.location.coordinate.latitude, self.locationManager.location.coordinate.longitude];
//}
/*

    CLLocationCoordinate2D annotationCoord;
    MKPointAnnotation *annotationPoint = [[MKPointAnnotation alloc] init];
    annotationCoord.latitude = [self.lattitude intValue];
    annotationCoord.longitude = [self.longitude doubleValue];
    
    annotationPoint.coordinate = annotationCoord;
    annotationPoint.title = @"Location";
    
    [self.mapView setCenterCoordinate:annotationCoord animated:YES];
    [self.mapView addAnnotation:annotationPoint];
}

*/

- (IBAction)cancelButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
