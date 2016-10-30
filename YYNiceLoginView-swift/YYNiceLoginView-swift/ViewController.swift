//
//  ViewController.swift
//  YYNiceLoginView-swift
//
//  Created by Arvin on 16/10/30.
//  Copyright © 2016年 Arvin. All rights reserved.
//

import UIKit

/// 全局常量
let WIDTH = UIScreen.main.bounds.size.width
let HEIGHT = UIScreen.main.bounds.size.height

/// 枚举
///
/// - None:     无
/// - Username: 用户名输入框
/// - Password: 用户密码输入框
public enum ShowTextFieldType: Int {
    case None     = 0
    case Username = 1
    case Password = 2
}

class ViewController: UIViewController {
    
    let usernameField = UITextField()
    let passwordField = UITextField()
    
    let usernameIcon = UIImageView()
    let passwordIcon = UIImageView()
    
    var showType = ShowTextFieldType.None
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.addSubview(headerImgView)
        self.view.addSubview(backgroundView)
        
        headerImgView.addSubview(leftHandImage)
        headerImgView.addSubview(rightHandImage)
        
        self.view.addSubview(leftFistImage)
        self.view.addSubview(rightFistImage)
        
        /// 用户名输入框
        usernameField.frame = CGRect(x: 20, y: 30, width: backgroundView.w - 40, height: 44)
        usernameField.delegate = self
        usernameField.placeholder = "请输入用户名"
        usernameField.font = UIFont.systemFont(ofSize: 16)
        usernameField.returnKeyType = UIReturnKeyType.next
        usernameField.borderStyle = UITextBorderStyle.roundedRect
        usernameField.clearButtonMode = UITextFieldViewMode.whileEditing
        
        usernameField.leftView = UIView.init(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        usernameField.leftViewMode = UITextFieldViewMode.always
        
        usernameIcon.frame = CGRect(x: 11, y: 11, width: 22, height: 22)
        usernameIcon.image = UIImage(named: "username-icon")
        usernameField.leftView?.addSubview(usernameIcon)
        backgroundView.addSubview(usernameField)
        
        /// 用户密码输入框
        passwordField.frame = CGRect(x: 20, y: 90, width: backgroundView.w - 40, height: 44)
        passwordField.delegate = self
        passwordField.isSecureTextEntry = true
        passwordField.placeholder = "请输入用户密码"
        passwordField.font = UIFont.systemFont(ofSize: 16)
        passwordField.returnKeyType = UIReturnKeyType.done
        passwordField.borderStyle = UITextBorderStyle.roundedRect
        passwordField.clearButtonMode = UITextFieldViewMode.whileEditing
        
        passwordField.leftView = UIView.init(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        passwordField.leftViewMode = UITextFieldViewMode.always
        
        passwordIcon.frame = CGRect(x: 11, y: 11, width: 22, height: 22)
        passwordIcon.image = UIImage(named: "password-icon")
        passwordField.leftView?.addSubview(passwordIcon)
        backgroundView.addSubview(passwordField)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: 控件懒加载
    private lazy var headerImgView: UIImageView = {
        let headerImgView = UIImageView()
        headerImgView.frame = CGRect(x: WIDTH * 0.5 - 105, y: 101, width: 211, height: 108)
        headerImgView.image = UIImage(named: "owl-login-header")
        return headerImgView
    }()
    
    private lazy var backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.frame = CGRect(x: 30, y: 200, width: WIDTH - 60, height: 160)
        backgroundView.backgroundColor = UIColor.white
        backgroundView.layer.cornerRadius = 5
        backgroundView.layer.masksToBounds = true
        backgroundView.layer.borderWidth = 0.5
        backgroundView.layer.borderColor = UIColor.lightGray.cgColor
        return backgroundView
    }()
    
    lazy var leftHandImage: UIImageView = {
        let leftHandImage = UIImageView()
        leftHandImage.frame = CGRect(x: 1, y: 90, width: 40, height: 65)
        leftHandImage.image = UIImage(named: "owl-login-arm-left")
        return leftHandImage
    }()
    
    lazy var  rightHandImage: UIImageView = {
        let rightHandImage = UIImageView()
        rightHandImage.frame = CGRect(x: self.headerImgView.w * 0.5 + 65, y: 90, width: 40, height: 65)
        rightHandImage.image = UIImage(named: "owl-login-arm-right")
        return rightHandImage
    }()
    
    lazy var leftFistImage: UIImageView = {
        let leftFistImage = UIImageView()
        leftFistImage.frame = CGRect(x: WIDTH * 0.5 - 100, y: self.backgroundView.y - 22, width: 40, height: 40)
        leftFistImage.image = UIImage(named: "owl-login-hand")
        return leftFistImage
    }()
    
    lazy var rightFistImage: UIImageView = {
        let rightFistImage = UIImageView()
        rightFistImage.frame = CGRect(x: WIDTH * 0.5 + 62, y: self.backgroundView.y - 22, width: 40, height: 40)
        rightFistImage.image = UIImage(named: "owl-login-hand")
        return rightFistImage
    }()
}


// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    
    /// became first responder
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        // print("\(textField)")
        
        if textField.isEqual(self.usernameField) {
            
            if showType != ShowTextFieldType.Password {
                showType = ShowTextFieldType.Username
                return
            }
            showType = ShowTextFieldType.Username
            
            UIView.animate(withDuration: 0.35, animations: {
                // 左手掌
                self.leftHandImage.frame = CGRect(x: self.leftHandImage.x - 60,
                                                  y: self.leftHandImage.y + 30,
                                                  width: self.leftHandImage.w,
                                                  height: self.leftHandImage.h)
                // 右手掌
                self.rightHandImage.frame = CGRect(x: self.rightHandImage.x + 55,
                                                   y: self.rightHandImage.y + 30,
                                                   width: self.rightHandImage.w,
                                                   height: self.rightHandImage.h)
                // 左拳头
                self.leftFistImage.frame = CGRect(x: self.leftFistImage.x - 70,
                                                  y: self.leftFistImage.y,
                                                  width: 40, height: 40)
                // 右拳头
                self.rightFistImage.frame = CGRect(x: self.rightFistImage.x + 30,
                                                   y: self.rightFistImage.y,
                                                   width: 40, height: 40)
            })
        } else if textField.isEqual(self.passwordField) {
            
            if showType == ShowTextFieldType.Password {
                showType = ShowTextFieldType.Password
                return
            }
            showType = ShowTextFieldType.Password
            
            UIView.animate(withDuration: 0.35, animations: {
                // 左手掌
                self.leftHandImage.frame = CGRect(x: self.leftHandImage.x + 60,
                                                  y: self.leftHandImage.y - 30,
                                                  width: self.leftHandImage.w,
                                                  height: self.leftHandImage.h)
                // 右手掌
                self.rightHandImage.frame = CGRect(x: self.rightHandImage.x - 55,
                                                   y: self.rightHandImage.y - 30,
                                                   width: self.rightHandImage.w,
                                                   height: self.rightHandImage.h)
                // 左拳头
                self.leftFistImage.frame = CGRect(x: self.leftFistImage.x + 70,
                                                  y: self.leftFistImage.y,
                                                  width: 0, height: 0)
                // 右拳头
                self.rightFistImage.frame = CGRect(x: self.rightFistImage.x - 30,
                                                   y: self.rightFistImage.y,
                                                   width: 0, height: 0)
            })
        }
    }
    
    
    /// called when 'return' key pressed. return NO to ignore.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.isEqual(self.usernameField) {
            self.passwordField.becomeFirstResponder()
        } else {
            self.passwordField.resignFirstResponder()
        }
        return true
    }
}
