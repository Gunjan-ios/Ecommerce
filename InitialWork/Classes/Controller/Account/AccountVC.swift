//
//  AccountVC.swift
//  InitialWork
//
//  Created by Gunjan on 20/09/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit

class AccountVC: ParentViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var AccountList: UITableView!
    var fSectionitems = [AccountType]()
    var sSectionitems = [AccountType]()
    var tSectionitems = [AccountType]()
    @IBOutlet weak var headerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        AccountList.delegate = self
        AccountList.dataSource = self
//        AccountList.tableHeaderView = headerView
        self.fSectionitems =  Account().FristSectionDataLoad()
        self.sSectionitems =  Account().SecondSectionDataLoad()
        self.tSectionitems =  Account().ThirdSectionDataLoad()
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return nil
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let header = view as? UITableViewHeaderFooterView {
            header.textLabel!.font = UIFont.boldSystemFont(ofSize: 18)
            header.textLabel?.textAlignment = .justified
            header.textLabel!.textColor = THEME_COLOR
            header.contentView.backgroundColor = UIColor.groupTableViewBackground
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return [fSectionitems.count,sSectionitems.count,tSectionitems.count][section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

         if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Strings.Identifiers.AccountCell) as! AccountCell
            let account = fSectionitems[(indexPath as NSIndexPath).row]
            cell.name.text = account.name
            cell.img_Payment.image = account.image_payment
            return cell
        }
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Strings.Identifiers.AccountCell) as! AccountCell
            let account = sSectionitems[(indexPath as NSIndexPath).row]
            cell.name.text = account.name
            cell.img_Payment.image = account.image_payment
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: Strings.Identifiers.AccountCell) as! AccountCell
            let account = tSectionitems[(indexPath as NSIndexPath).row]
            cell.name.text = account.name
            cell.img_Payment.image = account.image_payment
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch [indexPath.section , indexPath.row ]{
        case [0,0]:
            let view = self.storyboard?.instantiateViewController(withIdentifier:"MyOrderVC") as! MyOrderVC
            self.navigationController?.pushViewController(view, animated: true)
            break
            case [0,1]:
            let view = self.storyboard?.instantiateViewController(withIdentifier:"OfferVC") as! OfferVC
            self.navigationController?.pushViewController(view, animated: true)
            break
        case [0,2]:
            let view = self.storyboard?.instantiateViewController(withIdentifier:"NotificationVC") as! NotificationVC
            self.navigationController?.pushViewController(view, animated: true)
            break
        case [0,3]:
            let view = self.storyboard?.instantiateViewController(withIdentifier:"AddressBookVC") as! AddressBookVC
            self.navigationController?.pushViewController(view, animated: true)
            break
        case [2,0]:
          DispatchQueue.main.async {
            let alert = Utils.getAlertController(title: "Logout", message: "Are you sure want to logout?")
            alert.addAction(UIAlertAction(title: "No", style: .default, handler: { (action) in
            }))
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) in
            }))
            self.present(alert, animated: true, completion: nil)
                    }
            break
        case [1,1]:
            let view = self.storyboard?.instantiateViewController(withIdentifier:"SettingVC") as! SettingVC
            self.navigationController?.pushViewController(view, animated: true)
            break
        case [1,2]:
            let view = self.storyboard?.instantiateViewController(withIdentifier:"FeedBackVC") as! FeedBackVC
            self.navigationController?.pushViewController(view, animated: true)
            break
        default:
            break
        }
        
        
//        if indexPath.section == 0 && indexPath.row == 0{
//                    let view = self.storyboard?.instantiateViewController(withIdentifier:"MyOrderVC") as! MyOrderVC
//                    self.navigationController?.pushViewController(view, animated: true)
//        }
        
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
