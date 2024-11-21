//
//  HomeViewController.swift
//  Niramaya
//
//  Created by Yash's Mackbook on 20/11/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Profile") // Replace with actual profile image name
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let greetingLabel: UILabel = {
        let label = UILabel()
        label.text = "Hi,"
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Person One"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let notificationButton: UIImageView = {
        let button = UIImageView()
      button.image = UIImage(named: "BillF") // Replace with actual profile image name
        
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
        
    }()
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search anything"
        searchBar.searchBarStyle = .minimal
        searchBar.translatesAutoresizingMaskIntoConstraints = false

        // Customize the text field inside the search bar
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            // Change the placeholder text color to black
            textField.attributedPlaceholder = NSAttributedString(
                string: "Search anything",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
            )
            
            // Change the text color of the search field itself to black
            textField.textColor = .black
        }

        // Customize the search icon color
        if let glassIconView = searchBar.value(forKey: "searchField") as? UITextField,
           let iconView = glassIconView.leftView as? UIImageView {
            iconView.image = iconView.image?.withRenderingMode(.alwaysTemplate) // Use a template for coloring
            iconView.tintColor = .black // Set the desired color for the icon
        }
        
        return searchBar
    }()



    
    private let bannerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = UIColor.systemGreen // Placeholder, add image background programmatically
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Banner1.png") // Replace with actual banner image
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let bannerLabel: UILabel = {
        let label = UILabel()
        label.text = "Looking for\ndesired doctor?"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.numberOfLines = 2
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bookButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Book an appointment", for: .normal)
        button.setTitleColor(.black, for: .normal)

        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let categoriesLabel: UILabel = {
        let label = UILabel()
        label.text = "Categories"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let seeAllCategoriesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("See All >", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        button.setTitleColor(UIColor(hex: "5C634C"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let categoriesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let servicesLabel: UILabel = {
        let label = UILabel()
        label.text = "Services"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let seeAllServicesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("See All >", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        button.setTitleColor(.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let servicesPlaceholderView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemGray5
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(profileImageView)
        view.addSubview(greetingLabel)
        view.addSubview(userNameLabel)
        view.addSubview(notificationButton)
        view.addSubview(searchBar)
        view.addSubview(bannerView)
        bannerView.addSubview(bannerImageView)
        bannerView.addSubview(bannerLabel)
        bannerView.addSubview(bookButton)
        view.addSubview(categoriesLabel)
        view.addSubview(seeAllCategoriesButton)
        view.addSubview(categoriesStackView)
        view.addSubview(servicesLabel)
        view.addSubview(seeAllServicesButton)
        view.addSubview(servicesPlaceholderView)
        
        setupConstraints()
        addCategories()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            profileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            profileImageView.widthAnchor.constraint(equalToConstant: 70),
            profileImageView.heightAnchor.constraint(equalToConstant: 70),
            
            greetingLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 12),
            greetingLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor, constant: 12),
            
            userNameLabel.leadingAnchor.constraint(equalTo: greetingLabel.leadingAnchor),
            userNameLabel.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 4),
            
            notificationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            notificationButton.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            notificationButton.widthAnchor.constraint(equalToConstant: 60),
            notificationButton.heightAnchor.constraint(equalToConstant: 60),
            
            searchBar.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            bannerView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 20),
            bannerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            bannerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            bannerView.heightAnchor.constraint(equalToConstant: 120),
            
            bannerImageView.topAnchor.constraint(equalTo: bannerView.topAnchor),
            bannerImageView.leadingAnchor.constraint(equalTo: bannerView.leadingAnchor),
            bannerImageView.trailingAnchor.constraint(equalTo: bannerView.trailingAnchor),
            bannerImageView.bottomAnchor.constraint(equalTo: bannerView.bottomAnchor),
            
            bannerLabel.leadingAnchor.constraint(equalTo: bannerView.trailingAnchor, constant: -155),
            bannerLabel.topAnchor.constraint(equalTo: bannerView.topAnchor, constant: 16),
            
            bookButton.trailingAnchor.constraint(equalTo: bannerView.trailingAnchor, constant: -16),
            bookButton.bottomAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: -16),
            bookButton.widthAnchor.constraint(equalToConstant: 150),
            bookButton.heightAnchor.constraint(equalToConstant: 36),
            
            categoriesLabel.topAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: 20),
            categoriesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            seeAllCategoriesButton.centerYAnchor.constraint(equalTo: categoriesLabel.centerYAnchor),
            seeAllCategoriesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            categoriesStackView.topAnchor.constraint(equalTo: categoriesLabel.bottomAnchor, constant: 10),
            categoriesStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            categoriesStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            categoriesStackView.heightAnchor.constraint(equalToConstant: 80),
            
            servicesLabel.topAnchor.constraint(equalTo: categoriesStackView.bottomAnchor, constant: 20),
            servicesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            seeAllServicesButton.centerYAnchor.constraint(equalTo: servicesLabel.centerYAnchor),
            seeAllServicesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            servicesPlaceholderView.topAnchor.constraint(equalTo: servicesLabel.bottomAnchor, constant: 10),
            servicesPlaceholderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            servicesPlaceholderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            servicesPlaceholderView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func addCategories() {
        let categories = ["Neurologist", "Cardiologist", "Dermatologist", "Dentist"]
        let customIcons = ["Brain.png", "Heart.pmg", "dermatology.png", "teeth.png"] // Replace these with your image names in Assets
        
        for (index, category) in categories.enumerated() {
            let categoryView = createCategoryView(imageName: customIcons[index], title: category)
            categoriesStackView.addArrangedSubview(categoryView)
        }
    }

    
    private func createCategoryView(imageName: String, title: String) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hex: "EAECE2")
        view.layer.cornerRadius = 10
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName) // Load custom image from Assets
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.text = title
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageView)
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 40), // Adjust size as needed
            imageView.heightAnchor.constraint(equalToConstant: 40),
            
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        return view
    }
}
