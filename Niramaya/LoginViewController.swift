//
//  LoginViewController.swift
//  Niramaya
//
//  Created by palak seth on 20/11/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    // Background Image
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background_image") // Replace with your background image
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // Back Button
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        button.tintColor = UIColor(hex: "#525C4D") // Arrow color
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // Logo
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "niramaya_logo") // Replace with your logo name
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // Username Container
    private let usernameContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.text = "Username"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = UIColor.darkGray
        stackView.addArrangedSubview(label)
        
        return stackView
    }()
    
    // Username Field
    private let usernameField: UITextField = {
        let textField = UITextField()
        textField.text = "sample1_00"
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 8
        textField.setLeftIcon(UIImage(systemName: "chevron.right")!)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    // Password Container
    private let passwordContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.text = "Password"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = UIColor.darkGray
        stackView.addArrangedSubview(label)
        
        return stackView
    }()
    
    // Password Field
    private let passwordField: UITextField = {
        let textField = UITextField()
        textField.text = "sample1_00"
        textField.isSecureTextEntry = true
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 8
        textField.setLeftIcon(UIImage(systemName: "chevron.right")!)
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
        button.backgroundColor = UIColor(hex: "#679400") // Green color
        button.layer.cornerRadius = 22 // Rounded corners
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
            value: UIColor(hex: "#0F3DDE"), // Blue color for "Sign Up"
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
        view.addSubview(usernameContainer)
        view.addSubview(usernameField)
        view.addSubview(passwordContainer)
        view.addSubview(passwordField)
        view.addSubview(forgotPasswordButton)
        view.addSubview(loginButton)
        view.addSubview(signUpLabel)
        
        setupConstraints()
        
        // Add tap gesture to Sign Up label
        let signUpTapGesture = UITapGestureRecognizer(target: self, action: #selector(navigateToSignup))
        signUpLabel.isUserInteractionEnabled = true
        signUpLabel.addGestureRecognizer(signUpTapGesture)
        
        // Add target for login button
        loginButton.addTarget(self, action: #selector(navigateToLocationPrompt), for: .touchUpInside)
    }
    
    @objc private func navigateToSignup() {
        let signupVC = SignupViewController() // Replace with your SignupViewController
        navigationController?.pushViewController(signupVC, animated: true)
    }
    
    @objc private func navigateToLocationPrompt() {
        
        let locationPromptVC = UINavigationController(rootViewController: LocationPromptViewController())
        
        if let window = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let keyWindow = window.windows.first {
            keyWindow.rootViewController = locationPromptVC
            keyWindow.makeKeyAndVisible()
        }
    }

    
    private func setupConstraints() {
        // Constraints for all UI elements
        NSLayoutConstraint.activate([
            // Background Image Constraints
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // Back Button Constraints
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            
            // Logo Constraints
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.widthAnchor.constraint(equalToConstant: 243),
            logoImageView.heightAnchor.constraint(equalToConstant: 159),
            
            // Username Container Constraints
            usernameContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            usernameContainer.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 30),
            usernameContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            // Username Field Constraints
            usernameField.leadingAnchor.constraint(equalTo: usernameContainer.leadingAnchor),
            usernameField.trailingAnchor.constraint(equalTo: usernameContainer.trailingAnchor),
            usernameField.topAnchor.constraint(equalTo: usernameContainer.bottomAnchor, constant: 5),
            usernameField.heightAnchor.constraint(equalToConstant: 50),
            
            // Password Container Constraints
            passwordContainer.leadingAnchor.constraint(equalTo: usernameContainer.leadingAnchor),
            passwordContainer.trailingAnchor.constraint(equalTo: usernameContainer.trailingAnchor),
            passwordContainer.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 20),
            
            // Password Field Constraints
            passwordField.leadingAnchor.constraint(equalTo: passwordContainer.leadingAnchor),
            passwordField.trailingAnchor.constraint(equalTo: passwordContainer.trailingAnchor),
            passwordField.topAnchor.constraint(equalTo: passwordContainer.bottomAnchor, constant: 5),
            passwordField.heightAnchor.constraint(equalToConstant: 50),
            
            // Forgot Password Button Constraints
            forgotPasswordButton.trailingAnchor.constraint(equalTo: passwordField.trailingAnchor),
            forgotPasswordButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 5),
            
            // Login Button Constraints
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 30),
            loginButton.widthAnchor.constraint(equalToConstant: 193),
            loginButton.heightAnchor.constraint(equalToConstant: 47),
            
            // Sign Up Label Constraints
            signUpLabel.leadingAnchor.constraint(equalTo: usernameField.leadingAnchor),
            signUpLabel.trailingAnchor.constraint(equalTo: usernameField.trailingAnchor),
            signUpLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}

extension UITextField {
    func setLeftIcon(_ icon: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        iconView.image = icon
        iconView.tintColor = UIColor.darkGray
        iconView.contentMode = .scaleAspectFit
        
        let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: self.frame.height))
        iconView.center = CGPoint(x: iconContainerView.bounds.midX, y: iconContainerView.bounds.midY)
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

