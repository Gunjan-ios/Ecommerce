//
//  SettingVC.swift
//  InitialWork
//
//  Created by Gunjan on 09/10/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit

class SettingVC: ParentViewController,UITableViewDelegate,UITableViewDataSource  {
    @IBOutlet weak var  SettingList: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        SettingList.dataSource = self
        SettingList.delegate = self
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingCell.settingData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Strings.Identifiers.SettingCell) as! SettingCell
        let order = SettingCell.settingData[indexPath.row]
       cell.Name.text = order.name
        cell.Swt_status.isOn = order.status
        return cell
        
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
