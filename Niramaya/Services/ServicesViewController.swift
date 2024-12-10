//
//  ServicesViewController.swift
//  Niramaya
//
//  Created by Yash's Mackbook on 09/12/24.
//

import UIKit

class ServicesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private let services = [
        ("Locate & Book Cabs", "cabs.png", "car.fill"),
        ("Book An Appointment", "appointment.png", "person.fill"),
        ("Locate & Book Cabs", "cabs.png", "car.fill")
    ]
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        customizeNavigationTitle()

    }
    private func customizeNavigationTitle() {
          // Modern way using UINavigationBarAppearance (iOS 13+)
          let appearance = UINavigationBarAppearance()
          appearance.configureWithOpaqueBackground()
          appearance.titleTextAttributes = [
              .font: UIFont.systemFont(ofSize: 24, weight: .bold), // Customize font size and weight
              // Customize color
          ]
          appearance.backgroundColor = .white

          navigationController?.navigationBar.standardAppearance = appearance
          navigationController?.navigationBar.scrollEdgeAppearance = appearance
          
          // Set the title
          navigationItem.title = "Services"
      }
    private func setupUI() {
        view.backgroundColor = UIColor.systemGroupedBackground

        // Navigation bar setup
        navigationItem.title = "Services"
        navigationController?.navigationBar.prefersLargeTitles = false
        
        // Setup collection view
        collectionView.backgroundColor = .clear
        collectionView.register(ServiceCell.self, forCellWithReuseIdentifier: "ServiceCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        
        // Layout
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return services.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceCell", for: indexPath) as! ServiceCell
        let service = services[indexPath.row]
        cell.configure(with: service.0, imageName: service.1, icon: service.2)
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 32, height: 250)
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
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = UIColor.brown
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
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
            imageView.heightAnchor.constraint(equalToConstant: 160),

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
            iconView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -70),
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

    func configure(with title: String, imageName: String, icon: String) {
        titleLabel.text = title
        imageView.image = UIImage(named: imageName)
        iconImageView.image = UIImage(systemName: icon)
    }
}
#Preview{
    ServicesViewController()
}
