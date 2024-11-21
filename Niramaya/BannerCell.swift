//
//  BannerCell.swift
//  Niramaya
//
//  Created by Yash's Mackbook on 21/11/24.
//
import UIKit

class BannerCell: UITableViewCell {
    
    private let bannerBackgroundImageView = UIImageView()
    private let bannerTextStack = UIStackView()
    private let bannerTitle = UILabel()
    private let bannerButton = UIButton(type: .system)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        // Banner Background Image
        bannerBackgroundImageView.image = UIImage(named: "banner_bg") // Replace with your image
        bannerBackgroundImageView.contentMode = .scaleAspectFill
        bannerBackgroundImageView.clipsToBounds = true
        bannerBackgroundImageView.layer.cornerRadius = 16
        bannerBackgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(bannerBackgroundImageView)
        
        // Text Stack View
        bannerTextStack.axis = .vertical
        bannerTextStack.alignment = .leading
        bannerTextStack.spacing = 8
        bannerTextStack.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(bannerTextStack)
        
        // Banner Title
        bannerTitle.text = "Looking for desired doctor?"
        bannerTitle.font = UIFont.boldSystemFont(ofSize: 16)
        bannerTitle.textColor = .white
        bannerTitle.numberOfLines = 0
        bannerTextStack.addArrangedSubview(bannerTitle)
        
        // Banner Button
        bannerButton.setTitle("Book an appointment", for: .normal)
        bannerButton.backgroundColor = .white
        bannerButton.setTitleColor(.systemGreen, for: .normal)
        bannerButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        bannerButton.layer.cornerRadius = 8
        bannerButton.translatesAutoresizingMaskIntoConstraints = false
        bannerTextStack.addArrangedSubview(bannerButton)
        
        // Constraints
        NSLayoutConstraint.activate([
            // Banner Background Image
            bannerBackgroundImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            bannerBackgroundImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            bannerBackgroundImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            bannerBackgroundImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            bannerBackgroundImageView.heightAnchor.constraint(equalToConstant: 150),
            
            // Text Stack
            bannerTextStack.leadingAnchor.constraint(equalTo: bannerBackgroundImageView.leadingAnchor, constant: 16),
            bannerTextStack.trailingAnchor.constraint(equalTo: bannerBackgroundImageView.trailingAnchor, constant: -16),
            bannerTextStack.centerYAnchor.constraint(equalTo: bannerBackgroundImageView.centerYAnchor, constant: 0),
            
            // Banner Button
            bannerButton.heightAnchor.constraint(equalToConstant: 36),
            bannerButton.widthAnchor.constraint(equalToConstant: 160)
        ])
    }
}

