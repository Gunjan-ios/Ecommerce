//
//  OrderDetailVC.swift
//  InitialWork
//
//  Created by Gunjan on 25/09/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit

protocol OrderToReturnDelegate {
    func ReasonSelected(Reason : String)
}
class OrderDetailVC: ParentViewController,UITableViewDelegate,UITableViewDataSource,ReviewDelegate,ViewDelegate {
   
  func ReasonReturnProceed(Reason: Bool) {
        let actionSheetController: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        // create an action
        let firstAction: UIAlertAction = UIAlertAction(title: "Dead On Arrival", style: .default) { action -> Void in
            print("First Action pressed")
            self.OrderToReturn.ReasonSelected(Reason: "Dead On Arrival")
        }
        
        let secondAction: UIAlertAction = UIAlertAction(title: "Faulty,Please supply details", style: .default) { action -> Void in
            self.OrderToReturn.ReasonSelected(Reason: "Faulty,Please supply details")
            print("Second Action pressed")
        }
        let thirdAction: UIAlertAction = UIAlertAction(title: "Order Error", style: .default) { action -> Void in
            self.OrderToReturn.ReasonSelected(Reason: "Order Error")
            print("Second Action pressed")
        }
        let fourAction: UIAlertAction = UIAlertAction(title: "Other", style: .default) { action -> Void in
            
             self.OrderToReturn.ReasonSelected(Reason: "Other")
            print("Second Action pressed")
        }
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in }
        
        // add actions
        actionSheetController.addAction(firstAction)
        actionSheetController.addAction(secondAction)
          actionSheetController.addAction(thirdAction)
          actionSheetController.addAction(fourAction)
        actionSheetController.addAction(cancelAction)
        
        
        // present an actionSheet...
        // present(actionSheetController, animated: true, completion: nil)   // doesn't work for iPad
        
        actionSheetController.popoverPresentationController?.sourceView = self.view // works for both iPhone & iPad
        
        present(actionSheetController, animated: true) {
            print("option menu presented")
        }
    }
    
    func ReviewProceed(isForReturnView: Bool, mesage: String) {
        if let alert = ReturnView.instanceFromNib(message: mesage,retunView: isForReturnView) {
            alert.center = self.view.center
            alert.delegate = self
            self.OrderToReturn = alert
            self.view.addSubview(alert)
        }
    }
    
   
    var OrderToReturn : OrderToReturnDelegate!
    @IBOutlet weak var OrderDetails: UITableView!
    var orderItems = [OrderProduct]()
    @IBOutlet weak var lbl_Date: UILabel!
    @IBOutlet weak var OrderStatus: UILabel!
    var PaymentStatus : Int = 0
    var PaymentType : String = ""
    var orderDate : String = ""

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        OrderDetails.dataSource = self
        OrderDetails.delegate = self
        orderItems = ProductOrder().ProductListing()
        lbl_Date.text = orderDate
        switch PaymentStatus {
        case 0:
            OrderStatus.text = "Pending"
            self.view.backgroundColor = YELLOW_COLOR
            break
        case 1:
            OrderStatus.text = "Completed"
            self.view.backgroundColor = #colorLiteral(red: 0.1722471222, green: 0.6450943661, blue: 0.1563819906, alpha: 1)
            break
        case 2:
            OrderStatus.text = "Cancelled"
            self.view.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            break
        case 3:
            OrderStatus.text = "Denied"
            self.view.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)

            break
        default:
            break
        }
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return nil
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return [1,orderItems.count,1][section]
    }

   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: Strings.Identifiers.EditAddressCell) as! EditAddressCell
            return cell
        }
        else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: Strings.Identifiers.ProductDetailCell) as! ProductDetailCell
            let Product = orderItems[(indexPath as NSIndexPath).row]
            cell.delegate = self
            cell.img_product.image = Product.image_Product
            cell.name.text = Product.name
            cell.name.changefontandsize(font: BoldFont, size: 16)
            cell.Quntity.text = Product.Quantity
            cell.price.text = Product.Price
            
            switch PaymentStatus {
            case 0:
                cell.Return.isHidden = true
                cell.Review.isHidden = true
                break
            case 1:
                cell.Return.isHidden = false
                cell.Review.isHidden = false
                break
            case 2:
                cell.Return.isHidden = true
                cell.Review.isHidden = true
                break
            case 3:
                cell.Return.isHidden = true
                cell.Review.isHidden = true
                break
            default:
                break
            }
            
            
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Strings.Identifiers.TotalOrderCell) as! TotalOrderCell
            return cell
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
