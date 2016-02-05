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

@interface ViewController ()

@property (strong, nonatomic) IBOutlet AGSMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    OSWMTSBaseLayer *os3857Layer = [OSWMTSBaseLayer default27700Layer];
    [self.mapView addMapLayer:os3857Layer withName:@"OS Layer"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
