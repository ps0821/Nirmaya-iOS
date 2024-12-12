//
//  TabBarController.swift
//  Niramaya
//
//  Created by Yash's Mackbook on 10/12/24.
//


import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }

    private func setupTabBar() {
        // Home Tab
        let homeVC = HomeViewController()
        let homeNavController = UINavigationController(rootViewController: homeVC)
        homeNavController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        // Bookings Tab
        let bookingsVC = DoctorBookingViewController() // Replace with your BookingsViewController
        bookingsVC.view.backgroundColor = .white
        bookingsVC.tabBarItem = UITabBarItem(title: "Bookings", image: UIImage(systemName: "doc.text"), selectedImage: UIImage(systemName: "doc.text.fill"))
        
        // Maps Tab
        let mapsVC = UINavigationController(rootViewController: LocationPromptViewController())  // Replace with your MapsViewController
        mapsVC.view.backgroundColor = .white
        mapsVC.tabBarItem = UITabBarItem(title: "Maps", image: UIImage(systemName: "map"), selectedImage: UIImage(systemName: "map.fill"))
        
        // Chat Tab
        let chatVC = UIViewController() // Replace with your ChatViewController
        chatVC.view.backgroundColor = .white
        chatVC.tabBarItem = UITabBarItem(title: "Chat", image: UIImage(systemName: "message"), selectedImage: UIImage(systemName: "message.fill"))
        
        // Profile Tab
        let profileVC = UIViewController() // Replace with your ProfileViewController
        profileVC.view.backgroundColor = .white
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        
        // Add all view controllers to the TabBar
        viewControllers = [homeNavController, bookingsVC, mapsVC, chatVC, profileVC]
        
        // Customize the TabBar appearance
        tabBar.tintColor = UIColor.systemGreen // Active tab color
        tabBar.unselectedItemTintColor = UIColor.gray // Inactive tab color
        tabBar.backgroundColor = .white
    }
}

#Preview{
    TabBarController()
}
