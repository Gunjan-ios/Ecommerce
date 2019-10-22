//
//  MyOrderVC.swift
//  InitialWork
//
//  Created by Gunjan on 24/09/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit

class MyOrderVC: ParentViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var listOrder: UITableView!
    var orderItems = [MyOrder]()

    override func viewDidLoad() {
        super.viewDidLoad()
        listOrder.dataSource = self
        listOrder.delegate = self
        orderItems = OrderData().OrderListing()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Strings.Identifiers.MyOrderCell) as! MyOrderCell
        
        let order = orderItems[indexPath.row]
        cell.Order.text = order.Order
        cell.Date.text = order.Date
        cell.name.text = order.name
        cell.img_product?.image = order.image_payment
        
        cell.price.text = order.Price
        cell.paymentType.text = "(\(order.Selectedpayment ?? "" ))"
        cell.Approxtime.text = order.Time
        
        switch order.PaymentStatus {
        case 0:
             cell.orderStatus.text = Strings.OrderType.Pending
             cell.orderStatus.textColor = YELLOW_COLOR
            break
        case 1:
            cell.orderStatus.text = Strings.OrderType.Completed
            cell.orderStatus.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            break
        case 2:
            cell.orderStatus.text = Strings.OrderType.Cancelled
            cell.orderStatus.textColor = .orange
            break
        case 3:
            cell.orderStatus.text = Strings.OrderType.Denied
            cell.orderStatus.textColor = .red
            break
        default:
            break
        }
        if order.PaymentStatus == 0{
            cell.Approxtime.isHidden = false
            cell.cancleOrder.isHidden = false
        }
        else{
            cell.Approxtime.isHidden = true
            cell.cancleOrder.isHidden = true
        }
            return cell
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.listOrder.deselectRow(at: indexPath, animated: true)
        print("Log")
        let view = self.storyboard?.instantiateViewController(withIdentifier:Strings.Identifiers.OrderDetailVC) as! OrderDetailVC
        let order = orderItems[indexPath.row]
        view.PaymentStatus = order.PaymentStatus
        view.orderDate = order.Date
        view.PaymentType = order.Selectedpayment
//        self.present(view, animated: true, completion: nil)
        self.navigationController?.pushViewController(view, animated: true)
        
        

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
