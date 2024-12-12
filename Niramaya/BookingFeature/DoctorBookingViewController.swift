//
//  DoctorBookingViewController.swift
//  Niramaya
//
//  Created by palak seth on 10/12/24.
//
import UIKit

class DoctorBookingViewController: UIViewController {
    // UI Elements
    private let headerLabel = UILabel()
    private let backButton = UIButton()
    private let searchButton = UIButton()
    private let filterStackView = UIStackView()
    private let selectedCategoryContainer = UIView()
    private let separatorLine = UIView()
    private let tableView = UITableView()

    // Constants
    private let customGreenColor = UIColor(red: 103/255, green: 148/255, blue: 0/255, alpha: 1.0) // #679400
    private let inactiveButtonBorderColor = UIColor.black.cgColor

    // Data
    private let doctorData = Array(repeating: [
        "name": "Dr. Abcde Fghi",
        "specialty": "Cardiologist/Therapy",
        "experience": "30+ Years of experience in Cardiovascular surgery",
        "rating": "4.9",
        "reviews": "150+",
        "fee": "800"
    ], count: 10)

    private let profileImage = UIImage(named: "profile_image") // Load profile image from assets

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    // Setup the UI
    private func setupUI() {
        setupHeader()
        setupFilterButtons()
        setupSelectedCategory()
        setupTableView()
    }

    private func setupHeader() {
        // Back Button
        backButton.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        backButton.tintColor = .black
        backButton.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)

        // Search Button
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.tintColor = .black
        searchButton.addTarget(self, action: #selector(didTapSearch), for: .touchUpInside)

        // Header Label
        headerLabel.text = "Find Your Doctor"
        headerLabel.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        headerLabel.textAlignment = .center

        // Add Subviews
        view.addSubview(backButton)
        view.addSubview(searchButton)
        view.addSubview(headerLabel)

        // Layout
        backButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backButton.widthAnchor.constraint(equalToConstant: 36),
            backButton.heightAnchor.constraint(equalToConstant: 36),

            searchButton.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            searchButton.widthAnchor.constraint(equalToConstant: 36),
            searchButton.heightAnchor.constraint(equalToConstant: 36),

            headerLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 16),
            headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    private func setupFilterButtons() {
        let filters = ["Experience", "Most Qualified", "Fee"]
        filterStackView.axis = .horizontal
        filterStackView.alignment = .fill
        filterStackView.distribution = .fillEqually
        filterStackView.spacing = 12

        filters.forEach { filter in
            let containerView = UIView()
            containerView.layer.borderWidth = 1
            containerView.layer.borderColor = inactiveButtonBorderColor
            containerView.layer.cornerRadius = 20
            containerView.backgroundColor = .white

            let button = UIButton()
            button.setTitle(filter, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
            button.setTitleColor(.black, for: .normal)
            button.addTarget(self, action: #selector(didTapFilterButton(_:)), for: .touchUpInside)
            button.tag = filters.firstIndex(of: filter) ?? 0

            let crossButton = UIButton()
            crossButton.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
            crossButton.tintColor = .black
            crossButton.isHidden = true
            crossButton.addTarget(self, action: #selector(didTapCrossButton(_:)), for: .touchUpInside)
            crossButton.tag = filters.firstIndex(of: filter) ?? 0

            containerView.addSubview(button)
            containerView.addSubview(crossButton)
            filterStackView.addArrangedSubview(containerView)

            button.translatesAutoresizingMaskIntoConstraints = false
            crossButton.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                containerView.heightAnchor.constraint(equalToConstant: 40),

                button.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
                button.trailingAnchor.constraint(equalTo: crossButton.leadingAnchor, constant: -8),
                button.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),

                crossButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
                crossButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
                crossButton.widthAnchor.constraint(equalToConstant: 20),
                crossButton.heightAnchor.constraint(equalToConstant: 20)
            ])
        }

        view.addSubview(filterStackView)
        filterStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            filterStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            filterStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            filterStackView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 24),
            filterStackView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    private func setupSelectedCategory() {
        // Add container view for the selected category section
        view.addSubview(selectedCategoryContainer)

        // Title for Selected Category
        let titleLabel = UILabel()
        titleLabel.text = "Selected Category:"
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        titleLabel.textColor = .black
        selectedCategoryContainer.addSubview(titleLabel)

        // Heart Icon
        let heartIcon = UIImageView(image: UIImage(named: "Heart"))
        heartIcon.contentMode = .scaleAspectFit
        selectedCategoryContainer.addSubview(heartIcon)

        // Category Text
        let categoryText = UILabel()
        categoryText.text = "Cardiologist"
        categoryText.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        categoryText.textColor = .black
        categoryText.textAlignment = .center
        selectedCategoryContainer.addSubview(categoryText)

        // Separator Line
        separatorLine.backgroundColor = .lightGray
        view.addSubview(separatorLine)

        // Apply constraints
        selectedCategoryContainer.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        heartIcon.translatesAutoresizingMaskIntoConstraints = false
        categoryText.translatesAutoresizingMaskIntoConstraints = false
        separatorLine.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            // Selected Category Container
            selectedCategoryContainer.topAnchor.constraint(equalTo: filterStackView.bottomAnchor, constant: 16),
            selectedCategoryContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            selectedCategoryContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            // Title Label
            // Title Label
            titleLabel.leadingAnchor.constraint(equalTo: selectedCategoryContainer.leadingAnchor, constant: 70),
            titleLabel.centerYAnchor.constraint(equalTo: heartIcon.centerYAnchor),

            

            // Heart Icon
            heartIcon.centerXAnchor.constraint(equalTo: selectedCategoryContainer.leadingAnchor, constant: 265),
            heartIcon.topAnchor.constraint(equalTo: selectedCategoryContainer.topAnchor),
            heartIcon.widthAnchor.constraint(equalToConstant: 50),
            heartIcon.heightAnchor.constraint(equalToConstant: 50),

            // Category Text
            categoryText.topAnchor.constraint(equalTo: heartIcon.bottomAnchor, constant: 8),
            categoryText.centerXAnchor.constraint(equalTo: heartIcon.centerXAnchor),
            categoryText.bottomAnchor.constraint(equalTo: selectedCategoryContainer.bottomAnchor),

            // Separator Line
            separatorLine.topAnchor.constraint(equalTo: selectedCategoryContainer.bottomAnchor, constant: 16),
            separatorLine.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            separatorLine.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            separatorLine.heightAnchor.constraint(equalToConstant: 1)
        ])
    }







    private func setupTableView() {
        tableView.register(DoctorViewCell.self, forCellReuseIdentifier: "DoctorCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: separatorLine.bottomAnchor, constant: 8),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    @objc private func didTapBack() {
        dismiss(animated: true, completion: nil)
    }

    @objc private func didTapSearch() {
        print("Search tapped")
    }

    @objc private func didTapFilterButton(_ sender: UIButton) {
        for subview in filterStackView.arrangedSubviews {
            if let container = subview as? UIView, let button = container.subviews.first as? UIButton, let crossButton = container.subviews.last as? UIButton {
                if button == sender {
                    container.backgroundColor = customGreenColor
                    button.setTitleColor(.white, for: .normal)
                    container.layer.borderColor = customGreenColor.cgColor
                    crossButton.isHidden = false
                } else {
                    container.backgroundColor = .white
                    button.setTitleColor(.black, for: .normal)
                    container.layer.borderColor = inactiveButtonBorderColor
                    crossButton.isHidden = true
                }
            }
        }
    }

    @objc private func didTapCrossButton(_ sender: UIButton) {
        for subview in filterStackView.arrangedSubviews {
            if let container = subview as? UIView, let button = container.subviews.first as? UIButton, let crossButton = container.subviews.last as? UIButton {
                if crossButton == sender {
                    container.backgroundColor = .white
                    button.setTitleColor(.black, for: .normal)
                    container.layer.borderColor = inactiveButtonBorderColor
                    crossButton.isHidden = true
                }
            }
        }
    }
}

extension DoctorBookingViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doctorData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorCell", for: indexPath) as? DoctorViewCell else {
            return UITableViewCell()
        }
        let doctor = doctorData[indexPath.row]
        cell.configure(with: doctor, image: profileImage!)
        return cell
    }
}

class DoctorViewCell: UITableViewCell {
    let nameLabel = UILabel()
    let specialtyLabel = UILabel()
    let experienceLabel = UILabel()
    let ratingLabel = UILabel()
    let feeLabel = UILabel()
    let bookButton = UIButton()
    let profileImageView = UIImageView()
    let separatorLine = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func configure(with data: [String: String], image: UIImage) {
        nameLabel.text = data["name"]
        specialtyLabel.text = data["specialty"]
        experienceLabel.text = data["experience"]
        ratingLabel.text = "⭐⭐⭐⭐⭐ \(data["rating"] ?? "0") (\(data["reviews"] ?? "0"))"
        
        let feeText = "Fee: Rs. \(data["fee"] ?? "0")/-"
        let attributedText = NSMutableAttributedString(string: feeText)
        attributedText.addAttribute(.foregroundColor, value: UIColor.gray, range: NSRange(location: 0, length: 4)) // "Fee:" in gray
        attributedText.addAttribute(.foregroundColor, value: UIColor(red: 103 / 255, green: 148 / 255, blue: 0 / 255, alpha: 1.0), range: NSRange(location: 5, length: feeText.count - 5)) // "Rs. 800/-" in green
        feeLabel.attributedText = attributedText
        
        profileImageView.image = image
    }
    
    private func setupCellUI() {
        profileImageView.layer.cornerRadius = 30
        profileImageView.clipsToBounds = true
        profileImageView.contentMode = .scaleAspectFill
        
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        specialtyLabel.font = UIFont.italicSystemFont(ofSize: 14)
        specialtyLabel.textColor = .black
        
        experienceLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        experienceLabel.textColor = .gray
        experienceLabel.numberOfLines = 0
        experienceLabel.lineBreakMode = .byWordWrapping
        
        ratingLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        ratingLabel.textColor = .gray
        
        feeLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        feeLabel.textAlignment = .right // Align text to the right
        feeLabel.numberOfLines = 1
        feeLabel.lineBreakMode = .byClipping
        
        bookButton.setTitle("Book Now", for: .normal)
        bookButton.backgroundColor = UIColor(red: 103 / 255, green: 148 / 255, blue: 0 / 255, alpha: 1.0)
        bookButton.layer.cornerRadius = 8
        bookButton.setTitleColor(.white, for: .normal)
        bookButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        
        separatorLine.backgroundColor = UIColor.lightGray
        
        let rightStack = UIStackView(arrangedSubviews: [feeLabel, bookButton])
        rightStack.axis = .vertical
        rightStack.spacing = 8
        rightStack.alignment = .center
        
        let leftStack = UIStackView(arrangedSubviews: [nameLabel, specialtyLabel, experienceLabel, ratingLabel])
        leftStack.axis = .vertical
        leftStack.spacing = 4
        leftStack.alignment = .leading
        
        contentView.addSubview(profileImageView)
        contentView.addSubview(leftStack)
        contentView.addSubview(rightStack)
        contentView.addSubview(separatorLine)
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        leftStack.translatesAutoresizingMaskIntoConstraints = false
        rightStack.translatesAutoresizingMaskIntoConstraints = false
        separatorLine.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            profileImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 80),
            profileImageView.heightAnchor.constraint(equalToConstant: 80),
            
            leftStack.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
            leftStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            leftStack.trailingAnchor.constraint(lessThanOrEqualTo: rightStack.leadingAnchor, constant: -16),
            leftStack.bottomAnchor.constraint(equalTo: separatorLine.topAnchor, constant: -16), // Added white space below star rating
            
            rightStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            rightStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            feeLabel.widthAnchor.constraint(equalTo: bookButton.widthAnchor), // Ensure same width
            bookButton.widthAnchor.constraint(equalToConstant: 100), // Adjust width
            bookButton.heightAnchor.constraint(equalToConstant: 36), // Adjust height
            
            separatorLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            separatorLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            separatorLine.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            separatorLine.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
    }
   
}
#Preview{
    DoctorBookingViewController()
}
