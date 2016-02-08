# ArcGIS Runtime Adapter for OS Maps API

This is a small framework that enables rapid integration of the ESRI ArcGIS Runtime iOS SDK with the OS Maps API.

![OS Maps API with ESRI ArcGIS Runtime on iOS](images/map-screenshot.png)

### Before You Begin

1. Register for an ArcGIS developer account: [https://developers.arcgis.com/sign-up/](https://developers.arcgis.com/sign-up/)

2. Once you have an account, install the ArcGIS Runtime SDK on your development machine. The download can be found here: [https://developers.arcgis.com/ios/](https://developers.arcgis.com/ios/)

3. Obtain your OS Maps API key from Ordnance Survey. Follow the 'Getting Started' guide at [https://developer.ordnancesurvey.co.uk](https://developer.ordnancesurvey.co.uk) to do this.

### Xcode Project Setup

#### 1. ArcGIS runtime framework setup

Once you have created a project in Xcode, configure the framework like so:

1. Under *Project -> Build Settings -> Framework Search Paths*, add the path:
`$(HOME)/Library/SDKs/ArcGIS/iOS/`

2. Under *Target -> Build Settings -> Other linker flags*, add the following flags:
`-ObjC -framework ArcGIS -l c++`

These enable the ArcGIS runtime framework to be located and linked with your application.

#### 2. OSArcGISRuntimeAdapter framework setup

You have two options, use [Carthage](https://github.com/Carthage/Carthage) or build the framework manually.

##### If using Carthage:

1. Add `github "OrdnanceSurvey/os-arcgis-runtime-adapter"` to your Cartfile.
2. Run `carthage update`
3. Drag the built framework from the `Carthage/Build` folder into the "Linked Frameworks and Libraries" section in the "General" settings tab of your application target.
4. In the "Build Phases" of your application target's settings, click the '+' and select "New Run Script Phase". Add the following to the script:

    `/usr/local/bin/carthage copy-frameworks`

    and add the path to the OS framework in the "Input Files" section:
    
    `$(SRCROOT)/Carthage/Build/iOS/OSArcGISRuntimeAdapter.framework`

You can now move on to 'Creating a Map'
    
##### Manual framework build:

1. Clone the repo
2. Build the framework
3. Drag the framework into the "Linked Frameworks and Libraries" section in the "General" settings tab of your application target.
4. Add the embed frameworks step to your build phases.

### Creating a Map

In your view controller, import the ArcGIS and OS frameworks:

Objective-C
    
```
import <ArcGIS/ArcGIS.h>
@import OSArcGISRuntimeAdapter;
```
    
Swift
    
```
import ArcGIS;
import OSArcGISRuntimeAdapter;
```
    
Create a property for your map view by e.g. dragging from a view in Interface Builder into your view controller class:
![OS Maps API with ESRI ArcGIS Runtime on iOS](images/01-wire-up-outlet.png)

Name it `mapView` and the type `AGSMapView`:
![OS Maps API with ESRI ArcGIS Runtime on iOS](images/02-name-outlet.png)

Set the class of the view in Interface Builder to `AGSMapView`:
![OS Maps API with ESRI ArcGIS Runtime on iOS](images/03-set-map-class.png)

Now, in your view controller's `viewDidLoad` method, create a layer and add it to the map, like so (Note: You will need to add your own api key where specified.):

Objective-C
    
```
    OSWMTSBaseLayer *layer = [[OSWMTSBaseLayer alloc] initWithBasemapStyle:OSBaseMapStyleRoad
                                                          spatialReference:OSSpatialReferenceBNG
                                                                    apiKey:<your api key>];
    [self.mapView addMapLayer:layer];

```
    
Swift
    
```
        let layer = OSWMTSBaseLayer(basemapStyle: .Road, spatialReference: .BNG, apiKey: <your api key>)
        self.mapView.addMapLayer(layer)
```


If everything is setup correctly, when you run your app, the map will load and you will see an OS basemap:
![OS Maps API with ESRI ArcGIS Runtime on iOS](images/map-screenshot.png)

### Examples

The project contains both Objective-C and Swift example applications which illustrate usage of the OS Maps API. To run these, make sure your API key is in a file named `APIKEY` in the project root directory.

`$ printf <your-api-key> > APIKEY`