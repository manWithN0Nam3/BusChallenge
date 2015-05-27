//
//  ViewController.m
//  BusChallenge
//
//  Created by Alex Santorineos on 5/27/15.
//  Copyright (c) 2015 madApperz. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "DetailViewController.h"

@interface ViewController ()<MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property NSObject <MKAnnotation> *busStopAnnotation;
@property NSArray *busStops;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.mapView.delegate = self;

    CLLocationCoordinate2D centerCoordinate = CLLocationCoordinate2DMake(41.8369, -87.6847);

    MKCoordinateSpan span;
    span.latitudeDelta =  0.1;
    span.longitudeDelta = 0.1;

    MKCoordinateRegion region;
    region.center = centerCoordinate;
    region.span = span;

    [self.mapView setRegion:region animated:YES];





    NSString *urlString = [NSString stringWithFormat:@"https://s3.amazonaws.com/mobile-makers-lib/bus.json"];

    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {

        //original layer
        NSDictionary *JSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&connectionError];
        //first layer - array
        self.busStops = [JSON objectForKey:@"row"];

        for (NSDictionary *location in self.busStops) {
            MKPointAnnotation *annotation = [MKPointAnnotation new];
            annotation.coordinate = CLLocationCoordinate2DMake([[location objectForKey:@"latitude"]floatValue], [[location objectForKey:@"longitude"]floatValue]);

            annotation.title = [location objectForKey:@"cta_stop_name"];
            annotation.subtitle = [location objectForKey:@"routes"];



            [self.mapView addAnnotation:annotation];

        }
        NSLog(@"%lu",self.busStops.count);
        
    }];
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{

        MKPinAnnotationView *pin = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:nil];
        pin.canShowCallout = YES;
        pin.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];

    return pin;
}


//
//
//
-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
    [self performSegueWithIdentifier:@"c" sender:control];

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    DetailViewController *dVc = segue.destinationViewController;

    dVc.dictionary = self.busStops;



}






@end
