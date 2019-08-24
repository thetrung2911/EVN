//
//  CustomCell.swift
//  EVN
//
//  Created by Trung Le on 8/24/19.
//  Copyright © 2019 Trung Le. All rights reserved.
//

import UIKit
import Stevia

class CustomCell: UITableViewCell {
    
    let contenerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.layer.borderWidth = 2
        view.layer.cornerRadius = 20
        return view
    }()
    
    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "EVN")
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "EVN"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    let serviceLabel: UILabel = {
        let label = UILabel()
        label.text = "EVN"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    func setupLayout(){
        self.sv(contenerView)
    
        contenerView.top(8).bottom(8).left(8).right(8)
        
        contenerView.sv(photoImageView,serviceLabel,nameLabel)
        photoImageView.centerHorizontally().top(0).bottom(0)
        
        serviceLabel.left(16).bottom(10%)
        serviceLabel.textColor = .white
        
        nameLabel.left(16).bottom(20%)
        nameLabel.textColor = .white
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "cell")
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
