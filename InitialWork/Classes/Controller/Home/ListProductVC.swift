//
//  ListProductVC.swift
//  InitialWork
//
//  Created by Gunjan on 13/09/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit
import JJFloatingActionButton
import EasyLoadingShimmer

class ListProductVC: ParentViewController,UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate,UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource {

    var listCellSize : CGFloat = 0.0
    var items = [Product]()
    var FilterData = [String]()
    var SelectedFilterData = [String]()

    @IBOutlet weak var filterView: UICollectionView!
    @IBOutlet weak var gridView: UICollectionView!
    @IBOutlet weak var ListView: UITableView!
    @IBOutlet weak var btn_chnages_view: UIButton!
    
     fileprivate let actionButton = JJFloatingActionButton()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        LoadingShimmer.startCovering(ListView, with: [Strings.Identifiers.ListTableCell])
        EasyLoadingShimmer.startCovering(for: gridView, with: [Strings.Identifiers.HProductListCell])
        EasyLoadingShimmer.startCovering(for: filterView, with: [Strings.Identifiers.FilterSliderCell])
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gridView.delegate = self
        gridView.dataSource = self
        ListView.delegate = self
        ListView.dataSource = self
        filterView.delegate = self
        filterView.dataSource = self
        
        items = ListProduct.init().DataLoad()
        FilterData = FilterSliderCell.filterItem
        SelectedFilterData = FilterSliderCell.SelectedItem
        
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
        
        DispatchQueue.main.async {
            self.filterView.collectionViewLayout.invalidateLayout()
        }
        if let flowLayout = filterView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 200, height: 30)
            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
       
        // Do any additional setup after loading the view.
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == filterView{
            return FilterData.count
        }else{
            return items.count

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == filterView{
              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Strings.Identifiers.FilterSliderCell, for: indexPath) as! FilterSliderCell
            cell.filterName.text = "\(FilterData[indexPath.row]) :"
            cell.slectedFilter.text = SelectedFilterData[indexPath.row]
             return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Strings.Identifiers.HProductListCell, for: indexPath) as! HProductListCell
            let Product = items[(indexPath as NSIndexPath).row]
            cell.img_product.image = UIImage(named: Product.imageName)
            cell.Actul_price.text = Product.actulPrice
            cell.old_price.attributedText = Product.oldPrice.strikeThrough()
            cell.name.text = Product.name
            return cell
        }
        
           }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == gridView{
            let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
            flowayout!.sectionInset = UIEdgeInsets(top: 10  , left: 10  , bottom: 10, right: 10)
            flowayout!.minimumInteritemSpacing = 10
            flowayout!.minimumLineSpacing = 10
            let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0)  + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
            let size:CGFloat = (gridView.frame.size.width - space ) / 2
            print(size)
            return CGSize(width: size, height: 270)
        }
        else{
            return CGSize(width: 0, height: 0)
        }
        
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
