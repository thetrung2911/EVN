//
//  Data.swift
//  EVN
//
//  Created by Trung Le on 8/24/19.
//  Copyright © 2019 Trung Le. All rights reserved.
//

import Foundation
import UIKit

struct Item {
    var tille: String
    var service: String
    var photo: UIImage?
    var identifier: String
}

struct Item1 {
    var name: String
    var money: String
}
struct Users {
    var id: String
    var pass: String
    var adr: String
    var items: [Item1]
    var tongKw: Int
    var tongtien: Int
}
