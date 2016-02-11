//
//  ViewController.swift
//  ArcGISExampleSwift
//
//  Created by David Haynes on 08/02/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

import UIKit
import ArcGIS;
import OSArcGISRuntimeAdapter;

class ViewController: UIViewController {

    @IBOutlet weak var mapView: AGSMapView!
    let bngLayer: OSWMTSBaseLayer
    let wmLayer: OSWMTSBaseLayer
    var selectedLayer: OSWMTSBaseLayer

    required init?(coder aDecoder: NSCoder) {
        bngLayer = .init(basemapStyle: .Road, spatialReference: .BNG, apiKey: apiKey())
        wmLayer = .init(basemapStyle: .Outdoor, spatialReference: .WebMercator, apiKey: apiKey())
        selectedLayer = bngLayer
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.addMapLayer(selectedLayer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func toggleBasemap(sender: AnyObject) {
        if selectedLayer.tileInfo.spatialReference == AGSSpatialReference(WKID: 3857){
            mapView.removeMapLayer(wmLayer)
            selectedLayer = bngLayer
        } else {
            mapView.removeMapLayer(bngLayer)
            selectedLayer = wmLayer
        }
        toggleBaseMapLayer(selectedLayer)
    }

    func toggleBaseMapLayer(layer: OSWMTSBaseLayer) {
        let newMap = AGSMapView()
        newMap.addMapLayer(layer)
        newMap.frame = mapView.frame
        mapView.removeFromSuperview()
        view.addSubview(newMap)
        view.sendSubviewToBack(newMap)
        mapView = nil
        mapView = newMap
    }
}

func apiKey() -> String {
    return NSBundle.mainBundle().URLForResource("APIKEY", withExtension: nil).flatMap { url -> String? in
        do { return try String(contentsOfURL: url).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()) } catch { return nil }
        } ?? ""
}
