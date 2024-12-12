//
//  DoctorProfileViewController.swift
//  Niramaya
//
//  Created by palak seth on 10/12/24.
//

import UIKit

class DoctorProfileViewController: UIViewController {
    // UI Elements
    private let backButton = UIButton()
    private let searchButton = UIButton()
    private let profileImageView = UIImageView()
    private let nameLabel = UILabel()
    private let specialtyLabel = UILabel()
    private let experienceLabel = UILabel()
    private let ratingLabel = UILabel()
    private let tagsStackView = UIStackView()
    private let biographyTitleLabel = UILabel()
    private let biographyTextLabel = UILabel()
    private let readMoreButton = UIButton()
    private let workingHoursTitleLabel = UILabel()
    private let workingHoursStackView = UIStackView()
    private let detailsTitleLabel = UILabel()
    private let detailsStackView = UIStackView()
    private let feeLabel = UILabel()
    private let bookAppointmentButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    private func setupUI() {
        setupHeader()
        setupProfileSection()
        setupTagsSection()
        setupBiographySection()
        setupWorkingHoursSection()
        setupDetailsSection()
        setupFeeSection()
        setupBookAppointmentButton()
    }

    private func setupHeader() {
        // Back Button
        backButton.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        backButton.tintColor = .black
        backButton.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)

        // Search Button
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.tintColor = .black

        // Add to view
        view.addSubview(backButton)
        view.addSubview(searchButton)

        // Constraints
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
        // Profile Image
        profileImageView.layer.cornerRadius = 50
        profileImageView.clipsToBounds = true
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.image = UIImage(named: "profile_image") // Replace with your asset name

        // Name Label
        nameLabel.text = "Dr. Abcde Fghi"
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)

        // Specialty Label
        specialtyLabel.text = "Cardiologist/Therapy"
        specialtyLabel.font = UIFont.italicSystemFont(ofSize: 16)
        specialtyLabel.textColor = .black
        

        // Experience Label
        experienceLabel.text = "30+ Years of experience in Cardiovascular surgery"
        experienceLabel.font = UIFont.systemFont(ofSize: 14)
        experienceLabel.textColor = .gray
        experienceLabel.numberOfLines = 0

        // Rating Label
        ratingLabel.text = "⭐️⭐️⭐️⭐️⭐️ [150+]"
        ratingLabel.font = UIFont.systemFont(ofSize: 14)
        ratingLabel.textColor = .gray

        // Add to view
        view.addSubview(profileImageView)
        view.addSubview(nameLabel)
        view.addSubview(specialtyLabel)
        view.addSubview(experienceLabel)
        view.addSubview(ratingLabel)

        // Constraints
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

    private func setupTagsSection() {
        // Tags Title
        let tagsTitleLabel = UILabel()
        tagsTitleLabel.text = "Tags:"
        tagsTitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)

        // Tags Stack View
        tagsStackView.axis = .horizontal
        tagsStackView.spacing = 8
        tagsStackView.distribution = .fillEqually

        let tags = ["Cardiology", "Surgery", "Therapy"]
        tags.forEach { tag in
            let tagButton = UIButton(type: .system)
            tagButton.setTitle(tag, for: .normal)
            tagButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            tagButton.layer.borderWidth = 1
            tagButton.setTitleColor(.black, for: .normal)
            tagButton.layer.borderColor = UIColor.lightGray.cgColor
            tagButton.layer.cornerRadius = 16
            tagsStackView.addArrangedSubview(tagButton)
        }

        // Add to view
        view.addSubview(tagsTitleLabel)
        view.addSubview(tagsStackView)

        // Constraints
        tagsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        tagsStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tagsTitleLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16),
            tagsTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),

            tagsStackView.topAnchor.constraint(equalTo: tagsTitleLabel.bottomAnchor, constant: 8),
            tagsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tagsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }

    private func setupBiographySection() {
        // Biography Title
        biographyTitleLabel.text = "Biography:"
        biographyTitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)

        // Biography Text
        biographyTextLabel.text = """
        A doctor’s biography can include their professional experience, achievements, and areas of specialization. A doctor’s biography can also include personal information, such as their interests and hobbies.
        """
        biographyTextLabel.font = UIFont.systemFont(ofSize: 14)
        biographyTextLabel.textColor = .black
        biographyTextLabel.numberOfLines = 0

        // Read More Button
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
        let underlineAttributedString = NSAttributedString(string: "Read more", attributes: underlineAttribute)
        readMoreButton.setAttributedTitle(underlineAttributedString, for: .normal)
        readMoreButton.setTitleColor(.systemBlue, for: .normal)
        readMoreButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)

        // Add to View
        view.addSubview(biographyTitleLabel)
        view.addSubview(biographyTextLabel)
        view.addSubview(readMoreButton)

        // Constraints
        biographyTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        biographyTextLabel.translatesAutoresizingMaskIntoConstraints = false
        readMoreButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            biographyTitleLabel.topAnchor.constraint(equalTo: tagsStackView.bottomAnchor, constant: 16),
            biographyTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),

            biographyTextLabel.topAnchor.constraint(equalTo: biographyTitleLabel.bottomAnchor, constant: 8),
            biographyTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            biographyTextLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            // Move the Read More button slightly above by reducing its top margin
            readMoreButton.topAnchor.constraint(equalTo: biographyTextLabel.bottomAnchor, constant: 0), // Adjust the constant as needed
            readMoreButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
    }


    private func setupWorkingHoursSection() {
        workingHoursTitleLabel.text = "Working Hours:"
        workingHoursTitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)

        let workingHours = [
            ("Mon–Fri", "8:00 am – 6:00 pm"),
            ("Sat–Sun", "9:00 am – 5:00 pm")
        ]

        workingHoursStackView.axis = .vertical
        workingHoursStackView.spacing = 4

        workingHours.forEach { day, hours in
            let row = UIStackView()
            row.axis = .horizontal
            row.spacing = 8

            let dayLabel = UILabel()
            dayLabel.text = day
            dayLabel.font = UIFont.systemFont(ofSize: 14)
            dayLabel.textColor = .gray // Set color of Mon-Fri and Sat-Sun to black

            let hoursLabel = UILabel()
            hoursLabel.text = hours
            hoursLabel.font = UIFont.systemFont(ofSize: 14)
            hoursLabel.textColor = .black // Optional: Keep hours text in gray for distinction

            row.addArrangedSubview(dayLabel)
            row.addArrangedSubview(hoursLabel)
            workingHoursStackView.addArrangedSubview(row)
        }

        view.addSubview(workingHoursTitleLabel)
        view.addSubview(workingHoursStackView)

        workingHoursTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        workingHoursStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            workingHoursTitleLabel.topAnchor.constraint(equalTo: readMoreButton.bottomAnchor, constant: 16),
            workingHoursTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),

            workingHoursStackView.topAnchor.constraint(equalTo: workingHoursTitleLabel.bottomAnchor, constant: 8),
            workingHoursStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            workingHoursStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }


    private func setupDetailsSection() {
        detailsTitleLabel.text = "Details:"
        detailsTitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)

        let details = [
            ("Hospital/Clinic", "ABC Hospital"),
            ("Specialization", "Cardiology"),
            ("Years of Experience", "30+ in cardio"),
            ("Phone Number", "+91 00000 00000")
        ]

        detailsStackView.axis = .vertical
        detailsStackView.spacing = 4

        details.forEach { title, value in
            let row = UIStackView()
            row.axis = .horizontal
            row.spacing = 8

            let titleLabel = UILabel()
            titleLabel.text = title
            titleLabel.font = UIFont.systemFont(ofSize: 14)
            titleLabel.textColor = .gray

            let valueLabel = UILabel()
            valueLabel.text = value
            valueLabel.font = UIFont.systemFont(ofSize: 14)

            row.addArrangedSubview(titleLabel)
            row.addArrangedSubview(valueLabel)
            detailsStackView.addArrangedSubview(row)
        }

        view.addSubview(detailsTitleLabel)
        view.addSubview(detailsStackView)

        detailsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        detailsStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            detailsTitleLabel.topAnchor.constraint(equalTo: workingHoursStackView.bottomAnchor, constant: 16),
            detailsTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),

            detailsStackView.topAnchor.constraint(equalTo: detailsTitleLabel.bottomAnchor, constant: 8),
            detailsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            detailsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    private let feeStackView = UIStackView() // Declare it as a class-level property

    private func setupFeeSection() {
        // Fee Title
        let feeTitleLabel = UILabel()
        feeTitleLabel.text = "Fee:"
        feeTitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        feeTitleLabel.textColor = .black

        // Fee Value
        let feeValueLabel = UILabel()
        feeValueLabel.text = "Rs. 800/-"
        feeValueLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        feeValueLabel.textColor = UIColor(red: 103/255, green: 148/255, blue: 0/255, alpha: 1.0)

        // Configure Fee Stack View
        feeStackView.axis = .horizontal
        feeStackView.spacing = 8
        feeStackView.alignment = .center
        feeStackView.distribution = .equalSpacing
        feeStackView.addArrangedSubview(feeTitleLabel)
        feeStackView.addArrangedSubview(feeValueLabel)

        // Add Fee Stack to the View
        view.addSubview(feeStackView)

        feeStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            feeStackView.topAnchor.constraint(equalTo: detailsStackView.bottomAnchor, constant: 16),
            feeStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            feeStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            feeStackView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }


    private func setupBookAppointmentButton() {
        bookAppointmentButton.setTitle("Book an appointment", for: .normal)
        bookAppointmentButton.backgroundColor = UIColor(red: 103/255, green: 148/255, blue: 0/255, alpha: 1.0)
        bookAppointmentButton.setTitleColor(.white, for: .normal)
        bookAppointmentButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        bookAppointmentButton.layer.cornerRadius = 8

        // Add the button to the same view
        view.addSubview(bookAppointmentButton)

        bookAppointmentButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            bookAppointmentButton.topAnchor.constraint(equalTo: feeStackView.bottomAnchor, constant: 16),
            bookAppointmentButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            bookAppointmentButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            bookAppointmentButton.heightAnchor.constraint(equalToConstant: 50),

            // Ensure there is space from the safe area at the bottom
            bookAppointmentButton.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
        ])
    }




    @objc private func didTapBack() {
        dismiss(animated: true, completion: nil)
    }
}
