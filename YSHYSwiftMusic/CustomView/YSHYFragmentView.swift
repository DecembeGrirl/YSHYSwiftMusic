//
//  YSHYFragmentView.swift
//  YSHYSwiftMusic
//
//  Created by 杨淑园 on 2017/4/14.
//  Copyright © 2017年 yangshuyaun. All rights reserved.
//

import UIKit
import Foundation

protocol YSHYFragmentViewDelegte {
    func clickYSHYFragmentBtn(index:NSInteger)
}


class YSHYFragmentView:UIView ,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate{
    
    let BTN_TAG = 10086
    var topView:UIView?
    var titels:[String]?
    var lineView:UIView?
    var myScrollView:UIScrollView?
    var delgate:YSHYFragmentViewDelegte?
    var titleBtns:[UIButton]?
    var currentBtn:UIButton?
    
    var btnWidth:CGFloat?
    
    init(titles:[String],frame:CGRect)
    {
        super.init(frame: frame)
        self.titels = titles
        self.titleBtns = []
        self.btnWidth = CONTEXTWIDTH/CGFloat((self.titels!.count))
        self.creatUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func creatUI() -> Void {
        
        self.topView = UIView.init(frame: CGRect(x: 0, y: 0, width: CONTEXTWIDTH, height: 41))
        self.topView?.backgroundColor = YSHY_Color_BackGround_1
        self.addSubview(self.topView!)

        self.lineView = UIView.init(frame: CGRect(x: 10, y: 40, width: self.btnWidth!  - 20, height: 1))
        lineView?.backgroundColor = UIColor.red
        self.addSubview(lineView!)
        
        for i in (0 ..< self.titels!.count)  {
            let btn:UIButton = UIButton(frame: CGRect(x: self.btnWidth! * CGFloat(i), y: 0, width: self.btnWidth! , height: 41))
            self.topView?.addSubview(btn)
            btn.setTitle(self.titels![i], for: UIControlState.normal)
            btn.tag = BTN_TAG + i
            btn.titleLabel?.font = YSHY_Font_Sys(14)
            btn.addTarget(self, action: #selector(btnClick(sender:)), for:UIControlEvents.touchUpInside)
            self.titleBtns?.append(btn)
            if(i == 0)
            {
                btn.setTitleColor(UIColor.red, for: UIControlState.normal)
                currentBtn = btn
            }
            else
            {
                btn.setTitleColor(UIColor.black, for: UIControlState.normal)
            }
        }
        let height:CGFloat = self.bounds.size.height - 41
        
        self.myScrollView = UIScrollView.init(frame: CGRect(x: 0, y: 41, width: CONTEXTWIDTH, height: height))
        self.myScrollView?.delegate = self
        self.myScrollView?.isPagingEnabled = true
        self.myScrollView?.contentSize = CGSize(width: CONTEXTWIDTH * CGFloat(self.titels!.count), height: height)
        self.myScrollView?.showsHorizontalScrollIndicator = false
        self.myScrollView?.showsVerticalScrollIndicator = false
        self.addSubview(self.myScrollView!)
        
        
        for i in (0 ..< self.titels!.count)  {
            let tableView:UITableView = UITableView(frame: CGRect(x: CONTEXTWIDTH * CGFloat(i), y: 0, width: CONTEXTWIDTH, height: height))
            self.myScrollView?.addSubview(tableView)
            tableView.delegate = self
            tableView.dataSource = self
            if(i%2 == 0)
            {
                tableView.backgroundColor = UIColor.red
            }
        }
    }
    
    func btnClick(sender:UIButton) -> Void {
        let index = sender.tag - BTN_TAG
        self.resetLineViewFrame(index: index)
        self.delgate?.clickYSHYFragmentBtn(index: tag)
        let offsetY:CGFloat = (self.myScrollView?.contentOffset.y)!
        self.myScrollView?.contentOffset = CGPoint(x: CONTEXTWIDTH * CGFloat(index), y: offsetY)
    }
    
    func resetLineViewFrame(index:NSInteger) -> Void {
        
        UIView.animate(withDuration: 0.5) { 
            var frame:CGRect = (self.lineView?.frame)!
            let x :CGFloat = self.btnWidth! * CGFloat(index) + CGFloat(10)
            frame.origin.x = x
            self.lineView?.frame = frame
        }
        currentBtn?.setTitleColor(UIColor.black, for: UIControlState.normal)
        let btn:UIButton = titleBtns![index]
        btn.setTitleColor(UIColor.red, for: UIControlState.normal)
        currentBtn = btn
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell.init()
        return cell
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let index:CGFloat = scrollView.contentOffset.x / CONTEXTWIDTH
        self.resetLineViewFrame(index: NSInteger(index))
    }
    
}
