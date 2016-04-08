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

    @IBOutlet var mapView: AGSMapView!

    var apiKey: String {
        return NSBundle.mainBundle().URLForResource("APIKEY", withExtension: nil).flatMap { url -> String? in
            do { return try String(contentsOfURL: url).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()) } catch { return nil }
            } ?? ""
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let layer = OSWMTSBaseLayer(basemapStyle: .Road, spatialReference: .BNG, apiKey: apiKey)
        self.mapView.addMapLayer(layer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
