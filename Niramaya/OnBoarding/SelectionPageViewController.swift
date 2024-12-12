//
//  SelectionPageViewController.swift
//  Niramaya
//
//  Created by Yash's Mackbook on 11/12/24.
//
import UIKit

class SelectionPageViewController: UIViewController {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Let's take the first step together"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let questionLabel: UILabel = {
        let label = UILabel()
        label.text = "What are you looking for?"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 40
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let options = ["Flights", "Hospitals", "Doctors", "Cabs"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupOptions()
    }

    private func setupUI() {
        view.backgroundColor = .clear

        view.addSubview(titleLabel)
        view.addSubview(questionLabel)
        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            questionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            stackView.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }

    private func setupOptions() {
        for option in options {
            let button = UIButton(type: .system)
            button.setTitle(option, for: .normal)
            button.setTitleColor(.darkGray, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
            
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.lightGray.cgColor
            button.layer.cornerRadius = 20
            button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
            stackView.addArrangedSubview(button)
        }
    }
}
#Preview{
    OnboardingContainerViewController()
}
