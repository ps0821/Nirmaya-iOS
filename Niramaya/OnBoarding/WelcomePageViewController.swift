//
//  WelcomePageViewController.swift
//  Niramaya
//
//  Created by Yash's Mackbook on 11/12/24.
//
import UIKit

class WelcomePageViewController: UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo") // Replace with your image name
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to"
        label.font = UIFont.boldSystemFont(ofSize: 48)
//        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let titleLabel2: UILabel = {
        let label = UILabel()
        label.text = "Niramaya"
        label.font = UIFont.boldSystemFont(ofSize: 48)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Step into a world where wellness meets convenience."
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .clear

        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(titleLabel2)
        view.addSubview(descriptionLabel)

        NSLayoutConstraint.activate([
//            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
//            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
//            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),

            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageView.heightAnchor.constraint(equalToConstant: 60),
            imageView.widthAnchor.constraint(equalToConstant: 60),
            titleLabel2.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            titleLabel2.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20),

            descriptionLabel.topAnchor.constraint(equalTo: titleLabel2.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}


#Preview{
    OnboardingContainerViewController()
}
