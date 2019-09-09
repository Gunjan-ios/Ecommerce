//
//  WalkThroughVC.swift
//  InitialWork
//
//  Created by Gunjan on 05/09/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit
import UPCarouselFlowLayout

class WalkThroughVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var btn_start: UIButton!
    
    fileprivate var items = [Character]()
    
    fileprivate var currentPage: Int = 0 {
        didSet {
            let character = self.items[self.currentPage]
            self.infoLabel.text = character.name
            self.detailLabel.text = character.movie
        }
    }
    
    fileprivate var pageSize: CGSize {
        let layout = self.collectionView.collectionViewLayout as! UPCarouselFlowLayout
        var pageSize = layout.itemSize
        if layout.scrollDirection == .horizontal {
            pageSize.width += layout.minimumLineSpacing
        } else {
            pageSize.height += layout.minimumLineSpacing
        }
        return pageSize
    }
    
    fileprivate var orientation: UIDeviceOrientation {
        return UIDevice.current.orientation
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        self.items = self.createItems()
        self.currentPage = 0
        btn_start.setTitle(Language.Login.letstart, for: .normal)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.rotationDidChange), name: UIDevice.orientationDidChangeNotification, object: nil)
        // Do any additional setup after loading the view.
    }
    
    fileprivate func setupLayout() {
        let layout = UPCarouselFlowLayout()
        layout.itemSize = CGSize (width: self.view.frame.width - 50, height: self.view.frame.height/2)
        collectionView.collectionViewLayout = layout
        layout.sideItemScale = 0.2
        layout.scrollDirection = .horizontal
//        layout.spacingMode = UPCarouselFlowLayoutSpacingMode.overlap(visibleOffset: 50)
//        let layout = self.collectionView.collectionViewLayout as! UPCarouselFlowLayout
//        layout.spacingMode = UPCarouselFlowLayoutSpacingMode.overlap(visibleOffset: 10)
    }
    
    fileprivate func createItems() -> [Character] {
        let characters = [
//            Character(imageName: "1", name: "Wall-E", movie: "Wall-E"),
//            Character(imageName: "2", name: "Nemo", movie: "Finding Nemo"),
              Character(imageName: "3", name: Language.tour.FTitle , movie: Language.tour.Fsubtitle),
            Character(imageName: "4", name:  Language.tour.STitle, movie: Language.tour.Ssubtitle),
            Character(imageName: "5", name:  Language.tour.TTitle, movie: Language.tour.Tsubtitle),
//            Character(imageName: "brave", name: "Merida", movie: "Brave")
        ]
        return characters
    }
    
    
    @objc fileprivate func rotationDidChange() {
        guard !orientation.isFlat else { return }
        let layout = self.collectionView.collectionViewLayout as! UPCarouselFlowLayout
        let direction: UICollectionView.ScrollDirection = orientation.isPortrait ? .horizontal : .vertical
        layout.scrollDirection = direction
        if currentPage > 0 {
            let indexPath = IndexPath(item: currentPage, section: 0)
            let scrollPosition: UICollectionView.ScrollPosition = orientation.isPortrait ? .centeredHorizontally : .centeredVertically
            self.collectionView.scrollToItem(at: indexPath, at: scrollPosition, animated: false)
        }
    }
    
    // MARK: - Card Collection Delegate & DataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselCollectionViewCell.identifier, for: indexPath) as! CarouselCollectionViewCell
        let character = items[(indexPath as NSIndexPath).row]
        cell.image.image = UIImage(named: character.imageName)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let character = items[(indexPath as NSIndexPath).row]
        let alert = UIAlertController(title: character.name, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
    // MARK: - UIScrollViewDelegate
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let layout = self.collectionView.collectionViewLayout as! UPCarouselFlowLayout
        let pageSide = (layout.scrollDirection == .horizontal) ? self.pageSize.width : self.pageSize.height
        let offset = (layout.scrollDirection == .horizontal) ? scrollView.contentOffset.x : scrollView.contentOffset.y
        currentPage = Int(floor((offset - pageSide / 2) / pageSide) + 1)
    }
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        let layout = self.collectionView.collectionViewLayout as! UPCarouselFlowLayout
        let pageSide = (layout.scrollDirection == .horizontal) ? self.pageSize.width : self.pageSize.height
        let offset = (layout.scrollDirection == .horizontal) ? scrollView.contentOffset.x : scrollView.contentOffset.y
        currentPage = Int(floor((offset - pageSide / 2) / pageSide) + 1)
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
