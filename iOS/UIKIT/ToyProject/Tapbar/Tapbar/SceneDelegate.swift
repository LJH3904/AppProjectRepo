//
//  SceneDelegate.swift
//  Tapbar
//
//  Created by LJh on 2023/07/19.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
  var window: UIWindow?
  
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
    guard let windowScene = (scene as? UIWindowScene) else { return }
    
    let firstViewController = UINavigationController(rootViewController: FirstViewController())
    let secondViewController : SecondViewController = SecondViewController()
    let thirdViewController : ThirdViewController = ThirdViewController()
    
    let fourthViewController = UINavigationController(rootViewController: fourthViewController())
    
    firstViewController.tabBarItem = UITabBarItem(title: "first", image: UIImage(systemName: "plus.rectangle"), tag: 0)
    secondViewController.tabBarItem = UITabBarItem(title: "second", image: UIImage(systemName: "plus.square.fill"), tag: 0)
    thirdViewController.tabBarItem = UITabBarItem(title: "third", image: UIImage(systemName: "exclamationmark.circle"), tag: 0)
    fourthViewController.tabBarItem = UITabBarItem(title: "fourth", image: UIImage(systemName: "lightbulb.fill"), tag: 0)
    
    
    
    let tabBarController = UITabBarController()
    tabBarController.viewControllers = [firstViewController, secondViewController,thirdViewController , fourthViewController]
    
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

