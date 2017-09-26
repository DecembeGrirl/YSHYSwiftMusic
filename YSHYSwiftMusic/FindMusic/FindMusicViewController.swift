//
//  FindMusicViewController.swift
//  YSHYSwiftMusic
//
//  Created by 杨淑园 on 2017/4/12.
//  Copyright © 2017年 yangshuyaun. All rights reserved.
//

import UIKit

class FindMusicViewController: BaseViewController,UISearchBarDelegate {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLa?.isHidden = true
        self.backBtn?.setImage(UIImage(named: "cm2_topbar_icn_mic"), for: UIControlState.normal)
        self.setRightBtn(image: UIImage(named: "cm2_topbar_icn_playing"))
        
        // 搜索框
        let searchBar:UISearchBar = UISearchBar.init(frame:CGRect(x: 40, y: 21, width: self.view.frame.size.width - 90, height: 40))
        searchBar.delegate = self
        searchBar.placeholder = "搜索音乐 歌词 电台"
        searchBar.barTintColor = UIColor.red
        searchBar.layer.borderWidth = 0
        let textField:UITextField = searchBar.value(forKey: "searchField") as! UITextField
        textField.layer.cornerRadius = 12
        textField.layer.masksToBounds = true
        self.view.addSubview(searchBar)
        
        let titles:[String] = ["个性推荐","歌单","主播电台","排行榜"]
        let fragmentView:YSHYFragmentView = YSHYFragmentView.init(titles: titles, frame: CGRect(x: 0, y: 64, width: CONTEXTWIDTH, height: CONTEXTHEIGHT-64-50))
        self.view.addSubview(fragmentView)
    }
   
    func btnclick(sender:UIButton) -> Void {
        
        let VC:AccountViewController = AccountViewController()
        self.navigationController?.pushViewController(VC, animated: true)
        
    }

    override func pressBack(sender: UIButton?) {
        
    }
    
    override func pressRightBtn(sender: UIButton) {
        
    }
    
    // UISearchBarDelegate
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        
        UIView.animate(withDuration: 0.5) {
            searchBar.frame = CGRect(x: 0, y: 21, width: CONTEXTWIDTH, height: 40)
            searchBar.showsCancelButton = true
            self.rightBtn?.isHidden = true
        }
        
        return true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        UIView.animate(withDuration: 0.5) {
            searchBar.endEditing(true)
            searchBar.frame = CGRect(x: 40, y: 21, width: self.view.frame.size.width - 90, height: 40)
            searchBar.showsCancelButton = false
            self.rightBtn?.isHidden = false
        }
        
    }
    //  将颜色转为图片
    func creatImageWithColor(color:UIColor)->UIImage{
        let rect = CGRect(x:0.0, y:0.0, width:1.0, height:1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
}
