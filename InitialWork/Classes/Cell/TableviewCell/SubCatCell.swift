//
//  SubCatCell.swift
//  InitialWork
//
//  Created by Gunjan on 04/10/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit

class SubCatCell:  UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource  {
   
    @IBOutlet weak var subcategoryCollection: UICollectionView!
    var item = [SubCategory]()
    var list_category = [Category]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        subcategoryCollection.delegate = self
        subcategoryCollection.dataSource = self
        
        self.list_category = CategoryCell.categories
        
//        subcategoryCollection.reloadData()
//        DispatchQueue.main.async {
//            self.storageCollection.collectionViewLayout.invalidateLayout()
//        }
//        if let flowLayout = storageCollection?.collectionViewLayout as? UICollectionViewFlowLayout {
//            flowLayout.estimatedItemSize = CGSize(width: 80, height: 30)
//            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//        }
        // Initialization code
    }
        override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return list_category.count
    }
   
 

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
//        flowayout!.sectionInset = UIEdgeInsets(top: 10  , left: 10  , bottom: 10, right: 10)
//        flowayout!.minimumInteritemSpacing = 10
//        flowayout!.minimumLineSpacing = 10
//        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0)  + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
//        let size:CGFloat = (subcategoryCollection.frame.size.width - space ) / 4
//        print(size)
//        return CGSize(width: size, height: 110)
//    }
//
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Strings.Identifiers.CategoryCell, for: indexPath) as! CategoryCell
        let Category = list_category[(indexPath as NSIndexPath).row]
        print(Category)
        cell.img_Category.image = UIImage(named: Category.imageName)
        cell.name.text = Category.name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.section , indexPath.row)
    }
}
