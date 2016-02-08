//
//  ViewController.m
//  ArcGISExampleObjC
//
//  Created by David Haynes on 05/02/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

#import <ArcGIS/ArcGIS.h>
@import OSArcGISRuntimeAdapter;
#import "ViewController.h"

@interface ViewController ()<AGSMapViewLayerDelegate>

@property (strong, nonatomic) IBOutlet AGSMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mapView.layerDelegate = self;

    OSWMTSBaseLayer *os3857Layer = [[OSWMTSBaseLayer alloc] initWithBasemapStyle:OSBaseMapStyleRoad
                                                                spatialReference:OSSpatialReferenceBNG
                                                                          apiKey:self.apiKey];
    [self.mapView addMapLayer:os3857Layer withName:@"OS Layer"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - AGSMapViewLayerDelegate

- (void)mapViewDidLoad:(AGSMapView *)mapView {
    [self.mapView.locationDisplay startDataSource];
    self.mapView.locationDisplay.autoPanMode =
        AGSLocationDisplayAutoPanModeDefault;
}

- (NSString *)apiKey {
    NSError *error;
    NSString *apiKey = [NSString stringWithContentsOfURL:[NSBundle.mainBundle URLForResource:@"APIKEY"
                                                                               withExtension:nil]
                                                encoding:NSUTF8StringEncoding
                                                   error:&error];
    if (!apiKey || error) {
        NSException *exception = [[NSException alloc] initWithName:@"OSAPIKeyMissing" reason:@"Error loading api key. Make sure this is in an APIKEY file in the project bundle." userInfo:nil];
        [exception raise];
    }
    return [apiKey stringByReplacingOccurrencesOfString:@"\n" withString:@""];
}

@end
