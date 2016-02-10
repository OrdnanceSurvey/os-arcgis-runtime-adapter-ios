//
//  OSMapProduct.h
//  OSArcGISRuntimeAdapter
//
//  Created by David Haynes on 08/02/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  The available spatial references
 */
typedef NS_ENUM(NSUInteger, OSSpatialReference) {
    /**
     *  EPSG 27700 British National Grid
     */
    OSSpatialReferenceBNG,
    /**
     *  EPSG 3857 Web Mercator
     */
    OSSpatialReferenceWebMercator,
};

/**
 *  The available basemap styles
 */
typedef NS_ENUM(NSUInteger, OSBaseMapStyle) {
    /**
     *  Road style
     */
    OSBaseMapStyleRoad,
    /**
     *  Outdoor style
     */
    OSBaseMapStyleOutdoor,
    /**
     *  Light style
     */
    OSBaseMapStyleLight,
    /**
     *  Night style
     */
    OSBaseMapStyleNight
};

/**
 *  Constructs the name to be used for the basemap layer in an http request.
 *
 *  @param style            The map style
 *  @param spatialReference The map spatial reference
 *
 *  @return The name to be used for the layer.
 */
NSString *NSStringFromOSMapLayer(OSBaseMapStyle style, OSSpatialReference spatialReference);

/**
 *  Get the well known id from the spatial reference.
 *
 *  @param spatialReference The spatial reference
 *
 *  @return Well known id of the supplied spatial reference, e.g. '27700' for BNG
 */
NSInteger OSWkIDFromSpatialReference(OSSpatialReference spatialReference);
