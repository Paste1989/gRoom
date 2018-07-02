//
//  GRFourthViewController.swift
//  GrApp
//
//  Created by Saša Brezovac on 13/06/2018.
//  Copyright © 2018 CopyPaste89. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class GRMapViewController: UIViewController, CLLocationManagerDelegate {
    
    var myGreenColor = UIColor(hex: 0x1DA84D)
    
    
    //MARK: - Outlets
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    let annotation = MKPointAnnotation()
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        annotation.coordinate = CLLocationCoordinate2D(latitude: 10.659311, longitude: 15.41861)
        mapView.addAnnotation(annotation)
        
        
        previousVC()
        
        let backButtonImage = UIImage(named: "backSignWh")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: backButtonImage, style: UIBarButtonItemStyle.plain, target: self, action: #selector(goBack))
        
       
        let infoButton = UIImage(named: "infooo")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: infoButton, style: UIBarButtonItemStyle.plain, target: self, action: #selector(goToInfo))

        
        navigationItem.leftBarButtonItem?.tintColor = UIColor.black
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        navigationController?.navigationBar.topItem?.title = "Map"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        if UIScreen.main.bounds.size.height == 812 {
            let image = UIImage(named: "navImage")
            self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        }
        else {
            let image = UIImage(named: "nBarImage2")
            self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationItem.leftBarButtonItem?.tintColor = UIColor.black
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        navigationController?.navigationBar.topItem?.title = "Map"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        if UIScreen.main.bounds.size.height == 812 {
            let image = UIImage(named: "navImage")
            self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        }
        else {
            let image = UIImage(named: "nBarImage2")
            self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        } 
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: - Actions
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
        let center = location.coordinate
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: center, span: span)
        
        
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = true
    }
    
    
    @objc func goBack(){
        navigationController?.popViewController(animated: true)
    }
    
    
    @objc func goToInfo(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let infoVC = storyboard.instantiateViewController(withIdentifier: "GRInfoLocationViewController") as! GRInfoLocationViewController
        
        self.navigationController?.pushViewController(infoVC, animated: true)
    }
    
    
    func previousVC(){
        if let navController = self.navigationController, navController.viewControllers.count >= 2 {
            let previousVC = navController.viewControllers[navController.viewControllers.count - 2]
            print("Previous VC: \(previousVC)")
            
        }
    }
    
   
}
