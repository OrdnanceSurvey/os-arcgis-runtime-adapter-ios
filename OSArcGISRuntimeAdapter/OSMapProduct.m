//
//  OSMapProduct.m
//  OSArcGISRuntimeAdapter
//
//  Created by David Haynes on 08/02/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

#import "OSMapProduct.h"

/**
 *  Return the name to use for the style
 */
NSString *NSStringFromOSBaseMapStyle(OSBaseMapStyle style) {
    switch (style) {
        case OSBaseMapStyleRoad:
            return @"Road";
        case OSBaseMapStyleOutdoor:
            return @"Outdoor";
        case OSBaseMapStyleLight:
            return @"Light";
        case OSBaseMapStyleNight:
            return @"Night";
    }
}

/**
 *  Return the name to use for the spatial reference
 */
NSString *NSStringFromOSSpatialReference(OSSpatialReference spatialReference) {
    switch (spatialReference) {
        case OSSpatialReferenceBNG:
            return @"27700";
        case OSSpatialReferenceWebMercator:
            return @"3857";
    }
}

/**
 *  Return the name to use for the layer in an http request
 */
NSString *NSStringFromOSMapLayer(OSBaseMapStyle style, OSSpatialReference spatialReference) {
    NSString *styleName = NSStringFromOSBaseMapStyle(style);
    NSString *spatialReferenceName = NSStringFromOSSpatialReference(spatialReference);
    NSString *productName = [NSString stringWithFormat:@"%@ %@", styleName, spatialReferenceName];
    return [productName stringByAddingPercentEncodingWithAllowedCharacters:
                            [NSCharacterSet URLPathAllowedCharacterSet]];
}

NSInteger OSWkIDFromSpatialReference(OSSpatialReference spatialReference) {
    NSString *name = NSStringFromOSSpatialReference(spatialReference);
    return [name integerValue];
}
