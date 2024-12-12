//
//  FinalPageViewController.swift
//  Niramaya
//
//  Created by Yash's Mackbook on 11/12/24.
//

import UIKit

class FinalPageViewController: UIViewController {

    private let illustrationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "calendarImage") // Replace with your image name
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Kickstart Your Journey with Us"
        label.font = UIFont.systemFont(ofSize: 26)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let Label1: UILabel = {
        let label = UILabel()
        label.text = "New to Niramaya?"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let Label2: UILabel = {
        let label = UILabel()
        label.text = "Already a user?"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let joinNowButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Join Now", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapJoinNow), for: .touchUpInside)
                
        return button
    }()

    private let signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .clear

        view.addSubview(illustrationImageView)
        view.addSubview(titleLabel)
        view.addSubview(joinNowButton)
        view.addSubview(signInButton)
        view.addSubview(Label1)
        view.addSubview(Label2)

        NSLayoutConstraint.activate([
            illustrationImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            illustrationImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            illustrationImageView.widthAnchor.constraint(equalToConstant: 230),
            illustrationImageView.heightAnchor.constraint(equalToConstant: 230),

            titleLabel.topAnchor.constraint(equalTo: illustrationImageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            Label1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            Label1.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            Label2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            Label2.topAnchor.constraint(equalTo: Label1.bottomAnchor, constant: 24),

            joinNowButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            joinNowButton.leadingAnchor.constraint(equalTo: Label1.trailingAnchor, constant: 4),

            signInButton.topAnchor.constraint(equalTo: Label1.bottomAnchor, constant: 20),
            signInButton.leadingAnchor.constraint(equalTo: Label2.trailingAnchor, constant: 4),
        ])
    }
    @objc private func didTapJoinNow() {
            let signupVC = SignupViewController() // Replace with your SignupViewController
            navigationController?.pushViewController(signupVC, animated: true)
        }

        @objc private func didTapSignIn() {
            let loginVC = LoginViewController() // Replace with your LoginViewController
            navigationController?.pushViewController(loginVC, animated: true)
        }
}

#Preview{
    OnboardingContainerViewController()
}
