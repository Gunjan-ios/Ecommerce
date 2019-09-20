//
//  ListProductVC.swift
//  InitialWork
//
//  Created by Gunjan on 13/09/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit
import JJFloatingActionButton

class ListProductVC: ParentViewController,UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate,UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource {
    var items = [Product]()
  
    @IBOutlet weak var gridView: UICollectionView!
    @IBOutlet weak var ListView: UITableView!
    @IBOutlet weak var btn_chnages_view: UIButton!
    
    var listCellSize : CGFloat = 0.0
     fileprivate let actionButton = JJFloatingActionButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gridView.delegate = self
        gridView.dataSource = self
        ListView.delegate = self
        ListView.dataSource = self
//        self.items = createItems()
         items = ListProduct.init().DataLoad()
        actionButton.buttonColor = THEME_COLOR
        actionButton.buttonImageColor = YELLOW_COLOR
        actionButton.addItem(title: Language.ProductList.Popular, image: #imageLiteral(resourceName: "Popular")) { item in
            self.showAlert(message: item.titleLabel.text!, type: .error, navBar: false)
        }
        actionButton.addItem(title: Language.ProductList.PriceHtoL, image: #imageLiteral(resourceName: "PriceLow")) { item in
            self.showAlert(message: item.titleLabel.text!, type: .error, navBar: false)
        }
        actionButton.addItem(title: Language.ProductList.PriceLtoH, image: #imageLiteral(resourceName: "PriceHigh")) { item in
            self.showAlert(message: item.titleLabel.text!, type: .error, navBar: false)
        }
        actionButton.addItem(title: Language.ProductList.Sort_New, image: #imageLiteral(resourceName: "new")) { item in
            self.showAlert(message: item.titleLabel.text!, type: .error, navBar: false)
        }
        actionButton.display(inViewController: self)
       
        // Do any additional setup after loading the view.
    }
    
    fileprivate func createItems() -> [Product] {
        let Products = [
            Product.init (imageName: "cate_fashion_men", name: "Apple Macbook", actulPrice: "$100", oldPrice: "$110", productRating: 3, cartData: ""),
            Product.init (imageName: "cate_fashion_women", name: "Apple Airbook", actulPrice: "$200", oldPrice: "$220", productRating: 4, cartData: ""),
            Product.init (imageName: "cate_fashion_men", name: "Apple Macbook", actulPrice: "$500", oldPrice: "$550", productRating: 5, cartData: ""),
             Product.init (imageName: "cate_laptop", name: "Apple Macbook", actulPrice: "$500", oldPrice: "$550", productRating: 5, cartData: ""),
              Product.init (imageName: "cate_fashion_men", name: "Apple Macbook", actulPrice: "$500", oldPrice: "$550", productRating: 5, cartData: ""),
               Product.init (imageName: "cate_kitchen", name: "Apple Macbook", actulPrice: "$500", oldPrice: "$550", productRating: 5, cartData: ""),
                Product.init (imageName: "cate_fashion_men", name: "Apple Macbook", actulPrice: "$500", oldPrice: "$550", productRating: 5, cartData: ""),
                 Product.init (imageName: "4", name: "Apple Macbook", actulPrice: "$500", oldPrice: "$550", productRating: 5, cartData: ""),
            Product.init (imageName: "1", name: "Apple Macbook", actulPrice: "$100", oldPrice: "$110", productRating: 2, cartData: "")
        ]
        return Products
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Strings.Identifiers.HProductListCell, for: indexPath) as! HProductListCell
        
        
                let Product = items[(indexPath as NSIndexPath).row]
//                print(Product)
                cell.img_product.image = UIImage(named: Product.imageName)
                cell.Actul_price.text = Product.actulPrice
                cell.old_price.attributedText = Product.oldPrice.strikeThrough()
                cell.name.text = Product.name
                cell.product_rating.value = Product.productRating
        
                return cell
           }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        flowayout!.sectionInset = UIEdgeInsets(top: 10  , left: 10  , bottom: 10, right: 10)
        flowayout!.minimumInteritemSpacing = 10
        flowayout!.minimumLineSpacing = 10
        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0)  + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let size:CGFloat = (gridView.frame.size.width - space ) / 2
        print(size)
        return CGSize(width: size, height: 270)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
           let cell = tableView.dequeueReusableCell(withIdentifier: Strings.Identifiers.ListTableCell) as! ListTableCell
        let Product = items[(indexPath as NSIndexPath).row]
        cell.img_product.image = UIImage(named: Product.imageName)
        cell.Actul_price.text = Product.actulPrice
        cell.old_price.attributedText = Product.oldPrice.strikeThrough()
        cell.name.text = Product.name
        cell.Actul_price.changefontandsize(font: MediumFont, size: 18)
        cell.name.changefontandsize(font: BoldFont, size: 18)
        cell.old_price.changefontandsize(font: MediumFont, size: 18)
        cell.product_rating.value = Product.productRating
        
        return cell
    }
    

    @IBAction func onGridToListPressed(_ sender: Any) {

        if gridView.isHidden == false{
            gridView.isHidden = true
            ListView.isHidden = false
            btn_chnages_view .setImage(#imageLiteral(resourceName: "menu"), for: .normal)
        }
      else  if ListView.isHidden == false{
            gridView.isHidden = false
            ListView.isHidden = true
            btn_chnages_view .setImage(#imageLiteral(resourceName: "list"), for: .normal)
        }
        
    }
    @IBAction func OnbackPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
