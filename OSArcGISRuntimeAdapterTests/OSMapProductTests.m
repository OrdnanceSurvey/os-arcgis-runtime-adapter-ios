//
//  OSMapProductTests.m
//  OSArcGISRuntimeAdapter
//
//  Created by David on 08/02/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

@import MIQTestingFramework;
@import OSArcGISRuntimeAdapter;

@interface OSMapProductTests : XCTestCase

@end

@implementation OSMapProductTests

- (void)testWellKnownIDIsReturnedCorrectlyForBNG {
    NSInteger wkidBNG = OSWkIDFromSpatialReference(OSSpatialReferenceBNG);
    expect(wkidBNG).to.equal(27700);
}

- (void)testWellKnownIDIsReturnedCorrectlyForWebMercator {
    NSInteger wkidBNG = OSWkIDFromSpatialReference(OSSpatialReferenceWebMercator);
    expect(wkidBNG).to.equal(3857);
}

- (void)testProductNameIsReturnedCorrectlyForRoadStyleInBNG {
    NSString *name = NSStringFromOSMapLayer(OSBaseMapStyleRoad, OSSpatialReferenceBNG);
    expect(name).to.equal(@"Road%2027700");
}

- (void)testProductNameIsReturnedCorrectlyForOutdoorStyleInBNG {
    NSString *name = NSStringFromOSMapLayer(OSBaseMapStyleOutdoor, OSSpatialReferenceBNG);
    expect(name).to.equal(@"Outdoor%2027700");
}

- (void)testProductNameIsReturnedCorrectlyForLightStyleInBNG {
    NSString *name = NSStringFromOSMapLayer(OSBaseMapStyleLight, OSSpatialReferenceBNG);
    expect(name).to.equal(@"Light%2027700");
}

- (void)testProductNameIsReturnedCorrectlyForNightStyleInBNG {
    NSString *name = NSStringFromOSMapLayer(OSBaseMapStyleNight, OSSpatialReferenceBNG);
    expect(name).to.equal(@"Night%2027700");
}

- (void)testProductNameIsReturnedCorrectlyForRoadStyleInWebMercator {
    NSString *name = NSStringFromOSMapLayer(OSBaseMapStyleRoad, OSSpatialReferenceWebMercator);
    expect(name).to.equal(@"Road%203857");
}

- (void)testProductNameIsReturnedCorrectlyForOutdoorStyleInWebMercator {
    NSString *name = NSStringFromOSMapLayer(OSBaseMapStyleOutdoor, OSSpatialReferenceWebMercator);
    expect(name).to.equal(@"Outdoor%203857");
}

- (void)testProductNameIsReturnedCorrectlyForLightStyleInWebMercator {
    NSString *name = NSStringFromOSMapLayer(OSBaseMapStyleLight, OSSpatialReferenceWebMercator);
    expect(name).to.equal(@"Light%203857");
}

- (void)testProductNameIsReturnedCorrectlyForNightStyleInWebMercator {
    NSString *name = NSStringFromOSMapLayer(OSBaseMapStyleNight, OSSpatialReferenceWebMercator);
    expect(name).to.equal(@"Night%203857");
}

@end
