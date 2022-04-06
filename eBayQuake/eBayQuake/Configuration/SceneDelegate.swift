//
//  SceneDelegate.swift
//  eBayQuake
//
//  Created by Federico Dominguez on 05/04/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = createNavigationController(viewController: EarthquakesViewController())
        window?.makeKeyAndVisible()
    }

    func createNavigationController(viewController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        viewController.view.backgroundColor = .systemBackground
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.tintColor = .label
        
        return navigationController
    }
}

