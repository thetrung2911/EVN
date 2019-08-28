//
//  SingUpVC.swift
//  EVN
//
//  Created by Trung Le on 8/24/19.
//  Copyright © 2019 Trung Le. All rights reserved.
//

import UIKit
import Stevia
class SingUpVC: UIViewController {
    var Id = UITextField()
    var Address = UITextField()
    var Pass = UITextField()
    var RePass = UITextField()
    var SingUp = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Đăng Ký"
        view.sv(Id,Address,Pass,RePass,SingUp)
        autoLayoutID()
        autoLayoutAddress()
        autoLayoutPass()
        autoLayoutRePass()
        autoLayoutSingUp()
    }
    
    fileprivate func autoLayoutID(){
        Id.Top == view.safeAreaLayoutGuide.Top + 16
        Id.centerHorizontally().width(80%).height(50)
        
        Id.borderStyle = UITextField.BorderStyle.roundedRect
        Id.layer.borderColor = UIColor(red:0.06, green:0.05, blue:0.65, alpha:1.0).cgColor
        Id.layer.borderWidth = 2
        Id.layer.cornerRadius = 10
        Id.tintColor = .darkGray
        Id.textColor = .gray
        Id.placeholder = "Mã khách hàng"
    }
    fileprivate func autoLayoutAddress(){
        Address.Top == Id.Bottom + 16
        Address.centerHorizontally().width(80%).height(50)
        
        Address.borderStyle = UITextField.BorderStyle.roundedRect
        Address.layer.borderColor = UIColor(red:0.06, green:0.05, blue:0.65, alpha:1.0).cgColor
        Address.layer.borderWidth = 2
        Address.layer.cornerRadius = 10
        Address.tintColor = .darkGray
        Address.textColor = .gray
        Address.placeholder = "Địa chỉ"
    }
    fileprivate func autoLayoutPass(){
        Pass.Top == Address.Bottom + 16
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
    fileprivate func autoLayoutRePass(){
        RePass.Top == Pass.Bottom + 16
        RePass.centerHorizontally().width(80%).height(50)
        
        RePass.borderStyle = UITextField.BorderStyle.roundedRect
        RePass.layer.borderColor = UIColor(red:0.06, green:0.05, blue:0.65, alpha:1.0).cgColor
        RePass.layer.borderWidth = 2
        RePass.layer.cornerRadius = 10
        RePass.tintColor = .darkGray
        RePass.textColor = .gray
        RePass.placeholder = "Nhập lại mật khẩu"
        RePass.isSecureTextEntry = true
    }
    fileprivate func autoLayoutSingUp(){
        SingUp.centerHorizontally().width(60%).height(40).Top == RePass.Bottom + 16
        SingUp.backgroundColor = UIColor(red:0.06, green:0.05, blue:0.65, alpha:1.0)
        SingUp.setTitle("Đăng Ký", for: .normal)
        SingUp.titleLabel?.font = .boldSystemFont(ofSize: 18)
        SingUp.layer.cornerRadius = 10
        SingUp.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onSingUp)))
    }
    @objc func onSingUp(){
        
        MainScreen.uers.append(Users(id: Id.text!, pass: Pass.text!, adr: Address.text!,items: [],tongKw: 0, tongtien: 0))
        MainScreen.ids = MainScreen.uers.count - 1
        let alert = UIAlertController(title: "Chúc Mừng", message: "Bạn đã đăng ký thành công!!!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            let Home = HomeVC()
            let navigationVC = UINavigationController(rootViewController: Home)
            self.present(navigationVC, animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }

}
