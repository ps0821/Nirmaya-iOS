//
//  LocationPromptViewController.swift
//  Niramaya
//
//  Created by Yash's Mackbook on 20/11/24.
//

import UIKit

class LocationPromptViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        // Map background
        let mapBackground = UIImageView()
        mapBackground.image = UIImage(named: "map_background") // Replace with your image
        mapBackground.contentMode = .scaleAspectFill
        mapBackground.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapBackground)
        
        // Card container
        let cardView = UIView()
        cardView.backgroundColor = .white
        cardView.layer.cornerRadius = 16
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOpacity = 0.2
        cardView.layer.shadowRadius = 10
        cardView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cardView)
        
        // Icon
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(named: "bx_map")
        iconImageView.tintColor = .systemGreen
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(iconImageView)
        
        // Title label
        let titleLabel = UILabel()
        titleLabel.text = "Where are you?"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(titleLabel)
        
        // Description label
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Blah blah blah blah blah blah blah blah blah blah blah blah blah blah bl"
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = .black
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(descriptionLabel)
        
        // Locate Me button
        let locateButton = UIButton(type: .system)
        locateButton.setTitle("Locate me", for: .normal)
        locateButton.backgroundColor = UIColor(hex: "#679400")
        locateButton.setTitleColor(.white, for: .normal)
        locateButton.layer.cornerRadius = 8
        locateButton.translatesAutoresizingMaskIntoConstraints = false
        locateButton.addTarget(self, action: #selector(locateButtonTapped), for: .touchUpInside)
        cardView.addSubview(locateButton)
        
        // Manual location button
        let manualButton = UIButton(type: .system)
        manualButton.setTitle("Select location manually", for: .normal)
        manualButton.setTitleColor(UIColor(hex: "#000000"), for: .normal)
        manualButton.translatesAutoresizingMaskIntoConstraints = false
        manualButton.addTarget(self, action: #selector(manualButtonTapped), for: .touchUpInside)
        cardView.addSubview(manualButton)
        
        // Add constraints
        NSLayoutConstraint.activate([
            mapBackground.topAnchor.constraint(equalTo: view.topAnchor),
            mapBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            cardView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            iconImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 20),
            iconImageView.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 60),
            iconImageView.widthAnchor.constraint(equalToConstant: 60),
            
            titleLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            
            locateButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            locateButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            locateButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            locateButton.heightAnchor.constraint(equalToConstant: 44),
            
            manualButton.topAnchor.constraint(equalTo: locateButton.bottomAnchor, constant: 12),
            manualButton.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            manualButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -20)
        ])
    }
    
    @objc private func locateButtonTapped() {
        print("Locate Me button tapped")
        
        // Instantiate MapSearchViewController and push to the navigation stack
        let mapSearchVC = MapSearchViewController()
        navigationController?.pushViewController(mapSearchVC, animated: true)
    }
    
    @objc private func manualButtonTapped() {
        print("Manual location button tapped")
    }
}
