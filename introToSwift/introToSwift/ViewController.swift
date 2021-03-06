//
//  ViewController.swift
//  introToSwift
//
//  Created by Fisal Alsabhan on 9/2/18.
//  Copyright © 2018 Fisal Alsabhan. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBAction func segueButton(_ sender: Any) {
        
        
        
    }
    @IBOutlet weak var myMap: MKMapView!
    
    var titlePH: String = ""
    var contactsPH: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapSetUp()
        
        
        let lucasNotations = DUAnnotations(coordinates: CLLocationCoordinate2DMake(37.218547, -93.285620), titles: "Building 1 ")
        let lucasNotations2 = DUAnnotations(coordinates: CLLocationCoordinate2DMake(37.21864, -93.28563), titles: "Building2", contacts: "165123513251")
        
        myMap.addAnnotation(lucasNotations)
        myMap.addAnnotation(lucasNotations2)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is detailsViewController {
            
            let otherViewController = segue.destination as! detailsViewController
            
            otherViewController.titlePlaceholder = self.titlePH
            otherViewController.contactPlaceholder = self.contactsPH
             print("segue sec")
        }
            
            
            
        
    }
    public func mapSetUp(){
        myMap.delegate = self
        let DULocation = CLLocationCoordinate2DMake(37.2203, -93.2856)
        let DUSpan = MKCoordinateSpanMake(0.01, 0.01)
        
        self.myMap.region = MKCoordinateRegion(center: DULocation, span: DUSpan)
        self.myMap.mapType = .satellite
        
        
        
    }
    
    
    
}

extension ViewController: MKMapViewDelegate{
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        if let customAnno: DUAnnotations = view.annotation as? DUAnnotations{
            // TODO
            if customAnno.contact != nil {
                self.titlePH = customAnno.title!
                self.contactsPH = customAnno.contact!
            }
            else{
                self.titlePH = customAnno.title!
                
                
            }
            
        }
        
        
    }
    
    
    
    
    
    
    
    
}

