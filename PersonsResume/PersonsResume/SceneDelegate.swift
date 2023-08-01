//
//  SceneDelegate.swift
//  PersonsResume
//
//  Created by Людмила Долонтаева on 2023-08-01.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = ResumeViewControllerAssembly().create()
        self.window = window
        window.makeKeyAndVisible()
    }

}

