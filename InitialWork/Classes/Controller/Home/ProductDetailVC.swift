
//
//  ProductDetailVC.swift
//  InitialWork
//
//  Created by Gunjan on 01/10/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit
import UPCarouselFlowLayout

class ProductDetailVC: ParentViewController,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource {
    
    let Banner = [#imageLiteral(resourceName: "P4"),#imageLiteral(resourceName: "P2"),#imageLiteral(resourceName: "P3"),#imageLiteral(resourceName: "P1")]
    var items = [Product]()
    var ListPaymentType = [PaymentType]()
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var relatedView: UIView!
    @IBOutlet weak var listDetails: UITableView!
    @IBOutlet weak var banner_collection: UICollectionView!
    @IBOutlet weak var headerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listDetails.delegate = self
        listDetails.dataSource = self
        banner_collection.delegate = self
        banner_collection.dataSource = self
        listDetails.tableHeaderView = headerView
        listDetails.tableFooterView = relatedView
        self.items = ListProduct.init().DataLoad()

        let layout = UPCarouselFlowLayout()
        layout.itemSize = CGSize (width: banner_collection.frame.width-30, height: banner_collection.frame.height)
        banner_collection.collectionViewLayout = layout
        layout.sideItemScale = 0.2
        layout.scrollDirection = .horizontal
        layout.spacingMode = UPCarouselFlowLayoutSpacingMode.overlap(visibleOffset: 0)
        pageControl.numberOfPages = Banner.count
        
        // Do any additional setup after loading the view.
    }
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        let imageView = sender.view as! UIImageView
        let newImageView = UIImageView(image: imageView.image)
        newImageView.frame = UIScreen.main.bounds
        newImageView.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 1)
        newImageView.contentMode = .scaleAspectFit
        newImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        newImageView.addGestureRecognizer(tap)
        self.view.addSubview(newImageView)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        self.tabBarController?.tabBar.isHidden = false
        sender.view?.removeFromSuperview()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == banner_collection{
            return Banner.count
        }
        else{
            return items.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == banner_collection{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Strings.Identifiers.HomeCell, for: indexPath) as! ProImageCell
            cell.img_product.image = Banner[indexPath.row]
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
            cell.img_product.isUserInteractionEnabled = true
            cell.img_product.addGestureRecognizer(tapGestureRecognizer)
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Strings.Identifiers.HProductListCell, for: indexPath) as! HProductListCell
            let Product = items[(indexPath as NSIndexPath).row]
            print(Product)
            cell.img_product.image = UIImage(named: Product.imageName)
            cell.Actul_price.text = Product.actulPrice
            cell.old_price.attributedText = Product.oldPrice.strikeThrough()
            cell.name.text = Product.name
            cell.product_rating.rating = Product.productRating
            //            cell.btn_cart.setTitle(Product.cartData, for: .normal)
            return cell
        }
   
    
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if(section == 0) {
//            return "Cart Product"
//        }
//        if(section == 1) {
//            return "Ship To"
//        }
//        if(section == 4) {
//            return "Payment Type"
//        }else {
//            return nil
//        }
//    }
//    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//        if let header = headerView as? UITableViewHeaderFooterView {
////            header.textLabel!.font = UIFont.boldSystemFont(ofSize: 18)
////            header.textLabel?.textAlignment = .justified
////            header.textLabel!.textColor = THEME_COLOR
////            header.contentView.backgroundColor = UIColor.groupTableViewBackground
//        }
//    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let visibleRect = CGRect(origin: self.banner_collection.contentOffset, size: self.banner_collection.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        if let visibleIndexPath = self.banner_collection.indexPathForItem(at: visiblePoint) {
            self.pageControl.currentPage = visibleIndexPath.row
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return [1,1,1,1,DescriptionCell.specification.count,1,1][section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: Strings.Identifiers.FirstDetailCell)!
            let label:UILabel = cell.viewWithTag(3) as! UILabel
            label.attributedText = "$13550".strikeThrough()
            return cell
        }
        else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: Strings.Identifiers.SecondCell) as! SecondCell
            return cell
        }
        else if indexPath.section == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: Strings.Identifiers.ThirdCell)!
              let label:UILabel = cell.viewWithTag(1) as! UILabel
              label.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
            return cell
        }
        else if indexPath.section == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: Strings.Identifiers.TitleSpecificaion)!
            return cell
        }
        else if indexPath.section == 4{
            let cell = tableView.dequeueReusableCell(withIdentifier: Strings.Identifiers.DescriptionCell) as! DescriptionCell
            let spicfy = DescriptionCell.specification[indexPath.row]
            cell.TitleLable.text = spicfy.TitleLable
            cell.DetailLable.text = spicfy.DetailLable
            return cell
        }
        else if indexPath.section == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Strings.Identifiers.EditAddressCell)!
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Strings.Identifiers.ReviewCell)!
            return cell
        }
    }
    @IBAction func onBackPressed(_ sender: Any) {
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
