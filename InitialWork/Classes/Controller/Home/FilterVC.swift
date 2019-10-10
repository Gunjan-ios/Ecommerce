//
//  FilterVC.swift
//  InitialWork
//
//  Created by Gunjan on 25/09/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit

class FilterVC: ParentViewController,UITableViewDelegate,UITableViewDataSource {
  
    var filterItem = [String]()
    let colors = ["aqua", "black", "blue", "fuchsia", "gray", "green",
                 "lime", "maroon", "navy", "olive", "orange", "purple", "red",
                 "silver", "teal", "white", "yellow"]
    
    
    @IBOutlet weak var FilterList: UITableView!
    @IBOutlet weak var FliterProduct: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        FilterList.delegate = self
        FliterProduct.delegate = self
        FilterList.dataSource  = self
        FliterProduct.dataSource  = self
        
        filterItem = FilterSliderCell.filterItem
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == FilterList{
            return filterItem.count
        }
        else{
            return colors.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == FilterList{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
            cell?.textLabel?.text = filterItem[indexPath.row]
            cell?.textLabel?.changefontandsize(font: BoldFont, size: 14)
            cell?.textLabel?.numberOfLines = 0
            cell?.textLabel?.lineBreakMode = .byWordWrapping
            return cell!
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "FilterCell")
            cell?.textLabel?.text = colors[indexPath.row]
            return cell!
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if tableView == FliterProduct{
            
            if let index = self.FliterProduct.indexPathForSelectedRow{
                print(index.row)
                let currentCell = tableView.cellForRow(at: index) as! UITableViewCell
                print(currentCell.textLabel!.text as Any)
                if currentCell.imageView?.image == #imageLiteral(resourceName: "check"){
                    currentCell.imageView?.image = #imageLiteral(resourceName: "uncheck")
                }
                else{
                    currentCell.imageView?.image = #imageLiteral(resourceName: "check")
                }
            }
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
