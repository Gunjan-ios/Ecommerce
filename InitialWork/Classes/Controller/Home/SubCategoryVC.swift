//
//  SubCategoryVC.swift
//  InitialWork
//
//  Created by Gunjan on 23/09/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit

class SubCategoryVC: ParentViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITableViewDataSource,UITableViewDelegate
{
    @IBOutlet weak var headerView: UIView!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 0 {
               let cell = tableView.dequeueReusableCell(withIdentifier: Strings.Identifiers.HeaderCell) as! HeaderCell
            cell.name.text = item[indexPath.row].Cat_name
            cell.detailsData.text = item[indexPath.row].Subcategoryname
            cell.img_category.image = UIImage (named: item[indexPath.row].imageName)
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: Strings.Identifiers.SubCatCell) as! SubCatCell
            return cell
        }

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if item[indexPath.section].isexpand == true{
            return 75
        }
        else{
            return 75
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return item.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return item.count
//        if item[section].isexpand == true{
//            return 2
//        }else{
//            return 1
//        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if item[indexPath.section].isexpand == true {
            item[indexPath.section].isexpand = false
            let sections = IndexSet.init(integer: indexPath.row)
            tableView.reloadSections(sections, with: .none)

        }else{
            item[indexPath.section].isexpand = true
        }
    }
    
    @IBOutlet weak var bottomview: NSLayoutConstraint!
    @IBOutlet weak var Collectionheight: NSLayoutConstraint!
    @IBOutlet weak var SubcategoryCollection: UICollectionView!

    let reuseIdentifier = "cell"
    // also enter this string as the cell identifier in the storyboard
    var item = [SubCategory]()
    var list_category = [Category]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        self.item = CategoryCell.Subcategories
    

        // Do any additional setup after loading the view.
    }

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return item.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if !item[section].isexpand{
            return 0
        }
        return item[section].SubCategoryData.count
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if !item[section].isexpand{
          return UIEdgeInsets.zero
        }
              return UIEdgeInsets(top: 10  , left: 0  , bottom: 10, right: 0)
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        flowayout!.sectionInset = UIEdgeInsets(top: 10  , left: 10  , bottom: 10, right: 10)
        flowayout!.minimumInteritemSpacing = 10
        flowayout!.minimumLineSpacing = 10
        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0)  + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let size:CGFloat = (SubcategoryCollection.frame.size.width - space ) / 4
        print(size)
        return CGSize(width: size, height: 110)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Strings.Identifiers.CategoryCell, for: indexPath) as! CategoryCell
     
        let subcatData = item[indexPath.section].SubCategoryData[indexPath.row]
        print(subcatData)
        cell.img_Category.image = UIImage(named: subcatData.imageName)
        cell.name.text = subcatData.name
        return cell
    }
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.section , indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,  withReuseIdentifier: "Header", for: indexPath as IndexPath) as! SubCategoryHeaderView
            headerView.name.text = self.item [indexPath.section].Cat_name
            headerView.Subcategoryname.text = self.item [indexPath.section].Subcategoryname
            headerView.img_Category.image = UIImage(named:self.item[indexPath.section].imageName)
            headerView.btn_section.tag = indexPath.section
          
            return headerView
        case UICollectionView.elementKindSectionFooter:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,  withReuseIdentifier: "Header1", for: indexPath as IndexPath) as! SubCategoryHeaderView
            headerView.backgroundColor = UIColor.green
            return headerView
        default:
            assert(false, "Unexpected element kind")
        }
    }
    
    @IBAction func pressed(_ sender: UIButton) {
        print(sender.tag)
        let Section = sender.tag
        var indexpaths = [IndexPath]()
        for r in item[Section].SubCategoryData.indices{
            print(Section,r)
            let indexpath = IndexPath (row: r, section: Section)
            indexpaths.append(indexpath)
        }
        let expand = item[Section].isexpand
        item[Section].isexpand = !expand
        sender.setImage(expand ? #imageLiteral(resourceName: "down-arrow") : #imageLiteral(resourceName: "up-arrow") , for: .normal)
        if expand{
            SubcategoryCollection.deleteItems(at: indexpaths)
        }
        else{
            SubcategoryCollection.insertItems(at: indexpaths)
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

