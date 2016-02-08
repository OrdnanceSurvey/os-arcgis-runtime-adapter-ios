//
//  OSWMTSBaseLayer.h
//  OSArcGISRuntimeAdapter
//
//  Created by David Haynes on 5/02/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

#import <ArcGIS/ArcGIS.h>
#import "OSMapProduct.h"

@interface OSWMTSBaseLayer : AGSTiledServiceLayer

- (instancetype)initWithBasemapStyle:(OSBaseMapStyle)style
                    spatialReference:(OSSpatialReference)spatialReference;

@end
