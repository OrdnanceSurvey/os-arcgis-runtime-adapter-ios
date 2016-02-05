//
//  OSWMTSBaseLayer.h
//  OSArcGISRuntimeAdapter
//
//  Created by David Haynes on 5/02/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

#import <ArcGIS/ArcGIS.h>

@interface OSWMTSBaseLayer : AGSTiledServiceLayer

- (instancetype)initWithSpatialReference:(AGSSpatialReference *)spatialReference
                                tileInfo:(AGSTileInfo *)info
                              fullExtent:(AGSEnvelope *)fullExtent
                            initalExtent:(AGSEnvelope *)initialExtent
                                 baseURL:(NSURL *)baseURLPath;

+ (instancetype)default27700Layer;
+ (instancetype)default3857Layer;

@end
