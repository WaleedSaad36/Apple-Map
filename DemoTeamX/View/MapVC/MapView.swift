//
//  MapView.swift
//  DemoTeamX
//
//  Created by IDE Academy on 4/1/21.
//  Copyright © 2021 IDE Academy. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapView: UIView {

    //MARK:- OutLets
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var addressTxt: UITextField!
    @IBOutlet weak var getDirectionBtn: UIButton!
    @IBOutlet weak var logoutBtn: UIButton!
    
    
}
