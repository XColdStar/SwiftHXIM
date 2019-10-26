//
//  HXRootVCManager.swift
//  SwiftHXIM
//
//  Created by hanxing on 2019/10/26.
//  Copyright © 2019 hanxing. All rights reserved.
//

import UIKit

class HXRootVCManager: NSObject {
    
    static let rootVC = UITabBarController()
    static func defaultRootVC() -> UITabBarController {
        DispatchQueue.onceToken() {
            let sessionListVC = EMConversationsViewController()
            sessionListVC.title = "聊天列表"
            let sessionListNav = UINavigationController(rootViewController: sessionListVC)
            sessionListNav.tabBarItem = sessionListVC.tabBarItem
            
            let contactsVC = EMContactsViewController()
            contactsVC.title = "好友列表"
            let contactsNav = UINavigationController(rootViewController: contactsVC)
            contactsNav.tabBarItem = contactsVC.tabBarItem
            
            rootVC.viewControllers = [sessionListNav,contactsNav]
        }
        return rootVC
    }
    
    static func currentNavigationVC() -> UINavigationController? {
        let mainWindow = UIApplication.shared.keyWindow!
        if mainWindow.rootViewController?.isKind(of: UITabBarController.self) == nil {
            return nil
        }
        let rootTabBar = mainWindow.rootViewController as! UITabBarController
        return rootTabBar.selectedViewController as? UINavigationController
    }
    
    @objc static func pushChartVC(contactId:String) {
        let chartVC = EMChatViewController(conversationId: contactId, type: EMConversationTypeChat, createIfNotExist: true)
        chartVC.hidesBottomBarWhenPushed = true
        HXRootVCManager.currentNavigationVC()?.pushViewController(chartVC, animated: true)
    }
    
    
}
