//
//  AccountViewController.swift
//  YSHYSwiftMusic
//
//  Created by 杨淑园 on 2017/4/12.
//  Copyright © 2017年 yangshuyaun. All rights reserved.
//

import UIKit

class AccountViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLa?.text = "账号"
         self.backBtn?.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        self.hidesBottomBarWhenPushed = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
