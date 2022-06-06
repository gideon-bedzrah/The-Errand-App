//
//  DeliveryViewController.swift
//  The Errand App
//
//  Created by Gideon Bedzrah on 3/2/22.
//

import UIKit
import MapKit

class DeliveryViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var pickupLocationView: UIView!
    @IBOutlet weak var dropOffLocationView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

//        mapView.delegate = self
        dropOffLocationView.isHidden = true
        
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
//        self.navigationController?.popViewController(animated: true)
        
        UIView.animate(withDuration: 0.5) {
//            self.dropOffLocationView.alpha = 1
            self.dropOffLocationView.isHidden = false
        }
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
