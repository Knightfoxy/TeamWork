//
//  SceneDelegate.swift
//  CoreDataRelationDeletionApp
//
//  Created by Ayush Mishra on 20/07/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
//
//        // Initialize Root View Controller
//        let rootViewController = UIStoryboard(name: "Main", bundle: .main).instantiateInitialViewController { coder in
//            ViewController(coder: coder, viewModel: ViewModel())
//        }
//
//        // Initialize Window
//        window = UIWindow(windowScene: windowScene)
//
//        // Configure Window
//        window?.rootViewController = rootViewController
//
//        // Make Window Key Window
//        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        PersistentStorage.shared.saveContext()
    }
}

