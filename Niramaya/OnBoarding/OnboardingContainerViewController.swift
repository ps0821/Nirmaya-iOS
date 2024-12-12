//
//  OnboardingContainerViewController.swift
//  Niramaya
//
//  Created by Yash's Mackbook on 11/12/24.
//
import UIKit

class OnboardingContainerViewController: UIViewController {

    private let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 30
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        button.tintColor = .systemGray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 4
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = .systemGreen
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()

    private var onboardingViewControllers: [UIViewController] = []
    private var currentPageIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupOnboardingViewControllers()
        displayCurrentPage()
    }

    private func setupUI() {
        view.backgroundColor = UIColor.systemGray6
        view.addSubview(cardView)
        view.addSubview(nextButton)
        view.addSubview(backButton)
        view.addSubview(skipButton)
        view.addSubview(pageControl)

        NSLayoutConstraint.activate([
            // Card View
            cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cardView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            cardView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),

            // Page Control
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -60),

            // Next Button
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -28),
            nextButton.widthAnchor.constraint(equalToConstant: 60),
            nextButton.heightAnchor.constraint(equalToConstant: 60),

            // Back Button
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            backButton.heightAnchor.constraint(equalToConstant: 40),

            // Skip Button
            skipButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            skipButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
        ])

        nextButton.addTarget(self, action: #selector(didTapNext), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        skipButton.addTarget(self, action: #selector(didTapSkip), for: .touchUpInside)
    }

    private func setupOnboardingViewControllers() {
        let welcomeVC = WelcomePageViewController()
        let selectionVC = SelectionPageViewController()
        let wellbeingVC = WellbeingPageViewController()
        let finalVC = FinalPageViewController()

        onboardingViewControllers = [welcomeVC, selectionVC, wellbeingVC, finalVC]
    }

    private func displayCurrentPage() {
        // Remove existing child view controller
        if let currentChild = children.first {
            currentChild.willMove(toParent: nil)
            currentChild.view.removeFromSuperview()
            currentChild.removeFromParent()
        }

        // Add the new child view controller
        let childVC = onboardingViewControllers[currentPageIndex]
        addChild(childVC)
        cardView.addSubview(childVC.view)
        childVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            childVC.view.topAnchor.constraint(equalTo: cardView.topAnchor),
            childVC.view.bottomAnchor.constraint(equalTo: cardView.bottomAnchor),
            childVC.view.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
            childVC.view.trailingAnchor.constraint(equalTo: cardView.trailingAnchor)
        ])
        childVC.didMove(toParent: self)

        // Update the page control
        pageControl.currentPage = currentPageIndex

        // Hide the back button on the first page
        backButton.isHidden = currentPageIndex == 0
    }

    @objc private func didTapNext() {
        if currentPageIndex < onboardingViewControllers.count - 1 {
            currentPageIndex += 1
            displayCurrentPage()
        } else {
            print("Onboarding Complete")
        }
    }

    @objc private func didTapBack() {
        if currentPageIndex > 0 {
            currentPageIndex -= 1
            displayCurrentPage()
        }
    }

    @objc private func didTapSkip() {
        // Change the scene delegate to TabBarVC
        let tabBarVC = TabBarController() // Replace with your TabBarVC implementation
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else { return }
        window.rootViewController = tabBarVC
        window.makeKeyAndVisible()
    }
}

#Preview{
    OnboardingContainerViewController()
}
