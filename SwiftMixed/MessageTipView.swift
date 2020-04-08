//
//  MessageTipView.swift
//  SwiftMixed
//
//  Created by 赵琛 on 2020/4/8.
//  Copyright © 2020 赵琛. All rights reserved.
//

import UIKit

class MessageTipView: UIView {
    
    /// 高亮文案
    private var highlightArray : [String]!
    /// 显示时长
    private var showTime = 10
    
    private var timer : Timer?
    
    private var proxy : tebonProxy?
    
    //MARK:-life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        highlightArray = ["是或者不是","是或不是","打开麦克风","打开权限","声音大一点","远一点","远一点"];
        self.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 0)
        createUI();
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:-extern
    
    //加了@objc才可以在OC文件中调用方法
    @objc func show(message:String!,superViewHeight:CGFloat){
        
        if message.count == 0{
            return
        }
        //高度
        let messageHeight = getLbHeight(message: message, limitWidth: self.tebon_w-40)
        if messageHeight > 106 {
            self.tebon_h = messageHeight+100
        }else{
            self.tebon_h = 158
        }
        
        self.tebon_y = superViewHeight
        self.messageLb.tebon_h = messageHeight;
        
        //包含特殊字符需要高亮显示
        let attrText = NSMutableAttributedString.init(string: message!)
        for highlightText in self.highlightArray {
            let range : NSRange = (message as NSString).range(of: highlightText)
            if range.location != NSNotFound {
                attrText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.init(hex: "#FF893E") as Any, range: range)
            }
        }
        
        self.messageLb.attributedText = attrText
        
        UIView.animate(withDuration: 0.5, animations: {
            self.tebon_y = superViewHeight - self.tebon_h
        }) { (finished) in
            self.createTimer()
        }
            
    }
    
    //MARK:-private m
    
    /// 创建UI
    private func createUI(){
        self.clipsToBounds = true
        self.backgroundColor = UIColor.init(hex: "#000000").withAlphaComponent(0.5)
        self.addSubview(inputtingLb)
        self.addSubview(messageLb)
    }
    
    /// 根据文字长度计算Label高度
    /// - Parameters:
    ///   - message: 文字长度
    ///   - limitWidth: 最大宽度
    private func  getLbHeight(message:String!,limitWidth:CGFloat) -> CGFloat{
        
        let attrs = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 24)]
        let maxSize = CGSize.init(width: limitWidth, height: CGFloat(MAXFLOAT))
        let options = NSStringDrawingOptions.usesLineFragmentOrigin.rawValue | NSStringDrawingOptions.usesFontLeading.rawValue
        let size = (message as NSString).boundingRect(with: maxSize, options: NSStringDrawingOptions(rawValue: options), attributes: attrs, context: nil).size
        return CGFloat(ceilf(Float(size.height)))
    }
    
    
    /// 创建定时器
    private func createTimer(){
        self.showTime = 10;
        if self.timer != nil {
            self.timer?.invalidate();
            self.timer = nil
            self.proxy = nil
        }
        
        self.proxy = tebonProxy.alloc();
        self.proxy?.target = self
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self.proxy!, selector: #selector(timeCount), userInfo: nil, repeats: true)
        self.timer?.fire()
    }
    
    
    /// 计时
    @objc private func timeCount(){
        self.showTime -= 1
        if(self.showTime == 0){
            self.timer?.invalidate()
            self.dismiss()
        }
    }
    
    /// 消失
    private func dismiss() {
        UIView.animate(withDuration: 0.5, animations: {
            self.tebon_y = self.tebon_y + self.tebon_h
        }, completion: nil)
    }
    
    //MARK:-lazy
    
    private lazy var inputtingLb : UILabel = {
        let inputtingLb = UILabel()
        inputtingLb.frame = CGRect.init(x: 20, y: 10, width: 200, height: 22);
        inputtingLb.textColor = UIColor.init(hex: "#999999")
        inputtingLb.font = UIFont.systemFont(ofSize: 16)
        inputtingLb.text = "客服正在输入...";
        return inputtingLb
    }()
    
    private lazy var messageLb : UILabel = {
        let messageLb = UILabel();
        messageLb.frame = CGRect.init(x: 20, y: 42, width: self.tebon_w-40, height: 0);
        messageLb.textColor = UIColor.init(hex: "#FFFFFF");
        messageLb.font = UIFont.systemFont(ofSize: 24);
        messageLb.numberOfLines = 0;
        return messageLb;
    }()
    
}
