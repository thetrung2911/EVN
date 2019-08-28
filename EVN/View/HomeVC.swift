//
//  HomeVC.swift
//  EVN
//
//  Created by Trung Le on 8/24/19.
//  Copyright © 2019 Trung Le. All rights reserved.
//

import UIKit
import Stevia

class HomeVC: UIViewController {
    let tableView = UITableView()
    var topHeight: CGFloat = 0
    var bottomHeight: CGFloat = 0
    var barHeight: CGFloat = 0
    
    let cellID = "cell"
    var items = [Item]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Thoát", style: .done, target: self, action: #selector(onSingOut))
        view.backgroundColor = .white
        title = "EVN VC"
        print(MainScreen.uers)
        createData()
        // tính chiều cao navigation bar
        barHeight = navigationController?.navigationBar.frame.height ?? 0.0
        
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.keyWindow
            
            // tính chiều cao phần ngoài safe area
            topHeight = window?.safeAreaInsets.top ?? 0.0
            bottomHeight = window?.safeAreaInsets.bottom ?? 0.0
        }
        setupTableView()
    }
    @objc func onSingOut(){
        let singIn = MainScreen()
//        JanuaryVC.tongVnd = 0
        self.present(singIn, animated: true, completion: nil)
        
    }
    func createData(){
        let item1 = Item(tille: "Tháng 1", service: "Tiền điện theo số Kwh", photo: UIImage(named: "nen1"), identifier: "JanuaryVC")
        let item2 = Item(tille: "Tháng 2", service: "Địa điểm nạp tiền điện", photo: UIImage(named: "nen1"), identifier: "SearchVC")
        let item3 = Item(tille: "Tháng 3", service: "Địa điểm nạp tiền điện", photo: UIImage(named: "nen1"), identifier: "SearchVC")
        let item4 = Item(tille: "Tháng 4", service: "Địa điểm nạp tiền điện", photo: UIImage(named: "nen1"), identifier: "SearchVC")
        let item5 = Item(tille: "Tháng 5", service: "Địa điểm nạp tiền điện", photo: UIImage(named: "nen1"), identifier: "SearchVC")
        let item6 = Item(tille: "Tháng 6", service: "Địa điểm nạp tiền điện", photo: UIImage(named: "nen1"), identifier: "SearchVC")
        
        items = [item1, item2, item3, item4, item5, item6]
    }
//    override func viewWillAppear(_ animated: Bool) {
//        self.navigationController?.navigationBar.isHidden = true
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        self.navigationController?.navigationBar.isHidden = false
//    }
//    
    func setupTableView(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.sv(tableView)
        tableView.Top == view.safeAreaLayoutGuide.Top + 8
        tableView.left(0).right(0).bottom(0)
        
        tableView.delegate = (self as! UITableViewDelegate)
        tableView.dataSource = (self as! UITableViewDataSource)
        
        tableView.register(CustomCell.self, forCellReuseIdentifier: cellID)
        
        
        
        tableView.rowHeight = 215
//        // tắt chế độ nảy của scroll
        tableView.bounces = false
//        // gán cho table footer view bằng một UIView trắng
//        tableView.tableFooterView = UIView()
        
        tableView.separatorStyle = .none
        
        
    }
    

}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    // hàm này trả về số dòng trong một section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    // hàm trả về nội dung của một cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! CustomCell
        
        // gán giá trị cho các thành phần trong cell
        cell.photoImageView.image = items[indexPath.row].photo
        cell.nameLabel.text = items[indexPath.row].tille
        cell.serviceLabel.text = items[indexPath.row].service
        
        return cell
    }
    
    
    // hàm chọn cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        let appName = Bundle.main.infoDictionary![kCFBundleNameKey as String] as! String
        let identifier = appName + "." + item.identifier
        let ViewControllerClass = NSClassFromString(identifier) as! UIViewController.Type
        
        let detailScreen = ViewControllerClass.init()
        detailScreen.title = item.tille
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.pushViewController(detailScreen, animated: true)
        
    }
}
