//
//  ViewController.swift
//  MapPinner
//
//  Created by Nicola Solazzo on 11/11/17.
//  Copyright © 2017 Nicola Solazzo. All rights reserved.
//

import UIKit
import MapKit



class ViewController: UIViewController {

    @IBOutlet weak var latLabel: UILabel!
    
    @IBOutlet weak var lonLabel: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didTouchMap(_ sender: UILongPressGestureRecognizer) {
        
        print("Touch map")
    }
    
    
    
}

