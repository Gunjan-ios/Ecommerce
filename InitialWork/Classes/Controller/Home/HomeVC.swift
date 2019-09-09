//
//  HomeVC.swift
//  InitialWork
//
//  Created by Gunjan on 04/09/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit
import UPCarouselFlowLayout

class HomeVC: ParentViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    let Banner = [#imageLiteral(resourceName: "baner4"),#imageLiteral(resourceName: "baner1"),#imageLiteral(resourceName: "baner3"),#imageLiteral(resourceName: "baner2")]
    
    @IBOutlet weak var banner_collection: UICollectionView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        banner_collection.delegate = self
        banner_collection.dataSource = self
        let layout = UPCarouselFlowLayout()
        layout.itemSize = CGSize (width: banner_collection.frame.width-30, height: banner_collection.frame.height)
        banner_collection.collectionViewLayout = layout
        layout.sideItemScale = 0.8
        layout.scrollDirection = .horizontal
        layout.spacingMode = UPCarouselFlowLayoutSpacingMode.overlap(visibleOffset: 10)
        // Do any additional setup after loading the view.
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
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Strings.Identifiers.HomeCell, for: indexPath) as! HomeCell
        
        cell.img_banner.image = Banner[indexPath.row]
//        cell.contentView.dropShadow(color: .red, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 3, scale: true)
//        cell.inputView!.dropShadow(color: .red, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 3, scale: true)

        return cell
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
