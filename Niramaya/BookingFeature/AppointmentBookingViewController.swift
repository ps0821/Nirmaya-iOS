

//
//  AppointmentBookingViewController.swift
//  Niramaya
//
//  Created by palak seth on 11/12/24.
//

import UIKit

class AppointmentBookingViewController: UIViewController {

    // UI Elements
    private let backButton = UIButton()
    private let searchButton = UIButton()
    private let profileImageView = UIImageView()
    private let nameLabel = UILabel()
    private let specialtyLabel = UILabel()
    private let experienceLabel = UILabel()
    private let ratingLabel = UILabel()
    private let appointmentTitleLabel = UILabel()
    private let calendarImageView = UIImageView() // Using UIImageView for the calendar
    private let timeSelectionTitleLabel = UILabel()
    private let timeSelectionStackView = UIStackView()
    private let slotsTitleLabel = UILabel()
    private let slotsStackView = UIStackView()
    private let confirmButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    private func setupUI() {
        setupHeader()
        setupProfileSection()
        setupAppointmentSection()
        setupTimeSelectionSection()
        setupSlotsSection()
        setupConfirmButton()
    }

    private func setupHeader() {
        backButton.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        backButton.tintColor = .black
        backButton.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)

        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.tintColor = .black

        view.addSubview(backButton)
        view.addSubview(searchButton)

        backButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backButton.widthAnchor.constraint(equalToConstant: 36),
            backButton.heightAnchor.constraint(equalToConstant: 36),

            searchButton.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            searchButton.widthAnchor.constraint(equalToConstant: 36),
            searchButton.heightAnchor.constraint(equalToConstant: 36)
        ])
    }

    private func setupProfileSection() {
        profileImageView.layer.cornerRadius = 50
        profileImageView.clipsToBounds = true
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.image = UIImage(named: "profile_image")

        nameLabel.text = "Dr. Abcde Fghi"
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)

        specialtyLabel.text = "Cardiologist/Therapy"
        specialtyLabel.font = UIFont.italicSystemFont(ofSize: 16)
        specialtyLabel.textColor = .black

        experienceLabel.text = "30+ Years of experience in Cardiovascular surgery"
        experienceLabel.font = UIFont.systemFont(ofSize: 14)
        experienceLabel.textColor = .gray
        experienceLabel.numberOfLines = 0 // Allow multiple lines
        experienceLabel.lineBreakMode = .byWordWrapping // Wrap words properly

        ratingLabel.text = "⭐️⭐️⭐️⭐️⭐️ [150+]"
        ratingLabel.font = UIFont.systemFont(ofSize: 14)
        ratingLabel.textColor = .gray

        view.addSubview(profileImageView)
        view.addSubview(nameLabel)
        view.addSubview(specialtyLabel)
        view.addSubview(experienceLabel)
        view.addSubview(ratingLabel)

        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        specialtyLabel.translatesAutoresizingMaskIntoConstraints = false
        experienceLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 16),
            profileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            profileImageView.heightAnchor.constraint(equalToConstant: 100),

            nameLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            specialtyLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            specialtyLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            specialtyLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),

            experienceLabel.topAnchor.constraint(equalTo: specialtyLabel.bottomAnchor, constant: 4),
            experienceLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            experienceLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),

            ratingLabel.topAnchor.constraint(equalTo: experienceLabel.bottomAnchor, constant: 4),
            ratingLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor)
        ])
    }


    private func setupAppointmentSection() {
        appointmentTitleLabel.text = "Make an Appointment:"
        appointmentTitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)

        calendarImageView.image = UIImage(named: "Calendar") // Replace with your calendar image name
        calendarImageView.contentMode = .scaleAspectFit
        calendarImageView.layer.cornerRadius = 8
        calendarImageView.clipsToBounds = true

        view.addSubview(appointmentTitleLabel)
        view.addSubview(calendarImageView)

        appointmentTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        calendarImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            appointmentTitleLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16),
            appointmentTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),

            calendarImageView.topAnchor.constraint(equalTo: appointmentTitleLabel.bottomAnchor, constant: 8),
            calendarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            calendarImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            calendarImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }

    private var timeButtons: [UIButton] = [] // Array to store buttons for toggling

    private func setupTimeSelectionSection() {
        timeSelectionTitleLabel.text = "Choose Time:"
        timeSelectionTitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)

        let timePeriods = ["Morning", "Afternoon", "Evening"]

        timePeriods.forEach { time in
            let button = UIButton(type: .system)
            button.setTitle(time, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.cornerRadius = 16 // Make the buttons rounded
            button.setTitleColor(.black, for: .normal)
            button.backgroundColor = .clear // Default background color

            // Add action for button click
            button.addTarget(self, action: #selector(didTapTimeButton(_:)), for: .touchUpInside)

            timeSelectionStackView.addArrangedSubview(button)
            timeButtons.append(button) // Add button to the array
        }

        timeSelectionStackView.axis = .horizontal
        timeSelectionStackView.spacing = 8
        timeSelectionStackView.distribution = .fillEqually // Ensure equal sizes for all buttons

        view.addSubview(timeSelectionTitleLabel)
        view.addSubview(timeSelectionStackView)

        timeSelectionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        timeSelectionStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            timeSelectionTitleLabel.topAnchor.constraint(equalTo: calendarImageView.bottomAnchor, constant: 16),
            timeSelectionTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),

            timeSelectionStackView.topAnchor.constraint(equalTo: timeSelectionTitleLabel.bottomAnchor, constant: 8),
            timeSelectionStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            timeSelectionStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            timeSelectionStackView.heightAnchor.constraint(equalToConstant: 35) // Fixed height for the buttons
        ])
    }

    @objc private func didTapTimeButton(_ sender: UIButton) {
        // Reset all buttons to default state
        for button in timeButtons {
            button.backgroundColor = .clear
            button.setTitleColor(.black, for: .normal)
            button.layer.borderColor = UIColor.black.cgColor
        }

        // Highlight the selected button
        sender.backgroundColor = UIColor(red: 103/255, green: 148/255, blue: 0/255, alpha: 1.0) // Green color
        sender.setTitleColor(.white, for: .normal) // White text color
        sender.layer.borderColor = UIColor(red: 103/255, green: 148/255, blue: 0/255, alpha: 1.0).cgColor
    }


    private var slotButtons: [UIButton] = [] // Array to store slot buttons for toggling

    private func setupSlotsSection() {
        slotsTitleLabel.text = "Slots:"
        slotsTitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)

        let slots = ["1:00 pm", "2:00 pm", "3:00 pm", "4:00 pm", "5:00 pm"]

        slots.forEach { slot in
            let button = UIButton(type: .system)
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.lightGray.cgColor
            button.layer.cornerRadius = 8
            button.backgroundColor = UIColor(white: 0.95, alpha: 1.0) // Light gray background

            // Create attributed text for the button
            let components = slot.split(separator: " ")
            let boldPart = String(components[0]) // "1:00"
            let regularPart = String(components[1]) // "pm"

            let attributedString = NSMutableAttributedString(
                string: boldPart + "\n",
                attributes: [
                    .font: UIFont.boldSystemFont(ofSize: 16),
                    .foregroundColor: UIColor.black
                ]
            )
            attributedString.append(NSAttributedString(
                string: regularPart,
                attributes: [
                    .font: UIFont.systemFont(ofSize: 14),
                    .foregroundColor: UIColor.black
                ]
            ))

            button.setAttributedTitle(attributedString, for: .normal)
            button.titleLabel?.textAlignment = .center
            button.titleLabel?.numberOfLines = 2

            // Add action for button click
            button.addTarget(self, action: #selector(didTapSlotButton(_:)), for: .touchUpInside)

            slotsStackView.addArrangedSubview(button)
            slotButtons.append(button) // Add button to the array
        }

        slotsStackView.axis = .horizontal
        slotsStackView.spacing = 8
        slotsStackView.distribution = .fillEqually // Ensure equal sizes for all buttons

        view.addSubview(slotsTitleLabel)
        view.addSubview(slotsStackView)

        slotsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        slotsStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            slotsTitleLabel.topAnchor.constraint(equalTo: timeSelectionStackView.bottomAnchor, constant: 16),
            slotsTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),

            slotsStackView.topAnchor.constraint(equalTo: slotsTitleLabel.bottomAnchor, constant: 8),
            slotsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            slotsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            slotsStackView.heightAnchor.constraint(equalToConstant: 65) // Fixed height for the buttons
        ])
    }

    @objc private func didTapSlotButton(_ sender: UIButton) {
        // Reset all buttons to default state
        for button in slotButtons {
            button.backgroundColor = UIColor(white: 0.95, alpha: 1.0) // Light gray background
            button.layer.borderColor = UIColor.lightGray.cgColor
        }

        // Highlight the selected button
        sender.backgroundColor = UIColor(red: 103/255, green: 148/255, blue: 0/255, alpha: 1.0) // Green color
        sender.layer.borderColor = UIColor(red: 103/255, green: 148/255, blue: 0/255, alpha: 1.0).cgColor
    }




    private func setupConfirmButton() {
        confirmButton.setTitle("Confirm Booking", for: .normal)
        confirmButton.backgroundColor = UIColor(red: 103/255, green: 148/255, blue: 0/255, alpha: 1.0)
        confirmButton.setTitleColor(.white, for: .normal)
        confirmButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        confirmButton.layer.cornerRadius = 8

        view.addSubview(confirmButton)

        confirmButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            confirmButton.topAnchor.constraint(equalTo: slotsStackView.bottomAnchor, constant: 20),
            confirmButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            confirmButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            confirmButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc private func didTapBack() {
        dismiss(animated: true, completion: nil)
    }
}
