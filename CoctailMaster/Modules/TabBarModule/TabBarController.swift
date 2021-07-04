//
//  TabBarController.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 12.01.2021.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.layer.masksToBounds = true
        self.tabBar.barTintColor = .commonBackground
        self.tabBar.tintColor = UIColor.orange

        self.tabBar.layer.shadowColor = UIColor.lightGray.cgColor
        self.tabBar.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        self.tabBar.layer.shadowRadius = 10
        self.tabBar.layer.shadowOpacity = 1
        self.tabBar.layer.masksToBounds = false
    }

    var coordinator: TabBarCoordinator?
}
