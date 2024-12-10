//
//  Page3ViewController.swift
//  Niramaya
//
//  Created by Yash's Mackbook on 07/12/24.
//

import UIKit

class WellbeingPageViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 250/255, alpha: 1)

        let backgroundBox = UIView()
        backgroundBox.backgroundColor = .white
        backgroundBox.layer.cornerRadius = 20
        backgroundBox.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundBox)

        let titleLabel = UILabel()
        titleLabel.text = "Unlock effortless wellbeing"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.textAlignment = .center

        let subtitleLabel = UILabel()
        subtitleLabel.text = "Experience expert care, hassle-free logistics, and a healthier future."
        subtitleLabel.font = UIFont.systemFont(ofSize: 16)
        subtitleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 0

        let imageView = UIImageView(image: UIImage(named: "wellbeing"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false

        [imageView, titleLabel, subtitleLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            backgroundBox.addSubview($0)
        }

        NSLayoutConstraint.activate([
            backgroundBox.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backgroundBox.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            backgroundBox.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            backgroundBox.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),

            imageView.topAnchor.constraint(equalTo: backgroundBox.topAnchor, constant: 30),
            imageView.centerXAnchor.constraint(equalTo: backgroundBox.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 150),
            imageView.heightAnchor.constraint(equalToConstant: 150),

            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: backgroundBox.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: backgroundBox.trailingAnchor, constant: -20),

            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            subtitleLabel.leadingAnchor.constraint(equalTo: backgroundBox.leadingAnchor, constant: 20),
            subtitleLabel.trailingAnchor.constraint(equalTo: backgroundBox.trailingAnchor, constant: -20)
        ])
    }
}
