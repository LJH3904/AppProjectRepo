//
//  SceneDelegate.swift
//  Prototype_LAB6
//
//  Created by LJh on 2023/07/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let firstViewController = UINavigationController(rootViewController: FirstViewController())
        firstViewController.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), tag: 0)
        
        let secondViewController = UINavigationController(rootViewController: SecondViewController())
        secondViewController.tabBarItem = UITabBarItem(title: "채팅", image: UIImage(systemName: "message"), tag: 0)
        
        let infoViewController = UINavigationController(rootViewController: InfoViewController())
        infoViewController.tabBarItem = UITabBarItem(title: "인포", image: UIImage(systemName: "info"), tag: 0)
        
        firstViewController.navigationBar.prefersLargeTitles = true
        secondViewController.navigationBar.prefersLargeTitles = true
        infoViewController.navigationBar.prefersLargeTitles = true
        
        //좋죠 ~
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [firstViewController, secondViewController,infoViewController]
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
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
        
    }
}

