//
//  OfferVC.swift
//  InitialWork
//
//  Created by Gunjan on 09/10/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit

class OfferVC: ParentViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var  OfferList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        OfferList.dataSource = self
        OfferList.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return OfferCell.OfferData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Strings.Identifiers.OfferCell) as! OfferCell
        
        let order = OfferCell.OfferData[indexPath.row]
        cell.discount.text = order.Discount
        cell.img_offer.image = order.image_offer
      
        return cell
        
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.listOrder.deselectRow(at: indexPath, animated: true)
//        print("Log")
//        let view = self.storyboard?.instantiateViewController(withIdentifier:"OrderDetailVC") as! OrderDetailVC
//        let order = orderItems[indexPath.row]
//        view.PaymentStatus = order.PaymentStatus
//        view.orderDate = order.Date
//        view.PaymentType = order.Selectedpayment
//        self.navigationController?.pushViewController(view, animated: true)
//
//
//
//    }
    
    
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
