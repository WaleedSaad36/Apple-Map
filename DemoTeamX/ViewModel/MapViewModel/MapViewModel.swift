//
//  MapViewModel.swift
//  DemoTeamX
//
//  Created by IDE Academy on 4/1/21.
//  Copyright © 2021 IDE Academy. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

    //MARK:- POP viewModelprotocol
protocol MapViewModelProtocol:class {
    func getAddrssLocation(inputAddress: String)
}

class MapViewModel{
    
    //MARK:- properties
    private var view:MapVCProtocol?
    let geoCoder = CLGeocoder()
    //MARK:- inithilization ViewModel
    init(view:MapVCProtocol) {
        self.view = view
    }
    
    //MARK:- private methods
    private func getAddress(inputAddress: String) {
        geoCoder.geocodeAddressString(inputAddress){ (pleceMarks, error) in
            guard let pleceMarks = pleceMarks , let location = pleceMarks.first?.location else {
                self.view?.showAlert(message: "Please Enter Address")
                return
            }
            print("Successfully Location")
            print(location.coordinate)
            self.mapThis(destenationCord: location.coordinate)
        }
    }
    
    private func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
    }
    
    private func mapThis(destenationCord: CLLocationCoordinate2D ){
        guard let sourceCordinate = (view?.locationManager.location?.coordinate) else { return }
        
        let sourcePlaceMark = MKPlacemark(coordinate: sourceCordinate)
        let destPlaceMark = MKPlacemark(coordinate: destenationCord)
        
        let sourceItem = MKMapItem(placemark: sourcePlaceMark)
        let destItem = MKMapItem(placemark: destPlaceMark)
        
        let distenationRequest = MKDirections.Request()
        distenationRequest.source = sourceItem
        distenationRequest.destination = destItem
        distenationRequest.transportType = .walking
        distenationRequest.requestsAlternateRoutes = true
        
        let directions = MKDirections(request: distenationRequest)
        directions.calculate(completionHandler: { (response , error) in
            guard let response = response else {return}
            let route = response.routes[0]
            self.view?.mapkit.addOverlay(route.polyline, level: .aboveRoads)
            
            let rect = route.polyline.boundingMapRect
            self.view?.mapkit.setVisibleMapRect(rect, animated: true)
        })
    }
}
    //MARK:- confirmProtocolViewModel
extension MapViewModel: MapViewModelProtocol{
    func getAddrssLocation(inputAddress: String) {
        getAddress(inputAddress: inputAddress)
    }
}
