//
//  OSWMTSBaseLayerTests.m
//  OSArcGISRuntimeAdapter
//
//  Created by David on 08/02/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

@import MIQTestingFramework;
@import OSArcGISRuntimeAdapter;

@interface OSWMTSBaseLayerTests : XCTestCase

@end

@implementation OSWMTSBaseLayerTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testBNGLayerCreation {
    OSWMTSBaseLayer *testLayer = [[OSWMTSBaseLayer alloc] initWithBasemapStyle:OSBaseMapStyleRoad
                                                              spatialReference:OSSpatialReferenceBNG
                                                                        apiKey:@"apiKey"];
    expect(testLayer.tileInfo.spatialReference).to.equal([[AGSSpatialReference alloc] initWithWKID:27700]);
}

- (void)testWebMercatorLayerCreation {
    OSWMTSBaseLayer *testLayer = [[OSWMTSBaseLayer alloc] initWithBasemapStyle:OSBaseMapStyleRoad
                                                              spatialReference:OSSpatialReferenceWebMercator
                                                                        apiKey:@"apiKey"];
    expect(testLayer.tileInfo.spatialReference).to.equal([[AGSSpatialReference alloc] initWithWKID:3857]);
}

- (void)testTheURLIsConstructedCorrectlyForBNGLayers {
    OSWMTSBaseLayer *testLayer = [[OSWMTSBaseLayer alloc] initWithBasemapStyle:OSBaseMapStyleRoad
                                                              spatialReference:OSSpatialReferenceBNG
                                                                        apiKey:@"apiKey"];
    AGSTileKey *testKey = [[AGSTileKey alloc] initWithColumn:1 row:1 level:1];
    NSURL *testURL = [testLayer urlForTileKey:testKey];
    expect(testURL).toNot.beNil();
    expect(testURL.absoluteString).to.equal(@"https://api2.ordnancesurvey.co.uk/mapping_api/v1/service/wmts?key=apiKey&SERVICE=WMTS&VERSION=1.0.0&REQUEST=GetTile&LAYER=Road%2027700&STYLE=&FORMAT=image/png&TILEMATRIXSET=EPSG:27700&TILEMATRIX=EPSG:27700:1&TILEROW=1&TILECOL=1");
}

- (void)testTheURLIsConstructedCorrectlyForWebMercatorLayers {
    OSWMTSBaseLayer *testLayer = [[OSWMTSBaseLayer alloc] initWithBasemapStyle:OSBaseMapStyleRoad
                                                              spatialReference:OSSpatialReferenceBNG
                                                                        apiKey:@"apiKey"];
    AGSTileKey *testKey = [[AGSTileKey alloc] initWithColumn:1 row:1 level:1];
    NSURL *testURL = [testLayer urlForTileKey:testKey];
    expect(testURL).toNot.beNil();
    expect(testURL.absoluteString).to.equal(@"https://api2.ordnancesurvey.co.uk/mapping_api/v1/service/wmts?key=apiKey&SERVICE=WMTS&VERSION=1.0.0&REQUEST=GetTile&LAYER=Road%2027700&STYLE=&FORMAT=image/png&TILEMATRIXSET=EPSG:27700&TILEMATRIX=EPSG:27700:1&TILEROW=1&TILECOL=1");
}

@end
