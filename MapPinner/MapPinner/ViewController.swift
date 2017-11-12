//
//  ViewController.swift
//  MapPinner
//
//  Created by Nicola Solazzo on 11/11/17.
//  Copyright © 2017 Nicola Solazzo. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var latLabel: UILabel!
    
    @IBOutlet weak var lonLabel: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didTouchMap(_ sender: UILongPressGestureRecognizer) {
        
        let position = sender.location(in: mapView)
        
        let coord = mapView.convert(position, toCoordinateFrom: mapView)
       
        latLabel.text = "lat \(coord.latitude)"
        
        lonLabel.text = "lon \(coord.longitude)"
        
        
    }
    
    
    
}





extension ViewController: UISearchBarDelegate {
  
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
        
        guard let testo = searchBar.text else {
            return
        }
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(testo) {
            (locations, error) in
            if error != nil {
                print("error :  \(error!)")
                return
            }
            guard let locs = locations else {
                return
            }
            guard let loc = locs.first else {
                return
            }
            
            guard let coords = loc.location else {
                return
            }
            self.lonLabel.text = "Lon: \(coords.coordinate.longitude)"
            self.latLabel.text = "Lat: \(coords.coordinate.latitude)"
        }
        
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print(searchBar.text!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}



