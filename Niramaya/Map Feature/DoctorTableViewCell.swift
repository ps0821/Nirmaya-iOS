//
//  DoctorCell.swift
//  Niramaya
//
//  Created by Yash's Mackbook on 10/12/24.
//
import UIKit

class DoctorTableViewCell: UITableViewCell {

    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 35
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "doctor_placeholder") // Placeholder image
        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let distanceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let bookButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Book Now", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 103 / 255, green: 148 / 255, blue: 0 / 255, alpha: 1.0)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let DirectionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Get Direction", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.gray
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let ContactButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Contact the place", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.gray
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    func configure(name: String, category: String, phone: String, distance: Double) {
        let maxNameLength = 16 // Maximum number of characters allowed for the name
//            let truncatedName = name.count > maxNameLength ? String(name.prefix(maxNameLength)) + "..." : name
        nameLabel.text = name.count > maxNameLength ? String(name.prefix(maxNameLength)) + "..." : name
        categoryLabel.text = "Category: \(category.prefix(13))"
        phoneLabel.text = "Phone: \(phone)"
        distanceLabel.text = "Distance: \(String(format: "%.2f", distance)) km"
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        contentView.addSubview(profileImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(categoryLabel)
        contentView.addSubview(phoneLabel)
        contentView.addSubview(distanceLabel)
        contentView.addSubview(bookButton)
        contentView.addSubview(DirectionButton)
        contentView.addSubview(ContactButton)

        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            profileImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            profileImageView.widthAnchor.constraint(equalToConstant: 70),
            profileImageView.heightAnchor.constraint(equalToConstant: 70),

            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),

            categoryLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            categoryLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),

            phoneLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 4),
            phoneLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),

            distanceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            distanceLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),

            bookButton.topAnchor.constraint(equalTo: distanceLabel.bottomAnchor, constant: 16),
            bookButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            bookButton.widthAnchor.constraint(equalToConstant: 100),
            bookButton.heightAnchor.constraint(equalToConstant: 36),
            
            DirectionButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            DirectionButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 80),
            DirectionButton.widthAnchor.constraint(equalToConstant: 130),
            
            ContactButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            ContactButton.leadingAnchor.constraint(equalTo: DirectionButton.trailingAnchor, constant: 20),
            ContactButton.widthAnchor.constraint(equalToConstant: 140),
        ])
    }
}

#Preview{
    MapWithDoctorsViewController()
}
