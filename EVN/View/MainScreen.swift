//
//  MainScreen.swift
//  EVN
//
//  Created by Trung Le on 8/23/19.
//  Copyright © 2019 Trung Le. All rights reserved.
//

import UIKit
import Stevia

class MainScreen: UIViewController {
    var logo = UIImageView()
    var Id = UITextField()
    var Pass = UITextField()
    var SingIn = UIButton()
    var SingUp = UIButton()
    var Forgot = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.sv(logo,Id,Pass,SingIn,Forgot,SingUp)
        autoLayoutLogo()
        autoLayoutId()
        autoLayoutPass()
        autoLayoutSingIn()
        autoLayoutForgot()
        autoLayoutSingUp()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapView(_:)))
        view.addGestureRecognizer(gesture)
    }
    @objc func tapView(_ gesture: UITapGestureRecognizer) {
        self.Id.endEditing(true)
        self.Pass.endEditing(true)
    }
    
    fileprivate func autoLayoutLogo(){
        logo.image = UIImage(named: "EVN")
        
        logo.Top == view.safeAreaLayoutGuide.Top
        logo.centerHorizontally().width(120%).Height == logo.Width/2
        
    }
    fileprivate func autoLayoutId(){
//        Id.backgroundColor = .gray
        Id.Top == logo.Bottom
        Id.centerHorizontally().width(80%).height(50)
        
        Id.borderStyle = UITextField.BorderStyle.roundedRect
        Id.layer.borderColor = UIColor(red:0.06, green:0.05, blue:0.65, alpha:1.0).cgColor
        Id.layer.borderWidth = 2
        Id.layer.cornerRadius = 10
        Id.tintColor = .darkGray
        Id.textColor = .gray
        Id.placeholder = "Mã khách hàng"
    }
    fileprivate func autoLayoutPass(){
        Pass.Top == Id.Bottom + 16
        Pass.centerHorizontally().width(80%).height(50)
        
        Pass.borderStyle = UITextField.BorderStyle.roundedRect
        Pass.layer.borderColor = UIColor(red:0.06, green:0.05, blue:0.65, alpha:1.0).cgColor
        Pass.layer.borderWidth = 2
        Pass.layer.cornerRadius = 10
        Pass.tintColor = .darkGray
        Pass.textColor = .gray
        Pass.placeholder = "Nhập mật khẩu"
        Pass.isSecureTextEntry = true
    }
    fileprivate func autoLayoutSingIn(){
        SingIn.centerHorizontally().width(60%).height(40).Top == Pass.Bottom + 16
        SingIn.backgroundColor = UIColor(red:0.06, green:0.05, blue:0.65, alpha:1.0)
        SingIn.setTitle("Đăng Nhập", for: .normal)
        SingIn.titleLabel?.font = .boldSystemFont(ofSize: 18)
        SingIn.layer.cornerRadius = 10
        SingIn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onSingIn)))

    }
    fileprivate func autoLayoutForgot(){        Forgot.centerHorizontally().width(60%).height(40).Top == SingIn.Bottom + 8
        Forgot.setTitle("Quên mật khẩu?", for: .normal)
        Forgot.titleLabel?.font = .systemFont(ofSize: 18)
        Forgot.setTitleColor(UIColor.red, for: .normal)
        Forgot.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onForgot)))
    }
    fileprivate func autoLayoutSingUp(){
        SingUp.centerHorizontally().width(60%).height(40).Bottom == view.safeAreaLayoutGuide.Bottom - 16
        SingUp.backgroundColor = UIColor(red:0.06, green:0.05, blue:0.65, alpha:1.0)
        SingUp.setTitle("Đăng ký sử dụng điện", for: .normal)
        SingUp.titleLabel?.font = .systemFont(ofSize: 18)
        SingUp.layer.cornerRadius = 10
        SingUp.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onSingUp)))
    }
    
    @objc func onSingIn(){
        let Home = HomeVC()
        let navigationVC = UINavigationController(rootViewController: Home)
        present(navigationVC, animated: true, completion: nil)
    }
    @objc func onSingUp(){
        let SingUp = SingUpVC()
        let navigationVC = UINavigationController(rootViewController: SingUp)
//        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        present(navigationVC, animated: true, completion: nil)
    }
    @objc func onForgot(){
        print("Forgot")
    }
    

}
