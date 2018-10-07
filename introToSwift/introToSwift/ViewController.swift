//
//  ViewController.swift
//  introToSwift
//
//  Created by Fisal Alsabhan on 9/2/18.
//  Copyright © 2018 Fisal Alsabhan. All rights reserved.
//

import UIKit
import MapKit
//import CoreLocation

class ViewController: UIViewController{
    var treesArray = [DUAnnotations]()
    
    @IBOutlet weak var myMap: MKMapView!
    
    var titlePH: String = ""
    var contactsPH: String = ""
    
    
    public func getJSON() {
        let URLString: String = "http://mcs.drury.edu/deco/treeservice/index2.php"
        let url = URL(string: URLString)
        if let url = url{
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                print("in dataTask")
                
                if error == nil{
                    print("error is nil")
                    print(data!)
                    self.parseJSON(with: data!)
                    
                } else{
                    print("ERROR \(error!)")
                    
                    
                }
            }
            task.resume()
            
          
            
            
            
        }
        
    }
    public func parseJSON(with data: Data){
        
        let nameKey = "common_name"
        let scientificNameKey = "scientific_name"
        let latitudeKey = "latitude"
        let longitudeKey = "longitude"
        
        do {
        
        let JSONarray = try JSONSerialization.jsonObject(with: data, options:[]) as! [Any]
            for each in JSONarray{
                
                let JSONDictionary: Dictionary = each as! Dictionary <String, AnyObject>
            
                let titleString : String = JSONDictionary[nameKey] as! String
                let scientificString : String = JSONDictionary[scientificNameKey] as! String
                let latitudeString : Double = (JSONDictionary[latitudeKey]?.doubleValue)!
                let longitudeString : Double = (JSONDictionary[longitudeKey]?.doubleValue)!
           
                
                let duannotations = DUAnnotations(coordinates: CLLocationCoordinate2DMake(latitudeString, longitudeString), titles: titleString, contacts: scientificString)
                self.treesArray.append(duannotations)
                print(self.treesArray.count)
                print("++++++++++++++++++++++++++++")
                myMap.addAnnotation(duannotations)
                
               
            }
  
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        }
        catch{
            
            print("something went wrong after calling the jsonparse func")
            
            
        }
        
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapSetUp()
        
        getJSON()
        print(self.treesArray.count)
        myMap.addAnnotations(self.treesArray)
        
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
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var newAnnotationView: MKAnnotationView? // used to store the mkannotationview
       
        let id = "identifier"
        if let annotation = annotation as? DUAnnotations { // making sure that annotation is of type DUannotation
            if let dequeueView = self.myMap.dequeueReusableAnnotationView(withIdentifier: id) { // dequeuing the annptaions in the mapview object
            
                
                newAnnotationView = dequeueView // assigning the dequeued view to the newAnnotationView
                newAnnotationView?.annotation = annotation // making the newAnnotationView?.annotation equal our annotaions of type DUAnnotation
                print("dequeue succeeded")
            }
            else{
                newAnnotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: id) // create annotaions views if dequeue returned nothing
                print("dequeue failed")
            }
            
           
            if let newAnnotationView = newAnnotationView{ // checking if newAnnotation if not nil
                newAnnotationView.canShowCallout = true // used this method to allow showing the callout view
                
                let infoButton: UIButton = UIButton(type: .detailDisclosure) // creating a button with a type of detailDisc
                newAnnotationView.rightCalloutAccessoryView = infoButton
              
                let subtitleLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
                subtitleLabel.text = annotation.contact
                subtitleLabel.font = subtitleLabel.font.withSize(15)
             
                newAnnotationView.detailCalloutAccessoryView = subtitleLabel
                // TODO: add an image to the left callout view.
                let imageView : UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
                imageView.image = annotation.image
                newAnnotationView.leftCalloutAccessoryView = imageView
                
            }
           

        
        } // end of annotation type check
    
        
 
        return newAnnotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView{
             self.performSegue(withIdentifier: "toSecondView", sender: self)
            
            
            
        }
    }
    
    
    
    
}

