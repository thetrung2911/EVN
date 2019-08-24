//
//  JanuaryVC.swift
//  EVN
//
//  Created by Trung Le on 8/24/19.
//  Copyright © 2019 Trung Le. All rights reserved.
//

import UIKit
import Stevia

class JanuaryVC: UIViewController {
    var topView = UIView()
    var bottomView = UIView()
    var tableView = UITableView()
    static var vnd = UILabel()
    static var tongVnd = Int()
    
    let cellID = "cell"
    static var items = [Item1]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onAddTap))
        createData()
        for i in JanuaryVC.items{
            JanuaryVC.tongVnd += Int(i.money)!
        }
        view.sv(topView,bottomView,tableView)
        autoLayoutTopView()
        autoLayoutBottomView()
        autoLayouttableView()
    }
    
    
    fileprivate func autoLayoutTopView(){
        let name = UILabel()
        let vnd = UILabel()
        
        //        topView.backgroundColor = .gray
        topView.Top == view.safeAreaLayoutGuide.Top
        topView.centerHorizontally().width(100%).height(60)
        topView.sv(name, vnd)
        
        name.text = "Tên thiết bị"
        name.centerVertically().left(16).right(35%)
        name.textAlignment = .center
        name.textColor = UIColor(red:0.06, green:0.05, blue:0.65, alpha:1.0)
        
        vnd.text = "Số tiền"
        vnd.centerVertically().left(70%).right(16)
        vnd.textAlignment = .center
        vnd.textColor = UIColor(red:0.06, green:0.05, blue:0.65, alpha:1.0)
        
    }
    fileprivate func autoLayoutBottomView(){
        let name = UILabel()
        
        bottomView.Bottom == view.safeAreaLayoutGuide.Bottom
        bottomView.centerHorizontally().width(100%).height(60)
        bottomView.sv(name,JanuaryVC.vnd)
        
        name.text = "Tổng tiền:"
        name.centerVertically().right(35%)
        name.textColor = UIColor(red:0.06, green:0.05, blue:0.65, alpha:1.0)
        
        JanuaryVC.vnd.text = String(JanuaryVC.tongVnd)
        JanuaryVC.vnd.centerVertically().left(70%)
        JanuaryVC.vnd.textColor = UIColor(red:0.06, green:0.05, blue:0.65, alpha:1.0)
    }
    fileprivate func autoLayouttableView(){
        tableView.left(0).right(0).Top == topView.Bottom
        tableView.Bottom == bottomView.Top
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(CustomCell1.self, forCellReuseIdentifier: cellID)
    }
    func createData(){
        let item = Item1(name: "Tủ lạnh", money: "100000")
        let item1 = Item1(name: "Máy giặt", money: "200000")
        let item2 = Item1(name: "Điều hoà", money: "1000000")
        JanuaryVC.items = [item,item1,item2]
    }
    
    
    @objc func onAddTap(){
        let secondVC = CalculateVC()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        secondVC.passObject = {
            [weak self] item in
            guard let strongSelf = self else {
                return
            }
            
            JanuaryVC.items.append(item)
            strongSelf.tableView.reloadData()
            print(item)
        }
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
    
}
extension JanuaryVC: UITableViewDelegate, UITableViewDataSource {
    // hàm này trả về số dòng trong một section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return JanuaryVC.items.count
    }
    
    // hàm trả về nội dung của một cell
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! CustomCell1
        
        // gán giá trị cho các thành phần trong cell
        cell.nameLabel.text = JanuaryVC.items[indexPath.row].name
        cell.vndLabel.text = JanuaryVC.items[indexPath.row].money
        
        return cell
    }
    
}
