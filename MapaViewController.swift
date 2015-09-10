//
//  MapaViewController.swift
//  Iniciacao
//
//  Created by William Alvelos on 10/09/15.
//  Copyright (c) 2015 William Alvelos. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import MapKit




class MapaViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, UISearchBarDelegate, UISearchControllerDelegate{
    
    
    var locationManager = CLLocationManager()
    
    @IBOutlet var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.translucent = false
        self.title = "Mapa"
        self.navigationController?.navigationBar.barTintColor = Repteis.Fundo
    }
    
    
    func mapView(mapView: MKMapView!,
        viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
            
            if annotation is MKUserLocation {
                
                return nil
                
            }
            
            let reuseId = "pin"
            
            var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId) as? MKPinAnnotationView
            if pinView == nil {
                pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
                pinView!.canShowCallout = true
                pinView!.animatesDrop = true
                pinView!.canBecomeFirstResponder()
                pinView!.pinColor = .Purple
                
                
                annotation.coordinate
                
                
                
                let roleButton = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
                
                roleButton.addTarget(self, action: "selectRole:", forControlEvents: UIControlEvents.TouchUpInside)
                
                
                roleButton.frame.size.width = 44
                roleButton.frame.size.height = 44
                roleButton.setImage(UIImage(named: "main_seta"), forState: .Normal)
                
                
                
                //var rightButton :UIButton = UIButton.buttonWithType(UIButtonType.InfoDark) as! UIButton
                
                
                
                pinView!.rightCalloutAccessoryView = roleButton
                
                //                    var icon = UIImageView(image: UIImage(named: "teste.png"))
                //                    pinView!.leftCalloutAccessoryView = icon
                
            }
            else {
                pinView!.annotation = annotation
            }
            
            
            return pinView
    }

    
    func mapView(mapView: MKMapView!, annotationView view: MKAnnotationView!, calloutAccessoryControlTapped control: UIControl!) {
        
        var annView = view.annotation
//        
//        let nextViewController = TransitionManager.creatView("PartidaTableViewController") as! PartidaTableViewController
//        var event = Event()
//        
//        
//        event.localizacao = Localizacao()
//        event.localizacao?.name = annView.title
//        
//        event.localizacao?.latitude = Float(annView.coordinate.latitude)
//        event.localizacao?.longitude = Float(annView.coordinate.longitude)
//        
//        nextViewController.event = event
//        
//        nextViewController.location = annView.coordinate
//        
//        self.navigationController?.pushViewController(nextViewController, animated: true)
//        
        
        //        annotation *annView = view.annotation;
        //        detailedViewOfList *detailView = [[detailedViewOfList alloc]init];
        //        detailView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        //        detailView.address = annView.address;
        //        detailView.phoneNumber = annView.phonenumber;
        //        [self presentModalViewController:detailView animated:YES];
    }
    
    func locationManager(manager: CLLocationManager!,
        didChangeAuthorizationStatus status: CLAuthorizationStatus) {
            
            //showActivity()
            
            var shouldIAllow = false
            
            switch status {
            case CLAuthorizationStatus.AuthorizedAlways:
                shouldIAllow = true
            default:
                //LOCATION IS RESTRICTED ********
                //LOCATION IS RESTRICTED ********
                //LOCATION IS RESTRICTED ********
                return
            }
            
            NSNotificationCenter.defaultCenter().postNotificationName("LabelHasbeenUpdated", object: nil)
            
            if (shouldIAllow == true) {
                // Start location services
                locationManager.startUpdatingLocation()
            }
            
    }
    
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        var locationArray = locations as NSArray
        var locationObj = locationArray.lastObject as! CLLocation
        var coord = locationObj.coordinate
        
        let region = MKCoordinateRegionMakeWithDistance(coord, 0, 0)
        
//        geoLocation = coord
//        
//        if(self.bool){
//            addPointsOfInterest("", name: "", location: geoLocation, pageToken: "")
//            self.bool = false
//        }
        mapView.setRegion(region, animated: true)
        
        mapView.userLocation.title = "VOCE"
        
    }
    
    
    
    
    
    
}