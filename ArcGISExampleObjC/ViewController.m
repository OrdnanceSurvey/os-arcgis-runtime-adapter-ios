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
    OSWMTSBaseLayer *os3857Layer = [[OSWMTSBaseLayer alloc] initWithBasemapStyle:OSBaseMapStyleRoad
                                                                spatialReference:OSSpatialReferenceBNG];
    [self.mapView addMapLayer:os3857Layer withName:@"OS Layer"];
    self.mapView.layerDelegate = self;
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

@end
