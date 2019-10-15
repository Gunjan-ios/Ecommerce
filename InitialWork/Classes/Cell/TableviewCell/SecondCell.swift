//
//  SecondCell.swift
//  InitialWork
//
//  Created by Gunjan on 01/10/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit

class SecondCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return StorageCell.DummyStorage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Strings.Identifiers.SecondCell, for: indexPath) as! StorageCell
        cell.filterName.text = StorageCell.DummyStorage[indexPath.row]
        return cell
    }
    

    @IBOutlet weak var storageCollection: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        storageCollection.delegate = self
        storageCollection.dataSource = self
        DispatchQueue.main.async {
            self.storageCollection.collectionViewLayout.invalidateLayout()
        }
        if let flowLayout = storageCollection?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 80, height: 30)
            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
