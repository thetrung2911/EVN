//
//  calculateVC.swift
//  EVN
//
//  Created by Trung Le on 8/24/19.
//  Copyright © 2019 Trung Le. All rights reserved.
//

import UIKit
import Stevia

class CalculateVC: UIViewController,UINavigationControllerDelegate {
    var name = UITextField()
    var capacity = UITextField()
    var time = UITextField()
    var traCuu = UIButton()
//    var passObject: ((Item1) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Thêm thiết bị"
        view.sv(name,capacity,time, traCuu)
        autoLayoutName()
        autoLayoutCapacity()
        autoLayoutTime()
        autoLayoutTraCuu()
        
    }
    fileprivate func autoLayoutName(){
        name.Top == view.safeAreaLayoutGuide.Top + 16
        name.centerHorizontally().width(80%).height(50)
        
        name.borderStyle = UITextField.BorderStyle.roundedRect
        name.layer.borderColor = UIColor(red:0.06, green:0.05, blue:0.65, alpha:1.0).cgColor
        name.layer.borderWidth = 2
        name.layer.cornerRadius = 10
        name.tintColor = .darkGray
        name.textColor = .gray
        name.placeholder = "Tên thiết bị"
    }
    fileprivate func autoLayoutCapacity(){
        capacity.Top == name.Bottom + 16
        capacity.centerHorizontally().width(80%).height(50)
        
        capacity.borderStyle = UITextField.BorderStyle.roundedRect
        capacity.layer.borderColor = UIColor(red:0.06, green:0.05, blue:0.65, alpha:1.0).cgColor
        capacity.layer.borderWidth = 2
        capacity.layer.cornerRadius = 10
        capacity.tintColor = .darkGray
        capacity.textColor = .gray
        capacity.placeholder = "Công suất tiêu thụ"
    }
    fileprivate func autoLayoutTime(){
        time.Top == capacity.Bottom + 16
        time.centerHorizontally().width(80%).height(50)
        
        time.borderStyle = UITextField.BorderStyle.roundedRect
        time.layer.borderColor = UIColor(red:0.06, green:0.05, blue:0.65, alpha:1.0).cgColor
        time.layer.borderWidth = 2
        time.layer.cornerRadius = 10
        time.tintColor = .darkGray
        time.textColor = .gray
        time.placeholder = "Tổng thời gian tiêu thụ"
    }
    
    fileprivate func autoLayoutTraCuu(){
        traCuu.centerHorizontally().width(60%).height(40).Top == time.Bottom + 16
        traCuu.backgroundColor = UIColor(red:0.06, green:0.05, blue:0.65, alpha:1.0)
        traCuu.setTitle("Thêm", for: .normal)
        traCuu.titleLabel?.font = .boldSystemFont(ofSize: 18)
        traCuu.layer.cornerRadius = 10
        traCuu.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTraCuu)))
    }
    
    @objc func onTraCuu(){
        var tongtien = 0
        MainScreen.uers[MainScreen.ids].tongKw += Int(time.text!)! * Int(capacity.text!)!
        switch MainScreen.uers[MainScreen.ids].tongKw {
        case 0...50:
            tongtien = MainScreen.uers[MainScreen.ids].tongKw * 1678
        case 51...100:
            tongtien = (MainScreen.uers[MainScreen.ids].tongKw - 50) * 1734 + 50 * 1678
        case 101...200:
            tongtien = (MainScreen.uers[MainScreen.ids].tongKw - 100) * 2014 + 50 * 1734 + 50 * 1678
        case 201...300:
            tongtien = (MainScreen.uers[MainScreen.ids].tongKw - 200) * 2536 + 100 * 2014 + 50 * 1734 + 50 * 1678
        case 301...400:
            tongtien = (MainScreen.uers[MainScreen.ids].tongKw - 300) * 2834 + 100 * 2536 + 100 * 2014 + 50 * 1734 + 50 * 1678
        default:
            tongtien = (MainScreen.uers[MainScreen.ids].tongKw - 400) * 2927 + 100 * 2834 + 100 * 2536 + 100 * 2014 + 50 * 1734 + 50 * 1678
        }
        MainScreen.uers[MainScreen.ids].tongtien = tongtien
        JanuaryVC.vnd.text = String(MainScreen.uers[MainScreen.ids].tongtien)
        MainScreen.uers[MainScreen.ids].items.append(Item1(name: name.text!, money: String(Int(time.text!)! * Int(capacity.text!)!)))
        navigationController?.popViewController(animated: true)
    }
    


}
