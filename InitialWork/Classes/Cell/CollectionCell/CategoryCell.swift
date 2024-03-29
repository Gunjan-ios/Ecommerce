//
//  CategoryCell.swift
//  InitialWork
//
//  Created by Gunjan on 12/09/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    @IBOutlet weak var img_Category: UIImageView!
    @IBOutlet weak var name : mediumLabel!
    
    static let Subcategories =  [
        SubCategory (imageName:"smartphone" , Cat_name: "Mobiles,Computer", Subcategoryname: "Mobile phones, Power Banks, Cases & Cover", isexpand: true, SubCategoryData: [Category.init(imageName: "p1", name:"Mobiles"),Category.init (imageName: "PowerBanks", name: "Power Banks"),Category.init (imageName: "Cases", name: "Cases & Cover")]),
        SubCategory (imageName:"MenFashion" , Cat_name: "Men's Fashion", Subcategoryname: "Clothing, Shoes, Wallets", isexpand: false, SubCategoryData: [Category.init(imageName: "MenFashion", name:"Clothing"),Category.init (imageName: "Shoes", name: "Shoes"),Category.init (imageName: "Wallets", name: "Wallets")]),
        SubCategory (imageName:"WomenFashion" , Cat_name: "Women's Fashion", Subcategoryname: "Clothing, Watches, Handbags", isexpand: false, SubCategoryData: [Category.init(imageName: "WomenFashion", name:"Clothing"),Category.init (imageName: "Watches", name: "Watches"),Category.init (imageName: "Handbags", name: "Handbags")]),
        SubCategory (imageName:"kitchen" , Cat_name: "Home,Kitchen", Subcategoryname: "Furnitures, Home Decor, Home Improvement", isexpand: false, SubCategoryData: [Category.init(imageName: "fur", name:"Furnitures"),Category.init (imageName: "Home Decor", name: "Home Decor"),Category.init (imageName: "garden", name: "Garden & Outdoors")]),]
    
  static  let categories =   [
        Category.init (imageName:"smartphone" , name: "Mobiles"),
        Category.init (imageName: "cate_fashion_men", name: "Men's Fashion"),
        Category.init (imageName:"cate_fashion_women" , name: "Women's Fashion"),
        Category.init (imageName: "cate_tv", name: "TVs, ACs & Appliances"),
        Category.init (imageName: "cate_laptop", name: "Laptops & PCs"),
        Category.init (imageName: "cate_kitchen", name: "Home & Kitchen"),
        Category.init (imageName: "cate_toy_shop", name: "Kids & Toys Store"),
        Category.init (imageName:"cate_beauty" , name: "Beauty & Grooming"),
        Category.init (imageName: "cate_motorcycle", name: "Cars & Bikes")
    ]


    override func awakeFromNib() {
//        layer.cornerRadius = 8.0
//        layer.borderColor = UIColor.gray.cgColor
//        layer.borderWidth = 0.5
        
        layer.cornerRadius = 8.0
        layer.borderColor = UIColor.clear.cgColor
        layer.masksToBounds = true
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = .zero
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 0.4
        layer.masksToBounds = false
//        layer.shadowPath = UIBezierPath(roundedRect:bounds, cornerRadius:layer.cornerRadius).cgPath

    }
}
struct Category {
    let imageName: String!
    let name: String!
}

class SubCategoryHeaderView: UICollectionReusableView {
    @IBOutlet weak var Subcategoryname: UILabel!
    @IBOutlet weak var img_Category: UIImageView!
    @IBOutlet weak var name : BoldLabel!
    @IBOutlet weak var btn_section: UIButton!
    @IBOutlet weak var btn_arrow: UIButton!
    
}
struct SubCategory {
    var imageName = String()
    var Cat_name = String()
    var Subcategoryname = String()
    var isexpand = Bool()
    var SubCategoryData = [Category]()
}
let categories =   [
    Category.init (imageName:"smartphone" , name: "Mobiles"),
    Category.init (imageName: "cate_fashion_men", name: "Men's Fashion"),
    Category.init (imageName:"cate_fashion_women" , name: "Women's Fashion"),
    Category.init (imageName: "cate_tv", name: "TVs, ACs & Appliances"),
    Category.init (imageName: "cate_laptop", name: "Laptops & PCs"),
    Category.init (imageName: "cate_kitchen", name: "Home & Kitchen"),
    Category.init (imageName: "cate_toy_shop", name: "Kids & Toys Store"),
    Category.init (imageName:"cate_beauty" , name: "Beauty & Grooming"),
    Category.init (imageName: "cate_motorcycle", name: "Cars & Bikes")
]


//class Sub_category{
//
//    func DataLoad() -> [SubCategory] {
//
//        return Subcategories
//    }
//
//}
