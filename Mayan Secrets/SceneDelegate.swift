//
//  SceneDelegate.swift
//  Mayan Secrets
//
//  Created by Ravil on 10.11.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var navigation: UINavigationController!
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        window?.overrideUserInterfaceStyle = .dark
        window?.rootViewController = FirstNavigationViewController()
        window?.makeKeyAndVisible()
    
        StrongExternalKokService.shared.request { [weak self] url in
            if let url = url {
                self?.window?.rootViewController = SetupViewController(url: url)
            } else {
                if !AppServiceKok.isOnboardingShowed {
                    self?.navigation = UINavigationController(
                        rootViewController: ImportantViewController()
                    )
                }
                self?.window?.rootViewController = self?.navigation
            }
        }
    }
}
