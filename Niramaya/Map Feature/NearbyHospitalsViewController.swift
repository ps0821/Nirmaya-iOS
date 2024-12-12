//
//  NearbyHospitalsViewController.swift
//  Niramaya
//
//  Created by Yash's Mackbook on 11/12/24.
//

import UIKit
import MapKit
import CoreLocation

class NearbyHospitalsViewController: UIViewController, CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate {

    // MARK: - Properties
    private let locationManager = CLLocationManager()
    private var userLocation: CLLocation?
    private var searchResults: [MKMapItem] = [] // To store doctor search results

    private let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(DoctorTableViewCell.self, forCellReuseIdentifier: "DoctorCell")
        tableView.rowHeight = 150
        return tableView
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        
//        view.backgroundColor = UIColor.systemGroupedBackground
//
//        // Navigation bar setup
//        navigationItem.title = "Services"
//        navigationController?.navigationBar.prefersLargeTitles = false
        super.viewDidLoad()
        setupUI()
        setupLocationManager()
        title = "Nearby Hospitals"
        // Customize the navigation bar title appearance
           let appearance = UINavigationBarAppearance()
           appearance.titleTextAttributes = [
               .foregroundColor: UIColor.black, // Set title color
               .font: UIFont.boldSystemFont(ofSize: 22) // Set title font and size
           ]
           appearance.backgroundColor = UIColor.white // Optional: Set navigation bar background color
           
           // Apply the appearance to the navigation bar
           navigationController?.navigationBar.standardAppearance = appearance
           navigationController?.navigationBar.scrollEdgeAppearance = appearance
           navigationController?.navigationBar.compactAppearance = appearance
//        navigationController?.navigationBar.prefersLargeTitles = true
    }
    // MARK: - Setup
    private func setupUI() {
        
        mapView.showsUserLocation = true
        view.addSubview(mapView)
        view.addSubview(tableView)

        mapView.delegate = self
        tableView.delegate = self
        tableView.dataSource = self

        // Layout constraints
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mapView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25),

            tableView.topAnchor.constraint(equalTo: mapView.bottomAnchor,constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    // MARK: - CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        userLocation = location
        locationManager.stopUpdatingLocation()
        centerMapOnLocation(location: location)
        searchForDoctors(near: location)
    }

    private func centerMapOnLocation(location: CLLocation) {
        let region = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: 6000,
            longitudinalMeters: 6000
        )
        mapView.setRegion(region, animated: true)
    }

    // MARK: - Search for Nearby Doctors
    private func searchForDoctors(near location: CLLocation) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = "Hospitals"
        request.region = mapView.region

        let search = MKLocalSearch(request: request)
        search.start { [weak self] response, error in
            guard let self = self, let response = response else { return }
            self.searchResults = response.mapItems
            self.addAnnotations()
            self.tableView.reloadData()
        }
    }

    private func addAnnotations() {
        mapView.removeAnnotations(mapView.annotations)
        for item in searchResults {
            let annotation = MKPointAnnotation()
            annotation.title = item.name
            annotation.subtitle = item.phoneNumber
            annotation.coordinate = item.placemark.coordinate
            mapView.addAnnotation(annotation)
        }
    }

    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorCell", for: indexPath) as! DoctorTableViewCell
        let item = searchResults[indexPath.row]
        let distance = userLocation?.distance(from: item.placemark.location ?? CLLocation()) ?? 0
        let category = item.pointOfInterestCategory?.rawValue ?? "General" // Default category if unavailable
        let phone = item.phoneNumber ?? "Not Available"
        cell.configure(
            name: item.name ?? "Unknown Doctor",
            category: category,
            phone: phone,
            distance: distance / 1000 // Convert meters to kilometers
        )
        return cell
    }


}
#Preview{
    NearbyHospitalsViewController()
}

