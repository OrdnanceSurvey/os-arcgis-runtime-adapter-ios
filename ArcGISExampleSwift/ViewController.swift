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

    override func viewDidLoad() {
        super.viewDidLoad()
        let layer = OSWMTSBaseLayer(basemapStyle: .Road, spatialReference: .BNG)
        self.mapView.addMapLayer(layer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
