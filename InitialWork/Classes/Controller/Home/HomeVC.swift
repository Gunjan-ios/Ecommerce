//
//  HomeVC.swift
//  InitialWork
//
//  Created by Gunjan on 04/09/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit
import UPCarouselFlowLayout

class HomeVC: ParentViewController,UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate {
    
    let Banner = [#imageLiteral(resourceName: "baner4"),#imageLiteral(resourceName: "baner1"),#imageLiteral(resourceName: "baner3"),#imageLiteral(resourceName: "baner2")]
    
     var items = [Product]()
     var list_category = [Category]()

    @IBOutlet weak var banner_collection: UICollectionView!
    
    @IBOutlet weak var newArrivalCollection: UICollectionView!
    
    @IBOutlet weak var categoryCollection: UICollectionView!
    
    
    @IBOutlet weak var scrl_view: UIScrollView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        banner_collection.delegate = self
        banner_collection.dataSource = self
        newArrivalCollection.delegate = self
        newArrivalCollection.dataSource = self
        categoryCollection.delegate = self
        categoryCollection.dataSource = self
        
         self.items = self.createItems()
        self.list_category = self.createListCategory()

        scrl_view.contentSize = CGSize (width: self.view.frame.width, height: 1500)
        let layout = UPCarouselFlowLayout()
        layout.itemSize = CGSize (width: banner_collection.frame.width-30, height: banner_collection.frame.height)
        banner_collection.collectionViewLayout = layout

        layout.sideItemScale = 0.8
        layout.scrollDirection = .horizontal
        layout.spacingMode = UPCarouselFlowLayoutSpacingMode.overlap(visibleOffset: 10)
        // Do any additional setup after loading the view.
    }
    fileprivate func createItems() -> [Product] {
        let Products = [
            Product.init (imageName: "2", name: "Apple Macbook", actulPrice: "$100", oldPrice: "$110", productRating: 3, cartData: ""),
            Product.init (imageName: "3", name: "Apple Airbook", actulPrice: "$200", oldPrice: "$220", productRating: 4, cartData: ""),
              Product.init (imageName: "4", name: "Apple Macbook", actulPrice: "$500", oldPrice: "$550", productRating: 5, cartData: ""),
            Product.init (imageName: "1", name: "Apple Macbook", actulPrice: "$100", oldPrice: "$110", productRating: 2, cartData: "")
        ]
        return Products
    }
    
    fileprivate func createListCategory() -> [Category] {
        let categories =  [ Category.init (imageName: "all_category", name: "All Categories"),
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
        return categories
    }
    fileprivate var pageSize: CGSize {
        let layout = self.banner_collection.collectionViewLayout as! UPCarouselFlowLayout
        var pageSize = layout.itemSize
        if layout.scrollDirection == .horizontal {
            pageSize.width += layout.minimumLineSpacing
        } else {
            pageSize.height += layout.minimumLineSpacing
        }
        return pageSize
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == banner_collection{
            return 4
        }
        else if collectionView == categoryCollection{
            return list_category.count
        }
        else{
            return items.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == banner_collection{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Strings.Identifiers.HomeCell, for: indexPath) as! HomeCell
            cell.img_banner.image = Banner[indexPath.row]
               return cell
        }
        else if collectionView == categoryCollection{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Strings.Identifiers.CategoryCell, for: indexPath) as! CategoryCell
            let Category = list_category[(indexPath as NSIndexPath).row]
            print(Category)
            cell.img_Category.image = UIImage(named: Category.imageName)
            cell.name.text = Category.name
            return cell
        }
        else    {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Strings.Identifiers.HProductListCell, for: indexPath) as! HProductListCell
            let Product = items[(indexPath as NSIndexPath).row]
            print(Product)
            cell.img_product.image = UIImage(named: Product.imageName)
            cell.Actul_price.text = Product.actulPrice
            cell.old_price.attributedText = Product.oldPrice.strikeThrough()
            cell.name.text = Product.name
            cell.product_rating.value = Product.productRating
//            cell.btn_cart.setTitle(Product.cartData, for: .normal)
            return cell
        }
       

     
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
