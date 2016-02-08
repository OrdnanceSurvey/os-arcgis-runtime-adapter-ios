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

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testWellKnownIDIsReturnedCorrectlyForBNG {
    NSInteger wkidBNG = WkIDFromOSSpatialReference(OSSpatialReferenceBNG);
    expect(wkidBNG).to.equal(27700);
}

- (void)testWellKnownIDIsReturnedCorrectlyForWebMercator {
    NSInteger wkidBNG = WkIDFromOSSpatialReference(OSSpatialReferenceWebMercator);
    expect(wkidBNG).to.equal(3857);
}

@end
