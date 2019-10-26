//
//  AppDelegate.swift
//  SwiftHXIM
//
//  Created by hanxing on 2019/10/25.
//  Copyright © 2019 hanxing. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let option = EMOptions(appkey: "qitu#imtest")
               //        option?.apnsCertName = ""
                       var error = EMClient.shared()?.initializeSDK(with: option)
                       if error == nil {
                           print("初始化成功")
                       }
        
                      DemoCallManager.shared()
                      DemoConfManager.shared()
                       error = EMClient.shared()?.login(withUsername: "321", password: "1")
                       if error == nil {
                           print("登录成功")
                       } else {
                           print("登录失败")
                       }
                
        window = UIWindow(frame: UIScreen.main.bounds)
//        let chartVC = EMChatViewController.init(conversationId: "321", type: EMConversationTypeChat, createIfNotExist: true)
//        window?.rootViewController = UINavigationController(rootViewController: chartVC)
        window?.rootViewController = HXRootVCManager.defaultRootVC()
        window?.makeKeyAndVisible()
        return true
    }

    
    func applicationWillResignActive(_ application: UIApplication) {
        
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }
    // MARK: UISceneSession Lifecycle

//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}

