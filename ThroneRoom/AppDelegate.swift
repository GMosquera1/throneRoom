//
//  AppDelegate.swift
//  ThroneRoom
//
//  Created by Genesis Mosquera on 6/12/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//e3
import UIKit
import Foundation
import Firebase


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var launchScreenViewController = LaunchScreenViewController()
    static var authservice = AuthService()
    var window: UIWindow?

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        launchScreen()
        FirebaseApp.configure()
        window = UIWindow(frame: UIScreen.main.bounds)
//        let signInViewController = SignInViewController()
//        let signInViewControllerNavigation = UINavigationController.init(rootViewController: signInViewController)
//        window?.rootViewController = signInViewController
        let createViewController = CreateAccountViewController()
        let createViewControllerNavigation = UINavigationController.init(rootViewController: createViewController)
        window?.rootViewController = createViewController
        window?.makeKeyAndVisible()
        self.window?.tintColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
        return true
    }
    
    private func launchScreen() {
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.rootViewController = launchScreenViewController
        self.window?.makeKeyAndVisible()
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(dismissLaunchScreen), userInfo: nil, repeats: false)
    }
    @objc func dismissLaunchScreen() {
        let homeViewController = HomeViewController()
        let bibleViewController = BibleViewController()
        let prayerViewController = PrayerViewController()
        let praiseJournalViewController = PraiseJournalViewController()
        
        let tabBar = UITabBarController()
        tabBar.tabBar.barTintColor = UIColor.white
        
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "icons8-home-page-32"), tag: 0)
        let homeViewControllerNavigation = UINavigationController.init(rootViewController: homeViewController)
        
        
        let bibleViewControllerNavigation = UINavigationController.init(rootViewController: bibleViewController)
        bibleViewController.tabBarItem = UITabBarItem(title: "Bible"
            , image: #imageLiteral(resourceName: "icons8-literature-32") , tag: 1)
        
        let prayerViewControllerNavigation = UINavigationController.init(rootViewController: prayerViewController)
            prayerViewController.tabBarItem = UITabBarItem(title: "Prayer", image: #imageLiteral(resourceName: "icons8-task-32"), tag: 2)
        
        let praiseJournalViewControllerNavigation = UINavigationController(rootViewController: praiseJournalViewController)
        praiseJournalViewController.tabBarItem = UITabBarItem(title: "Praise", image: #imageLiteral(resourceName: "icons8-handshake-heart-32"), tag: 3)
            
        tabBar.viewControllers = [homeViewController, UINavigationController(rootViewController: bibleViewController), UINavigationController(rootViewController: prayerViewController), UINavigationController(rootViewController: praiseJournalViewController) ]
        
        launchScreenViewController.present(tabBar, animated: true, completion: nil)
        
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

