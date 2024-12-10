//
//  Page2ViewController.swift
//  Niramaya
//
//  Created by Yash's Mackbook on 07/12/24.
//
import UIKit

class OptionsPageViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the background color
        view.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 250/255, alpha: 1) // Light gray

        // Create the white rounded container
        let container = UIView()
        container.backgroundColor = .white
        container.layer.cornerRadius = 20
        container.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(container)

        // Title Label
        let titleLabel = UILabel()
        titleLabel.text = "What are you looking for?"
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.black

        // Create option buttons
        let options = ["Flights", "Hospitals", "Doctors", "Cabs"]
        var buttons: [UIButton] = []
        for option in options {
            let button = UIButton(type: .system)
            button.setTitle(option, for: .normal)
            button.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 18)
            button.backgroundColor = .white
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.lightGray.cgColor
            button.layer.cornerRadius = 10
            button.setTitleColor(.black, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            buttons.append(button)
            container.addSubview(button)
        }

        // Add subviews
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(titleLabel)

        // Add constraints for the container and subviews
        NSLayoutConstraint.activate([
            // Container constraints
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            container.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            container.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),

            // Title constraints
            titleLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20)
        ])

        for (index, button) in buttons.enumerated() {
            NSLayoutConstraint.activate([
                button.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 30),
                button.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -30),
                button.heightAnchor.constraint(equalToConstant: 50)
            ])
            if index == 0 {
                button.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
            } else {
                button.topAnchor.constraint(equalTo: buttons[index - 1].bottomAnchor, constant: 15).isActive = true
            }
        }
    }
}
