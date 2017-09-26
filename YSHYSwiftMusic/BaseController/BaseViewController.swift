//
//  BaseViewController.swift
//  YSHYSwiftMusic
//
//  Created by 杨淑园 on 2017/4/12.
//  Copyright © 2017年 yangshuyaun. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var  navgationView:UIView?
    var titleLa:UILabel?
    var backBtn:UIButton?
    var rightBtn:UIButton?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        navgationView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 64))
        navgationView?.backgroundColor = UIColor.red;
        self.view.addSubview(navgationView!);
        
        titleLa = UILabel(frame: CGRect(origin: CGPoint(x: 70, y: 24), size: CGSize(width: self.view.frame.size.width - 140, height: 40)))
        titleLa?.text = "我是标题"
        titleLa?.textAlignment = NSTextAlignment.center
        titleLa?.font = UIFont(name: "Helvetica", size: 18.0)
        titleLa?.textColor = UIColor.white
        self.view.addSubview(titleLa!)
        
        backBtn = UIButton(type:UIButtonType.custom)
        backBtn?.frame = CGRect(x: 10, y: 24, width: 40, height: 40)
        backBtn?.addTarget(self, action:#selector(pressBack(sender:)) , for: UIControlEvents.touchUpInside)
        self.view.addSubview(backBtn!)
//        backBtn?.setTitle("返回", for: UIControlState.normal)
        backBtn?.setImage(UIImage(named: "cm2_icn_back"), for: UIControlState.normal)
    
    }

     public func pressBack(sender:UIButton?) -> Void{
        
        print("点击了backBtn")
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    
    public func setRightBtn(image:UIImage?) -> Void{
    
        let x:CGFloat = self.view.frame.size.width - 40 - 10;
        rightBtn = UIButton(frame: CGRect(x: x, y: 24, width: 40, height: 40))
        self.view.addSubview(rightBtn!)
        rightBtn?.addTarget(self, action: #selector(pressRightBtn(sender:)), for: UIControlEvents.touchUpInside)
        rightBtn?.setImage(image, for: UIControlState.normal)
        rightBtn?.titleLabel?.text = "rightBtn"
    }
    
    func pressRightBtn(sender:UIButton) -> Void {
        print("点击了rightBtn")
    }


}
