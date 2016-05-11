//
//  ViewController.m
//  FourPaneDemo
//
//  Created by Алексей on 16.03.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import "ViewController.h"
#import "MapKit/MapKit.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //WebView
    NSString *webURL = @"https://www.facebook.com/westmontinspiredcomputinglab";
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:webURL]];
    
    [self.webView loadRequest:request];
    
    //Center the Map
    double latitude = 34.448795;
    double longitude = -119.6646337;
    
    MKPointAnnotation *wiclAnno = [[MKPointAnnotation alloc]init];
    wiclAnno.coordinate = CLLocationCoordinate2DMake(latitude, longitude);
    wiclAnno.title = @"WICL";
    
    [self.mapView addAnnotation:wiclAnno];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(wiclAnno.coordinate, 10000, 10000);
    
    MKCoordinateRegion adjusted = [self.mapView regionThatFits:region];
    
    [self.mapView setRegion:adjusted animated:YES];
    
    // 
}


@end
