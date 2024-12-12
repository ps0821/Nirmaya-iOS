//
//  MapSearchViewController.swift
//  Niramaya
//
//  Created by Yash's Mackbook on 20/11/24.
//
import UIKit
import MapKit
import CoreLocation

class MapSearchViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    private let locationManager = CLLocationManager() // For managing location updates
    private let mapView = MKMapView() // Map view to display user's location
    
    // Address labels
    private let addressLabel = UILabel()
    private let subAddressLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLocationManager()
        
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        // Map View
        mapView.delegate = self
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.showsUserLocation = true
        view.addSubview(mapView)
        
        // Bottom card container
        let bottomCard = UIView()
        bottomCard.backgroundColor = .white
        bottomCard.layer.cornerRadius = 30
        bottomCard.layer.shadowColor = UIColor.black.cgColor
        bottomCard.layer.shadowOpacity = 0.1
        bottomCard.layer.shadowRadius = 10
        bottomCard.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomCard)
        
        // Options Container
        let optionsContainer = UIStackView()
        optionsContainer.axis = .vertical
        optionsContainer.alignment = .center
        optionsContainer.spacing = 12
        optionsContainer.translatesAutoresizingMaskIntoConstraints = false
        bottomCard.addSubview(optionsContainer)
        
        // Add Buttons
        let firstRowOptions = ["Nearby Doctors", "Nearby Homestays"]
        let secondRowOptions = ["Cabs", "Nearby Hospitals"]
        
        // First Row
        let firstRowStack = createAdaptiveButtonRow(with: firstRowOptions)
        optionsContainer.addArrangedSubview(firstRowStack)
        
        // Second Row
        let secondRowStack = createAdaptiveButtonRow(with: secondRowOptions)
        optionsContainer.addArrangedSubview(secondRowStack)
        
        // Address Labels
        addressLabel.text = "House, Street, City, State"
        addressLabel.font = UIFont.boldSystemFont(ofSize: 28)
        addressLabel.textAlignment = .center
        addressLabel.textColor = .black
        addressLabel.numberOfLines = 0
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomCard.addSubview(addressLabel)
        
        subAddressLabel.text = "Blah blah blah blah blah blah blah blah blah blah blah blah blah blah bl"
        subAddressLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        subAddressLabel.textColor = UIColor.black
        subAddressLabel.textAlignment = .center
        subAddressLabel.numberOfLines = 0
        subAddressLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomCard.addSubview(subAddressLabel)
        
        // Confirm Button
        let confirmButton = UIButton(type: .system)
        confirmButton.setTitle("Tap to Confirm", for: .normal)
        confirmButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        confirmButton.backgroundColor = UIColor(red: 103 / 255, green: 148 / 255, blue: 0 / 255, alpha: 1.0)
        confirmButton.setTitleColor(.white, for: .normal)
        confirmButton.layer.cornerRadius = 24
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.addTarget(self, action: #selector(confirmButtonTapped), for: .touchUpInside)
        bottomCard.addSubview(confirmButton)
        
        // Add Constraints
        NSLayoutConstraint.activate([
            // Map View
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // Bottom Card
            bottomCard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 2),
            bottomCard.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -2),
            bottomCard.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 40),
            bottomCard.heightAnchor.constraint(equalToConstant: 300),
            
            // Options Container
            optionsContainer.topAnchor.constraint(equalTo: bottomCard.topAnchor, constant: 16),
            optionsContainer.leadingAnchor.constraint(equalTo: bottomCard.leadingAnchor, constant: 16),
            optionsContainer.trailingAnchor.constraint(equalTo: bottomCard.trailingAnchor, constant: -16),
            
            // Address Labels
            addressLabel.topAnchor.constraint(equalTo: optionsContainer.bottomAnchor, constant: 16),
            addressLabel.leadingAnchor.constraint(equalTo: bottomCard.leadingAnchor, constant: 8),
            addressLabel.trailingAnchor.constraint(equalTo: bottomCard.trailingAnchor, constant: -8),
            
            subAddressLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 8),
            subAddressLabel.leadingAnchor.constraint(equalTo: bottomCard.leadingAnchor, constant: 16),
            subAddressLabel.trailingAnchor.constraint(equalTo: bottomCard.trailingAnchor, constant: -16),
            
            // Confirm Button
            confirmButton.topAnchor.constraint(equalTo: subAddressLabel.bottomAnchor, constant: 16),
            confirmButton.leadingAnchor.constraint(equalTo: bottomCard.leadingAnchor, constant: 80),
            confirmButton.trailingAnchor.constraint(equalTo: bottomCard.trailingAnchor, constant: -80),
            confirmButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    private func createAdaptiveButtonRow(with options: [String]) -> UIStackView {
        let rowStack = UIStackView()
        rowStack.axis = .horizontal
        rowStack.alignment = .center
        rowStack.spacing = 12
        rowStack.distribution = .equalSpacing
        rowStack.translatesAutoresizingMaskIntoConstraints = false
        
        for option in options {
            let button = UIButton(type: .system)
            button.setTitle(option, for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
            button.layer.cornerRadius = 16
            button.backgroundColor = .clear
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.borderWidth = 1
            button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
            
            // Add target action for buttons
            switch option {
            case "Nearby Doctors":
                button.addTarget(self, action: #selector(DoctorButton), for: .touchUpInside)
            case "Nearby Hospitals" :
                button.addTarget(self, action: #selector(DoctorButton), for: .touchUpInside)
            default:
                break
            }
            
            rowStack.addArrangedSubview(button)
        }
        return rowStack
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            mapView.setRegion(region, animated: true)
            
            // Reverse Geocoding
            let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(location) { [weak self] placemarks, error in
                guard let self = self else { return }
                if let error = error {
                    print("Failed to get address: \(error.localizedDescription)")
                    return
                }
                
                if let placemark = placemarks?.first {
                    let address = "\(placemark.name ?? ""), \(placemark.locality ?? "")"
                    let subAddress = "\(placemark.administrativeArea ?? ""), \(placemark.country ?? "")"
                    
                    DispatchQueue.main.async {
                        self.addressLabel.text = address
                        self.subAddressLabel.text = subAddress
                    }
                }
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
    
    @objc private func confirmButtonTapped() {
        print("Confirm button tapped")
        // Add functionality for confirm button
    }
    
    @objc private func DoctorButton() {
        print("Nearby Doctors button tapped")
        let doctorVC = MapWithDoctorsViewController() // Replace with your actual ViewController
        navigationController?.pushViewController(doctorVC, animated: true)
    }
    @objc private func HospitalButton() {
        print("Nearby Doctors button tapped")
        let doctorVC = NearbyHospitalsViewController() // Replace with your actual ViewController
        navigationController?.pushViewController(doctorVC, animated: true)
    }
}


#Preview {
    MapSearchViewController()
}
