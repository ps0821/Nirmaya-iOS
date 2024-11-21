//
//  SignupViewController.swift
//  Niramaya
//
//  Created by palak seth on 21/11/24.
//
import UIKit

class SignupViewController: UIViewController {
    
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
        button.tintColor = UIColor(hexString: "#525C4D")
        button.addTarget(self, action: #selector(navigateToLogin), for: .touchUpInside)
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
    
    // Labels
    private let nameLabel: UILabel = createFieldLabel(text: "Name")
    private let emailLabel: UILabel = createFieldLabel(text: "Email address")
    private let passwordLabel: UILabel = createFieldLabel(text: "Password")
    
    // Fields
    private let nameField: UITextField = createTextField(placeholder: "Enter your name")
    private let emailField: UITextField = createTextField(placeholder: "Enter your email")
    private let passwordField: UITextField = {
        let textField = createTextField(placeholder: "Enter your password")
        textField.isSecureTextEntry = true
        return textField
    }()
    
    // Terms Checkbox
    private let termsCheckbox: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "square"), for: .normal)
        button.addTarget(self, action: #selector(toggleTermsCheckbox), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let termsLabel: UILabel = {
        let label = UILabel()
        let text = "I agree to the terms & policy"
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.foregroundColor, value: UIColor(hexString: "#0C2A92"), range: NSRange(location: 11, length: 12))
        label.attributedText = attributedString
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Sign-Up Button
    private let signupButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Signup", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(hexString: "#679400")
        button.layer.cornerRadius = 22
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(navigateToLocationPrompt), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // Sign-In Link
    private let signInLabel: UILabel = {
        let label = UILabel()
        let text = "Have an account? Sign In"
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.foregroundColor, value: UIColor(hexString: "#0F3DDE"), range: NSRange(location: 17, length: 7))
        label.attributedText = attributedString
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        // Hide the default back button
        navigationItem.setHidesBackButton(true, animated: false)
        
        // Add Subviews
        view.addSubview(backgroundImageView)
        view.addSubview(backButton)
        view.addSubview(logoImageView)
        view.addSubview(nameLabel)
        view.addSubview(nameField)
        view.addSubview(emailLabel)
        view.addSubview(emailField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordField)
        view.addSubview(termsCheckbox)
        view.addSubview(termsLabel)
        view.addSubview(signupButton)
        view.addSubview(signInLabel)
        
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
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            logoImageView.heightAnchor.constraint(equalToConstant: 159)
        ])
        
        // Name Field Constraints
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            nameLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            
            nameField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            nameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            nameField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            nameField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Email Field Constraints
        NSLayoutConstraint.activate([
            emailLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            emailLabel.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 15),
            
            emailField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            emailField.trailingAnchor.constraint(equalTo: nameField.trailingAnchor),
            emailField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 5),
            emailField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Password Field Constraints
        NSLayoutConstraint.activate([
            passwordLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            passwordLabel.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 15),
            
            passwordField.leadingAnchor.constraint(equalTo: passwordLabel.leadingAnchor),
            passwordField.trailingAnchor.constraint(equalTo: nameField.trailingAnchor),
            passwordField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5),
            passwordField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Terms Checkbox
        NSLayoutConstraint.activate([
            termsCheckbox.leadingAnchor.constraint(equalTo: passwordField.leadingAnchor),
            termsCheckbox.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 15),
            termsCheckbox.widthAnchor.constraint(equalToConstant: 20),
            termsCheckbox.heightAnchor.constraint(equalToConstant: 20),
            
            termsLabel.leadingAnchor.constraint(equalTo: termsCheckbox.trailingAnchor, constant: 10),
            termsLabel.centerYAnchor.constraint(equalTo: termsCheckbox.centerYAnchor)
        ])
        
        // Signup Button
        NSLayoutConstraint.activate([
            signupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signupButton.topAnchor.constraint(equalTo: termsCheckbox.bottomAnchor, constant: 20),
            signupButton.widthAnchor.constraint(equalToConstant: 193),
            signupButton.heightAnchor.constraint(equalToConstant: 47)
        ])
        
        // Sign-In Label Constraints
        NSLayoutConstraint.activate([
            signInLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInLabel.topAnchor.constraint(equalTo: signupButton.bottomAnchor, constant: 40)
        ])
    }
    
    @objc private func navigateToLogin() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func navigateToLocationPrompt() {
        let locationPromptVC = UINavigationController(rootViewController: LocationPromptViewController())
        
        if let window = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let keyWindow = window.windows.first {
            keyWindow.rootViewController = locationPromptVC
            keyWindow.makeKeyAndVisible()
        }
    }
    
    @objc private func toggleTermsCheckbox() {
        if termsCheckbox.currentImage == UIImage(systemName: "square") {
            termsCheckbox.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        } else {
            termsCheckbox.setImage(UIImage(systemName: "square"), for: .normal)
        }
    }
    
    // Helper to Create Labels
    private static func createFieldLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    // Helper to Create Text Fields
    private static func createTextField(placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }
}

extension UIColor {
    convenience init(hexString: String) {
        let hexString = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if hexString.hasPrefix("#") { scanner.currentIndex = scanner.string.index(after: scanner.currentIndex) }
        var color: UInt64 = 0
        scanner.scanHexInt64(&color)
        let r = CGFloat((color & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((color & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(color & 0x0000FF) / 255.0
        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
}
