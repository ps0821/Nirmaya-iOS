//
//  HomeViewController.swift
//  Niramaya
//
//  Created by Yash's Mackbook on 20/11/24.
//
import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // MARK: - UI Components
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Profile") // Replace with actual image name
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
        let imageView = UIImageView()
        imageView.image = UIImage(named: "BillF") // Replace with actual image name
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search anything"
        searchBar.searchBarStyle = .minimal
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            textField.attributedPlaceholder = NSAttributedString(
                string: "Search anything",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
            )
            textField.textColor = .black
        }
        return searchBar
    }()
    
    private let bannerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = UIColor.systemGreen
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Banner1.png") // Replace with actual image name
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
        button.setTitleColor(UIColor.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
    @objc private func openServices() {
        let servicesVC = ServicesViewController()
        navigationController?.pushViewController(servicesVC, animated: true)
    }
    @objc private func openCategoriesScreen() {
        let categoriesVC = CategoriesViewController()
        navigationController?.pushViewController(categoriesVC, animated: true)
    }
    private var categoriesCollectionView: UICollectionView!
    private var servicesCollectionView: UICollectionView!
    
    // MARK: - Data
    private let categories = [("Neurologist", "Brain.png"), ("Cardiologist", "Heart.png"), ("Dermatologist", "dermatology.png"), ("Dentist", "teeth.png")]
    private let services = [("Locate & Book Cabs", "cabs.png"), ("Book Your First Appointment", "appointment.png"),("Locate & Book Cabs", "cabs.png"), ("Book Your First Appointment", "appointment.png")]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
        
    }
    
    // MARK: - Setup Methods
    private func setupViews() {
        // Configure collection view layouts
        let categoriesLayout = UICollectionViewFlowLayout()
        categoriesLayout.scrollDirection = .horizontal
        categoriesLayout.minimumLineSpacing = 15
        categoriesLayout.itemSize = CGSize(width: 80, height: 100)
        
        categoriesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: categoriesLayout)
        categoriesCollectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "CategoryCell")
        categoriesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.delegate = self
        
        let servicesLayout = UICollectionViewFlowLayout()
        servicesLayout.scrollDirection = .horizontal
        servicesLayout.minimumLineSpacing = 20
        servicesLayout.itemSize = CGSize(width: 165, height: 180)
        
        servicesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: servicesLayout)
        servicesCollectionView.register(ServiceCell.self, forCellWithReuseIdentifier: "ServiceCell")
        servicesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        servicesCollectionView.dataSource = self
        servicesCollectionView.delegate = self
        
        // Add subviews
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
        view.addSubview(categoriesCollectionView)
        view.addSubview(servicesLabel)
        view.addSubview(seeAllServicesButton)
        view.addSubview(servicesCollectionView)
        seeAllCategoriesButton.addTarget(self, action: #selector(openCategoriesScreen), for: .touchUpInside)

        seeAllServicesButton.addTarget(self, action: #selector(openServices), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            profileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            profileImageView.widthAnchor.constraint(equalToConstant: 50),
            profileImageView.heightAnchor.constraint(equalToConstant: 50),
            
            greetingLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10),
            greetingLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor),
            
            userNameLabel.leadingAnchor.constraint(equalTo: greetingLabel.leadingAnchor),
            userNameLabel.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 5),
            
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
            
            bannerLabel.leadingAnchor.constraint(equalTo: bannerView.leadingAnchor, constant: 16),
            bannerLabel.topAnchor.constraint(equalTo: bannerView.topAnchor, constant: 16),
            
            bookButton.trailingAnchor.constraint(equalTo: bannerView.trailingAnchor, constant: -16),
            bookButton.bottomAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: -16),
            bookButton.widthAnchor.constraint(equalToConstant: 150),
            bookButton.heightAnchor.constraint(equalToConstant: 36),
            
            categoriesLabel.topAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: 20),
            categoriesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            seeAllCategoriesButton.centerYAnchor.constraint(equalTo: categoriesLabel.centerYAnchor),
            seeAllCategoriesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            categoriesCollectionView.topAnchor.constraint(equalTo: categoriesLabel.bottomAnchor, constant: 10),
            categoriesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            categoriesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            categoriesCollectionView.heightAnchor.constraint(equalToConstant: 100),
            
            servicesLabel.topAnchor.constraint(equalTo: categoriesCollectionView.bottomAnchor, constant: 20),
            servicesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            seeAllServicesButton.centerYAnchor.constraint(equalTo: servicesLabel.centerYAnchor),
            seeAllServicesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            servicesCollectionView.topAnchor.constraint(equalTo: servicesLabel.bottomAnchor, constant: 0),
            servicesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            servicesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            servicesCollectionView.heightAnchor.constraint(equalToConstant: 200)
            
        ])
    }
    
    // MARK: - UICollectionView DataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoriesCollectionView {
            return categories.count
        } else {
            return services.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == servicesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceCell", for: indexPath) as! ServiceCell
            let service = services[indexPath.row]
            cell.configure(with: service.0, imageName: service.1, icon: "car.fill") // Pass the appropriate icon here
            return cell
        } else if collectionView == categoriesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            let category = categories[indexPath.row]
            cell.configure(with: category.0, imageName: category.1)
            return cell
        }
        
        // Default return statement to satisfy function
        return UICollectionViewCell()
    }
    
    // MARK: - Custom Cells
    class CategoryCell: UICollectionViewCell {
        private let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        private let label: UILabel = {
            let label = UILabel()
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 11, weight: .medium)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            contentView.addSubview(imageView)
            contentView.addSubview(label)
            
            contentView.layer.cornerRadius = 10
            
            NSLayoutConstraint.activate([
                imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
                imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                imageView.widthAnchor.constraint(equalToConstant: 65),
                imageView.heightAnchor.constraint(equalToConstant: 65),
                
                label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
                label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ])
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func configure(with title: String, imageName: String) {
            label.text = title
            imageView.image = UIImage(named: imageName)
        }
    }
    class ServiceCell: UICollectionViewCell {
        private let containerView: UIView = {
            let view = UIView()
            view.layer.cornerRadius = 10
            view.layer.shadowColor = UIColor.black.cgColor
            view.layer.shadowOpacity = 0.15
            view.layer.shadowOffset = CGSize(width: 0, height: 4)
            view.layer.shadowRadius = 6
            view.backgroundColor = .white
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        private let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 10
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        private let favoriteButton: UIButton = {
            let button = UIButton(type: .system)
            button.setImage(UIImage(systemName: "heart"), for: .normal)
            button.tintColor = UIColor.red
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        private let ratingLabel: UILabel = {
            let label = UILabel()
            label.text = "★★★★★" // Placeholder rating
            label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            label.textColor = UIColor.brown
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private let titleLabel: UILabel = {
            let label = UILabel()
            label.textAlignment = .left
            label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            label.textColor = .black
            label.numberOfLines = 2 // Ensure multiline
            label.lineBreakMode = .byTruncatingTail
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private let iconView: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor.systemGreen
            view.layer.cornerRadius = 20
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        private let iconImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(systemName: "car.fill") // Placeholder icon
            imageView.tintColor = .white
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            contentView.addSubview(containerView)
            containerView.addSubview(imageView)
            containerView.addSubview(favoriteButton)
            containerView.addSubview(ratingLabel)
            containerView.addSubview(titleLabel)
            containerView.addSubview(iconView)
            iconView.addSubview(iconImageView)
            
            setupConstraints()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setupConstraints() {
            NSLayoutConstraint.activate([
                // Container View
                containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
                containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                
                // Image View
                imageView.topAnchor.constraint(equalTo: containerView.topAnchor),
                imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
                imageView.heightAnchor.constraint(equalToConstant: 100),
                
                // Favorite Button
                favoriteButton.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 8),
                favoriteButton.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -8),
                favoriteButton.widthAnchor.constraint(equalToConstant: 24),
                favoriteButton.heightAnchor.constraint(equalToConstant: 24),
                
                // Rating Label
                ratingLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
                ratingLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
                ratingLabel.trailingAnchor.constraint(lessThanOrEqualTo: containerView.trailingAnchor, constant: -8),
                
                // Title Label
                titleLabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 4),
                titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
                titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
                
                // Icon View
                iconView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -60),
                iconView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
                iconView.widthAnchor.constraint(equalToConstant: 40),
                iconView.heightAnchor.constraint(equalToConstant: 40),
                
                // Icon Image View
                iconImageView.centerXAnchor.constraint(equalTo: iconView.centerXAnchor),
                iconImageView.centerYAnchor.constraint(equalTo: iconView.centerYAnchor),
                iconImageView.widthAnchor.constraint(equalToConstant: 24),
                iconImageView.heightAnchor.constraint(equalToConstant: 24)
            ])
        }
        
        // Configure the cell
        func configure(with title: String, imageName: String, icon: String) {
            titleLabel.text = title
            imageView.image = UIImage(named: imageName)
            iconImageView.image = UIImage(systemName: icon) // Use systemName or asset
        }
    }
}
#Preview{
    TabBarController()
}
