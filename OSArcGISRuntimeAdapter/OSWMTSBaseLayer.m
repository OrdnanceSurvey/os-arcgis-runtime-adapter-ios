//
//  OSWMTSBaseLayer.m
//  OSArcGISRuntimeAdapter
//
//  Created by David Haynes on 5/02/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

#import "OSWMTSBaseLayer.h"

@interface OSWMTSBaseLayer ()

@property (nonatomic, strong) NSString *baseURLPath;
@property (nonatomic, strong) AGSTileInfo *osTileInfo;
@property (nonatomic, strong) AGSEnvelope *osFullEnvelope;
@property (nonatomic, strong) NSString *apiKey;

@end

@implementation OSWMTSBaseLayer

- (instancetype)initWithBasemapStyle:(OSBaseMapStyle)style
                    spatialReference:(OSSpatialReference)spatialReference
                              apiKey:(NSString *)apiKey {
    NSInteger wkID = WkIDFromOSSpatialReference(spatialReference);
    NSString *layerName = NSStringFromOSMapLayer(style, spatialReference);

    AGSSpatialReference *spatialReference2 = [[AGSSpatialReference alloc] initWithWKID:wkID];
    AGSTileInfo *osTileInfo = [OSWMTSBaseLayer tileInfoForSpatialReference:spatialReference2];
    AGSEnvelope *initialExtent = [OSWMTSBaseLayer initialExtentForSpatialReference:spatialReference2];
    AGSEnvelope *fullExtent = [OSWMTSBaseLayer fullExtentForSpatialReference:spatialReference2];
    NSString *baseURLPath = [OSWMTSBaseLayer baseURLPathForSpatialReferenceWKID:wkID
                                                                      layerName:layerName
                                                                         apiKey:apiKey];

    OSWMTSBaseLayer *layer = [self initWithSpatialReference:spatialReference2
                                                   tileInfo:osTileInfo
                                                 fullExtent:fullExtent
                                               initalExtent:initialExtent
                                                    baseURL:baseURLPath];
    layer.apiKey = apiKey;
    [layer layerDidLoad];
    return layer;
}

- (instancetype)initWithSpatialReference:(AGSSpatialReference *)spatialReference
                                tileInfo:(AGSTileInfo *)info
                              fullExtent:(AGSEnvelope *)fullExtent
                            initalExtent:(AGSEnvelope *)initialExtent
                                 baseURL:(NSString *)baseURLPath {
    self = [super init];
    if (self) {
        _osTileInfo = info;
        _osFullEnvelope = fullExtent;
        self.initialEnvelope = initialExtent;
        _baseURLPath = baseURLPath;
    }
    return self;
}

+ (NSString *)baseURLPathForSpatialReferenceWKID:(NSUInteger)spatialReference
                                       layerName:(NSString *)layerName
                                          apiKey:(NSString *)apiKey {
    NSString *baseURLPath = @"https://api2.ordnancesurvey.co.uk/mapping_api/v1/service/wmts?key={APIKEY}&SERVICE=WMTS&VERSION=1.0.0&REQUEST=GetTile&LAYER={LAYER}&STYLE=&FORMAT=image/png&TILEMATRIXSET=EPSG:{WKID}&TILEMATRIX=EPSG:{WKID}:{z}&TILEROW={y}&TILECOL={x}";

    baseURLPath = [baseURLPath stringByReplacingOccurrencesOfString:@"{LAYER}" withString:layerName];
    baseURLPath = [baseURLPath stringByReplacingOccurrencesOfString:@"{WKID}"
                                                         withString:@(spatialReference).stringValue];
    baseURLPath = [baseURLPath stringByReplacingOccurrencesOfString:@"{APIKEY}" withString:apiKey];
    return baseURLPath;
}

- (AGSTileInfo *)tileInfo {
    return self.osTileInfo;
}

- (void)setTileInfo:(AGSTileInfo *)tileInfo {
    self.osTileInfo = tileInfo;
}

- (AGSEnvelope *)fullEnvelope {
    return self.osFullEnvelope;
}

- (void)setFullEnvelope:(AGSEnvelope *)fullEnvelope {
    self.fullEnvelope = fullEnvelope;
}

- (NSURL *)urlForTileKey:(AGSTileKey *)key {
    NSString *path = [self.baseURLPath stringByReplacingOccurrencesOfString:@"{z}"
                                                                 withString:@(key.level).stringValue];
    path = [path stringByReplacingOccurrencesOfString:@"{x}" withString:@(key.column).stringValue];
    path = [path stringByReplacingOccurrencesOfString:@"{y}" withString:@(key.row).stringValue];
    NSURL *requestURL = [NSURL URLWithString:path];
    return requestURL;
}

+ (AGSTileInfo *)tileInfoForSpatialReference:(AGSSpatialReference *)spatialReference {
    const NSInteger dpi = 96;
    NSString *format = @"png24";

    NSArray *levelsOfDetail = [OSWMTSBaseLayer levelsOfDetailForSpatialReference:spatialReference];
    AGSPoint *origin = [OSWMTSBaseLayer originForSpatialReference:spatialReference];
    CGSize tileSize = CGSizeMake(256, 256);

    AGSTileInfo *tileInfo = [[AGSTileInfo alloc] initWithDpi:dpi
                                                      format:format
                                                        lods:levelsOfDetail
                                                      origin:origin
                                            spatialReference:spatialReference
                                                    tileSize:tileSize];
    return tileInfo;
}

+ (NSArray *)levelsOfDetailForSpatialReference:(AGSSpatialReference *)spatialReference {
    switch (spatialReference.wkid) {
        case 27700:
            return @[
                [[AGSLOD alloc] initWithLevel:0 resolution:896.0 scale:3386456.693],
                [[AGSLOD alloc] initWithLevel:1 resolution:448.0 scale:1693228.346],
                [[AGSLOD alloc] initWithLevel:2 resolution:224.0 scale:846614.1732],
                [[AGSLOD alloc] initWithLevel:3 resolution:112.0 scale:423307.0866],
                [[AGSLOD alloc] initWithLevel:4 resolution:56.0 scale:211653.5433],
                [[AGSLOD alloc] initWithLevel:5 resolution:28.0 scale:105826.7717],
                [[AGSLOD alloc] initWithLevel:6 resolution:14.0 scale:52913.38583],
                [[AGSLOD alloc] initWithLevel:7 resolution:7.0 scale:26456.69291],
                [[AGSLOD alloc] initWithLevel:8 resolution:3.5 scale:13228.34646],
                [[AGSLOD alloc] initWithLevel:9 resolution:1.75 scale:6614.173228],
                [[AGSLOD alloc] initWithLevel:10 resolution:0.875 scale:3307.086614],
                [[AGSLOD alloc] initWithLevel:11 resolution:0.4375 scale:1653.014173],
                [[AGSLOD alloc] initWithLevel:12 resolution:0.21875 scale:826.5070866],
                [[AGSLOD alloc] initWithLevel:13 resolution:0.109375 scale:412.7244094]
            ];

        case 3857:
            return @[
                [[AGSLOD alloc] initWithLevel:0 resolution:156543.0339279998 scale:.91657527591555E8],
                [[AGSLOD alloc] initWithLevel:1 resolution:78271.5169639999 scale:2.95828763795777E8],
                [[AGSLOD alloc] initWithLevel:2 resolution:39135.7584820001 scale:1.47914381897889E8],
                [[AGSLOD alloc] initWithLevel:3 resolution:19567.8792409999 scale:7.3957190948944E7],
                [[AGSLOD alloc] initWithLevel:4 resolution:9783.93962049996 scale:3.6978595474472E7],
                [[AGSLOD alloc] initWithLevel:5 resolution:4891.96981024998 scale:1.8489297737236E7],
                [[AGSLOD alloc] initWithLevel:6 resolution:2445.98490512499 scale:9244648.868618],
                [[AGSLOD alloc] initWithLevel:7 resolution:1222.99245256249 scale:4622324.434309],
                [[AGSLOD alloc] initWithLevel:8 resolution:611.49622628138 scale:2311162.217155],
                [[AGSLOD alloc] initWithLevel:9 resolution:305.748113140558 scale:1155581.108577],
                [[AGSLOD alloc] initWithLevel:10 resolution:152.874056570411 scale:577790.554289],
                [[AGSLOD alloc] initWithLevel:11 resolution:76.4370282850732 scale:288895.277144],
                [[AGSLOD alloc] initWithLevel:12 resolution:38.2185141425366 scale:144447.638572],
                [[AGSLOD alloc] initWithLevel:13 resolution:19.1092570712683 scale:72223.819286],
                [[AGSLOD alloc] initWithLevel:14 resolution:9.55462853563415 scale:36111.909643],
                [[AGSLOD alloc] initWithLevel:15 resolution:4.77731426794937 scale:18055.954822],
                [[AGSLOD alloc] initWithLevel:16 resolution:2.38865713397468 scale:9027.977411],
                [[AGSLOD alloc] initWithLevel:17 resolution:1.19432856685505 scale:4513.988705],
                [[AGSLOD alloc] initWithLevel:18 resolution:0.597164283559817 scale:2256.994353],
                [[AGSLOD alloc] initWithLevel:19 resolution:0.298582141647617 scale:1128.497176],
                [[AGSLOD alloc] initWithLevel:20 resolution:0.149291070823808 scale:564.248588],
                [[AGSLOD alloc] initWithLevel:21 resolution:0.074645535411904 scale:282.124294],
                [[AGSLOD alloc] initWithLevel:22 resolution:0.037322767705952 scale:141.062147],
                [[AGSLOD alloc] initWithLevel:23 resolution:0.018661383985268 scale:70.531074]
            ];

        default:
            NSLog(@"Unsupported projection. Please specify 3857 (Web mercator) or 27700 (BNG).");
            return [NSArray array];
    }
}

+ (AGSPoint *)originForSpatialReference:(AGSSpatialReference *)spatialReference {
    switch (spatialReference.wkid) {
        case 27700:
            return [[AGSPoint alloc] initWithX:-238375.0
                                             y:1376256.0
                              spatialReference:spatialReference];

        case 3857:
            return [[AGSPoint alloc] initWithX:-2.003750834278E7
                                             y:2.003750834278E7
                              spatialReference:spatialReference];
        default:
            NSLog(@"Unsupported projection. Please specify 3857 (Web mercator) or 27700 (BNG).");
            return [[AGSPoint alloc] init];
    }
}

+ (AGSEnvelope *)fullExtentForSpatialReference:(AGSSpatialReference *)spatialReference {
    switch (spatialReference.wkid) {
        case 27700:
            return [[AGSEnvelope alloc] initWithXmin:1393.0196
                                                ymin:13494.9764
                                                xmax:671196.3657
                                                ymax:1230275.0454
                                    spatialReference:spatialReference];

        case 3857:
            return [[AGSEnvelope alloc] initWithXmin:-2.003750834278E7
                                                ymin:-2.003750834278E7
                                                xmax:2.003750834278E7
                                                ymax:2.003750834278E7
                                    spatialReference:spatialReference];
        default:
            NSLog(@"Unsupported projection. Please specify 3857 (Web mercator) or 27700 (BNG).");
            return [[AGSEnvelope alloc] init];
    }
}

+ (AGSEnvelope *)initialExtentForSpatialReference:(AGSSpatialReference *)spatialReference {
    switch (spatialReference.wkid) {
        case 27700:
            return [[AGSEnvelope alloc] initWithXmin:-6090.0
                                                ymin:3505.0
                                                xmax:678006.0
                                                ymax:1220285.0
                                    spatialReference:spatialReference];
        case 3857:
            return [[AGSEnvelope alloc] initWithXmin:-909989.0
                                                ymin:6367635.0
                                                xmax:238657.0
                                                ymax:8410694.0
                                    spatialReference:spatialReference];
        default:
            NSLog(@"Unsupported projection. Please specify 3857 (Web mercator) or 27700 (BNG).");
            return [[AGSEnvelope alloc] init];
    }
}

@end
