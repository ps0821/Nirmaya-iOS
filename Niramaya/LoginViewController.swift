//
//  ViewController.swift
//  Niramaya
//
//  Created by palak seth on 20/11/24.
//

import UIKit

class LoginViewController: UIViewController {

    // Background Image
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background_image") 
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // Back Button
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        button.tintColor = UIColor(hex: "#525C4D")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // Logo
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "niramaya_logo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // Username Label
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Username"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = UIColor.darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // Username Field with Left Arrow
    private let usernameField: UITextField = {
        let textField = UITextField()
        textField.placeholder = ""
        textField.text = "sample1_00"
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.layer.borderColor = UIColor.darkGray.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 8
        textField.setLeftIcon(UIImage(systemName: "arrow.right")!)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    // Password Label
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = UIColor.darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // Password Field with Left Arrow
    private let passwordField: UITextField = {
        let textField = UITextField()
        textField.placeholder = ""
        textField.text = "sample1_00"
        textField.isSecureTextEntry = true
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.layer.borderColor = UIColor.darkGray.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 8
        textField.setLeftIcon(UIImage(systemName: "arrow.right")!)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    // Forgot Password Button
    private let forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgot Password", for: .normal)
        button.setTitleColor(UIColor(hex: "#0C2A92"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // Login Button
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(hex: "#679400")
        button.layer.cornerRadius = 25 // Rounded button
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // Sign Up Label
    private let signUpLabel: UILabel = {
        let label = UILabel()
        let text = "Don't have an account? Sign Up"
        let attributedString = NSMutableAttributedString(string: text)

        attributedString.addAttribute(
            .foregroundColor,
            value: UIColor(hex: "#0F3DDE"),
            range: NSRange(location: 23, length: 7)
        )
        
        attributedString.addAttribute(
            .foregroundColor,
            value: UIColor.darkGray,
            range: NSRange(location: 0, length: 23)
        )

        label.attributedText = attributedString
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBackground

        // Add Subviews
        view.addSubview(backgroundImageView)
        view.addSubview(backButton)
        view.addSubview(logoImageView)
        view.addSubview(usernameLabel)
        view.addSubview(usernameField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordField)
        view.addSubview(forgotPasswordButton)
        view.addSubview(loginButton)
        view.addSubview(signUpLabel)

        setupConstraints()
    }

    private func setupConstraints() {
        // Background Image Constraints
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        // Back Button Constraints
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
        ])

        // Logo Constraints
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 20),
            logoImageView.widthAnchor.constraint(equalToConstant: 180),
            logoImageView.heightAnchor.constraint(equalToConstant: 100)
        ])

        // Username Label Constraints
        NSLayoutConstraint.activate([
            usernameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            usernameLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 30)
        ])

        // Username Field Constraints
        NSLayoutConstraint.activate([
            usernameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            usernameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            usernameField.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 5),
            usernameField.heightAnchor.constraint(equalToConstant: 50)
        ])

        // Password Label Constraints
        NSLayoutConstraint.activate([
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordLabel.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 20)
        ])

        // Password Field Constraints
        NSLayoutConstraint.activate([
            passwordField.leadingAnchor.constraint(equalTo: usernameField.leadingAnchor),
            passwordField.trailingAnchor.constraint(equalTo: usernameField.trailingAnchor),
            passwordField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5),
            passwordField.heightAnchor.constraint(equalToConstant: 50)
        ])

        // Forgot Password Button Constraints
        NSLayoutConstraint.activate([
            forgotPasswordButton.trailingAnchor.constraint(equalTo: passwordField.trailingAnchor),
            forgotPasswordButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 5)
        ])

        // Login Button Constraints
        NSLayoutConstraint.activate([
            loginButton.leadingAnchor.constraint(equalTo: usernameField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: usernameField.trailingAnchor),
            loginButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 30),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])

        // Sign Up Label Constraints
        NSLayoutConstraint.activate([
            signUpLabel.leadingAnchor.constraint(equalTo: usernameField.leadingAnchor),
            signUpLabel.trailingAnchor.constraint(equalTo: usernameField.trailingAnchor),
            signUpLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}

extension UITextField {
    func setLeftPadding(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }

    func setLeftIcon(_ icon: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 10, y: 0, width: 20, height: 20))
        iconView.image = icon
        let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
}

extension UIColor {
    convenience init(hex: String) {
        let hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if hex.hasPrefix("#") { scanner.currentIndex = scanner.string.index(after: scanner.currentIndex) }
        var color: UInt64 = 0
        scanner.scanHexInt64(&color)
        let r = CGFloat((color & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((color & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(color & 0x0000FF) / 255.0
        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
}
