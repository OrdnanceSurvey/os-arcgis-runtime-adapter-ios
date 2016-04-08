//
//  OSWMTSBaseLayer.h
//  OSArcGISRuntimeAdapter
//
//  Created by David Haynes on 5/02/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

#import <ArcGIS/ArcGIS.h>
@import OSMapProducts;

NS_ASSUME_NONNULL_BEGIN

/**
 *  ArcGIS Runtime tiled service layer subclass for use with the OS Maps API.
 */
@interface OSWMTSBaseLayer : AGSTiledServiceLayer

/**
 *  Initialise a layer with the given style and spatial reference.
 *
 *  @param style            The layer style.
 *  @param spatialReference Spatial reference for the layer.
 *  @param apiKey           The OS Maps API key to use for this layer.
 *
 *  @return An instance of OSWMTSBaseLayer configured with the provided style 
 *          and spatial reference.
 */
- (instancetype)initWithBasemapStyle:(OSBaseMapStyle)style
                    spatialReference:(OSSpatialReference)spatialReference
                              apiKey:(NSString *)apiKey;

@end

NS_ASSUME_NONNULL_END
