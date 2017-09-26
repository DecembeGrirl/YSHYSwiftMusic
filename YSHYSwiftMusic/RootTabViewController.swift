//
//  RootTabViewController.swift
//  YSHYSwiftMusic
//
//  Created by 杨淑园 on 2017/4/12.
//  Copyright © 2017年 yangshuyaun. All rights reserved.
//

import UIKit


class RootTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().barTintColor = UIColor.clear
        UITabBar.appearance().tintColor = UIColor.white

        let findMusicVC:FindMusicViewController  = FindMusicViewController()
        let findNav:BaseNavViewController = BaseNavViewController(rootViewController: findMusicVC)
        
        
        let myMusicVC:MyMusicViewController = MyMusicViewController()
        let myMusicNav:BaseNavViewController = BaseNavViewController(rootViewController: myMusicVC)
        
        let friendVC:FriendViewController = FriendViewController()
        let friendNav:BaseNavViewController = BaseNavViewController(rootViewController: friendVC)
        
        let accountVC:AccountViewController = AccountViewController()
        let accountNav:BaseNavViewController = BaseNavViewController(rootViewController: accountVC)
        
        let item1:UITabBarItem = UITabBarItem(title: "发现音乐", image: UIImage(named: "cm2_btm_icn_discovery"), selectedImage: UIImage(named: "cm2_btm_icn_discovery_prs"))
        findMusicVC.tabBarItem = item1
        
        let item2:UITabBarItem = UITabBarItem(title: "我的音乐", image: UIImage(named: "cm2_btm_icn_music"), selectedImage: UIImage(named: "cm2_btm_icn_music_prs"))
        myMusicVC.tabBarItem = item2
        
        let item3:UITabBarItem = UITabBarItem(title: "朋  友", image: UIImage(named: "cm2_btm_icn_friend"), selectedImage: UIImage(named: "cm2_btm_icn_friend_prs"))
        friendVC.tabBarItem = item3
        
        let item4:UITabBarItem = UITabBarItem(title: "账  号", image: UIImage(named: "cm2_btm_icn_account"), selectedImage: UIImage(named: "cm2_btm_icn_account_prs"))
        accountVC.tabBarItem = item4
        item4.image?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        

        self.viewControllers = [findNav,myMusicNav,friendNav,accountNav]

    }

  
}
