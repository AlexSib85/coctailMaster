//
//  AppDelegate.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 18.11.2020.
//

import UIKit
import DITranquillity
import SwiftyUserDefaults

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Defaults[\.needShowOnboarding] = true
        if IsDebugMode {
            do {
                try R.validate()
            } catch {
                fatalError(error.localizedDescription)
            }
        }

        if #available(iOS 13.0, *) {

        } else {
            let window = UIWindow(frame: UIScreen.main.bounds)
            coordinator = AppCoordinator(window: window)
            coordinator?.start()
            self.window = window
            self.window?.makeKeyAndVisible()
        }
        return true
    }
}
