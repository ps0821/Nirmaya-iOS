//
//  Page1ViewController.swift
//  Niramaya
//
//  Created by Yash's Mackbook on 07/12/24.
//
import UIKit

class WelcomePageViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the background color to light gray
        view.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 250/255, alpha: 1) // Light gray

        // Create a white rounded container
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 30 // Rounded corners
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)

        // Create the logo image
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "Logo") // Replace "logo" with your actual logo name
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(logoImageView)

        // Create the title label
        let titleLabel = UILabel()
        titleLabel.text = "Welcome to Niramaya"
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 28)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(titleLabel)

        // Create the subtitle label
        let subtitleLabel = UILabel()
        subtitleLabel.text = "Step into a world where wellness meets convenience."
        subtitleLabel.font = UIFont(name: "HelveticaNeue", size: 16)
        subtitleLabel.textColor = .gray
        subtitleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 0
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(subtitleLabel)

        // Create the page control
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 4
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = UIColor(red: 0.6, green: 0.8, blue: 0.5, alpha: 1) // Green dot
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(pageControl)

        // Create the next button
        let nextButton = UIButton(type: .system)
        nextButton.backgroundColor = UIColor(red: 0.6, green: 0.8, blue: 0.5, alpha: 1) // Green background
        nextButton.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        nextButton.tintColor = .white
        nextButton.layer.cornerRadius = 30
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        containerView.addSubview(nextButton)

        // Set up constraints
        NSLayoutConstraint.activate([
            // Container view
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),

            // Logo image
            logoImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 40),
            logoImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 80),
            logoImageView.widthAnchor.constraint(equalToConstant: 80),

            // Title label
            titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),

            // Subtitle label
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            subtitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            subtitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),

            // Page control
            pageControl.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 30),
            pageControl.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),

            // Next button
            nextButton.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 20),
            nextButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 60),
            nextButton.heightAnchor.constraint(equalToConstant: 60),
            nextButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20)
        ])
    }

    @objc func nextButtonTapped() {
        // Navigate to the next page
        print("Next button tapped")
    }
}
