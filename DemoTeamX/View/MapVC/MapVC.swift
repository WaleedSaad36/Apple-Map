//
//  MapVC.swift
//  DemoTeamX
//
//  Created by IDE Academy on 4/1/21.
//  Copyright © 2021 IDE Academy. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

    //MARK:- POP Protocol MapVc
protocol MapVCProtocol:class {
    func showLoader()
    func hideLoader()
    func showAlert(message:String)
    var locationManager: CLLocationManager { get }
    var mapkit:MKMapView { get }
    func goLogin()
    func goToMain()
}


class MapVC: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate, UITextFieldDelegate {

    //MARK:- outLets
    @IBOutlet var mapView: MapView!
    
    //MARK:- properties
    var locationManager = CLLocationManager()
    var viewModel: MapViewModel?
    
    //MARK:- lifeCycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDelegate()
    }
    
    class func create() -> MapVC {
        let mapVC: MapVC = UIViewController.create(storyboardName: Storyboards.map, identifier: viewControllers.mapVC)
        mapVC.viewModel = MapViewModel(view: mapVC)
        return mapVC
    }
    
    //MARK:- setup Delegate Map + textField + locationManager
    private func setUpDelegate(){
        self.mapView.addressTxt.delegate = self
        mapView.map.delegate = self
        mapView.map.showsScale = true
        mapView.map.showsUserLocation = true
        mapView.map.showsPointsOfInterest = true
        locationManager.delegate = self
        
        if(CLLocationManager.locationServicesEnabled()){
            locationManager.requestLocation()
            locationManager.startUpdatingLocation()
        }
    }
    
    //MARK:- setup Any update in location 
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let userLocation = locations.first {
            manager.stopUpdatingLocation()
            let coordinates = CLLocationCoordinate2DMake(locationManager.location?.coordinate.latitude ?? 0.0, locationManager.location?.coordinate.longitude ?? 0.0)
            
            let span = MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0)
            
            let region = MKCoordinateRegion(center: coordinates, span: span)
            
            mapView.map.setRegion(region, animated: true)
            let mypin = MKPointAnnotation()
            mypin.coordinate = coordinates
            
            mypin.title = "there here"
            mypin.subtitle = "I`m here"
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways:
            return
        case .authorizedWhenInUse:
            return
        case .denied:
            return
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            locationManager.requestWhenInUseAuthorization()
        default:
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    //MARK:- method print Any error related locations
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    //MARK:- setup Map Directions Line
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let render = MKPolylineRenderer(overlay: (overlay as! MKPolyline) )
        render.strokeColor = .blue
        render.lineWidth = 4.0
        render.alpha = 1.0
        return render
    }
    
    //MARK:- IBActions Buttons
    @IBAction func getDirectionTapped(_ sender: Any) {
        viewModel?.getAddrssLocation(inputAddress: mapView.addressTxt.text ?? "" )
        print("press Btn")
    }
    
    @IBAction func logOutTapped(_ sender: Any) {
        UserDefaultsManager.shared().isLoggedIn = false
        if UserDefaultsManager.shared().token == nil{
            goToMain()
        }
    }
}
    //MARK:- Confirm Protocol MapVC
extension MapVC: MapVCProtocol {
    func goToMain() {
        let mainVC = MainVC.create()
        self.present(mainVC, animated: true, completion: nil)
    }
    func goLogin() {
        let loginVC = LoginVC.create()
        self.present(loginVC, animated: true, completion: nil)
    }
    var mapkit: MKMapView {
        return mapView.map
    }
    func showLoader() {
        mapView?.showLoading()
    }
    func hideLoader() {
        mapView?.hideLoading()
    }
    func showAlert(message:String){
        showAlert(title: "Sorry", message: message, okTitle: "Ok", okHandler: nil)
    }
}
