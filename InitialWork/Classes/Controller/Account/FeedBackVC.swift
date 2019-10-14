//
//  FeedBackVC.swift
//  InitialWork
//
//  Created by Gunjan on 14/10/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit

class FeedBackVC: ParentViewController,UITableViewDelegate,UITableViewDataSource  {

    @IBOutlet weak var  FeedBackList: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        FeedBackList.delegate = self
        FeedBackList.dataSource = self
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return [EmojiCell.EmojiData.count,1,1][section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: Strings.Identifiers.EmojiCell) as! EmojiCell
            let Emoji = EmojiCell.EmojiData[indexPath.row]
            cell.Name.text = Emoji.name
            
            return cell
        }else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: Strings.Identifiers.EmojiCell1)
          let DeatilsView = cell?.viewWithTag(1)
            DeatilsView?.layer.cornerRadius = 8.0
            DeatilsView?.layer.borderWidth = 1
            DeatilsView?.layer.borderColor = UIColor.lightGray.cgColor
            
            let txtview = cell?.viewWithTag(2)
            txtview?.layer.cornerRadius = 8.0
            txtview?.layer.borderWidth = 1
            txtview?.layer.borderColor = UIColor.gray.cgColor
            
            let btn = cell?.viewWithTag(3)
            btn?.layer.cornerRadius = 8.0
        

            return cell!
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: Strings.Identifiers.EmojiCell2)
            return cell!
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
