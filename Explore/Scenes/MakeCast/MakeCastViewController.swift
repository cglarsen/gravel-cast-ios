//
//  MakeCastViewController.swift
//  Explore
//
//  Created by Christian Graver on 25/12/2018.
//  Copyright (c) 2018 nordgrus. All rights reserved.
//
//  This file was generated by the Daman Clean Swift Xcode Templates
//  with inspiration from http://clean-swift.com
//

import UIKit
import MapKit

protocol MakeCastDisplayLogic: class {
    func display(stravaRoute: StravaRoute)
    func displayError(message: String)
}

class MakeCastViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var stravaRouteIdTextField: UITextField! {
        didSet {
            stravaRouteIdTextField.text = "16534173"
        }
    }
    @IBOutlet weak var mapView: MKMapView! { didSet {
            mapView.isHidden = true
            mapView.delegate = self
        }
    }
    
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView! {
        didSet {
            activityIndicator.isHidden = true
        }
    }
    
    // MARK: - Properties
    var interactor: MakeCastBusinessLogic?
    var router: (NSObjectProtocol & MakeCastRoutingLogic & MakeCastDataPassing)?
    
    var routeOverlay: MKOverlay?
    
    // MARK: - Init
    class func instantiate() -> MakeCastViewController {
        let name = "\(MakeCastViewController.self)"
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: name) as! MakeCastViewController
        vc.setup()
        return vc
    }
    
    // MARK: - Setup
    private func setup() {
        let viewController = self
        let interactor = MakeCastInteractor()
        let presenter = MakeCastPresenter()
        let router = MakeCastRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @IBAction func goPressed(_ sender: Any) {
        if let idString = stravaRouteIdTextField.text, !idString.isEmpty {
            interactor?.fetchStravaRoute(with: idString)
            self.view.endEditing(true)
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
            goButton.isHidden = true
            
        } else {
            errorLabel.isHidden = false
            errorLabel.text = "Skriv et strava route id"
        }
        
    }
    
    // MARK: - Misc
}

// MARK: - MakeCastDisplayLogic
extension MakeCastViewController: MakeCastDisplayLogic {
    func display(stravaRoute: StravaRoute) {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        goButton.isHidden = false
        mapView.isHidden = false
        errorLabel.isHidden = true
        
        mapView.removeOverlays(mapView.overlays)
        
        let points: [CLLocationCoordinate2D] = stravaRoute.coordinates.map { (coor) -> CLLocationCoordinate2D in
            return CLLocationCoordinate2D(latitude: Double(coor.lat)!, longitude: Double(coor.lon)!)
        }
        
        let routePolyline = MKPolyline(coordinates: points, count: points.count)
        mapView.addOverlay(routePolyline)
        mapView.setVisibleMapRect(routePolyline.boundingMapRect, animated: true)
    }
    
    func displayError(message: String) {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        goButton.isHidden = false
        mapView.isHidden = true
        errorLabel.isHidden = false
        errorLabel.text = message
    }
}


extension MakeCastViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = .primaryColor
        renderer.lineWidth = 3.0
        
        return renderer
    }
}
