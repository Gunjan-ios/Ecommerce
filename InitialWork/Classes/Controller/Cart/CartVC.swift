//
//  CartVC.swift
//  InitialWork
//
//  Created by Gunjan on 18/09/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit

class CartVC: ParentViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var cartProductList: UITableView!
    var items = [Product]()
    var ListAddressType = [AddressType]()
    var ListPaymentType = [PaymentType]()

    @IBOutlet weak var addressList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        cartProductList.delegate = self
        cartProductList.dataSource = self
        self.items =  CartListProduct().DataLoad()
        self.ListAddressType = Address().DataLoad()
        self.ListPaymentType = Payment().DataLoad()
        // Do any additional setup after loading the view.
    }
  
    func numberOfSections(in tableView: UITableView) -> Int {
         return 6
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 0) {
            return "Cart Product"
        }
        if(section == 1) {
            return "Ship To"
        }
        if(section == 4) {
            return "Payment Type"
        }else {
            return nil
        }
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
        return [items.count,1,ListAddressType.count,1,ListPaymentType.count,1][section]
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: Strings.Identifiers.ListTableCell) as! ListTableCell
            let Product = items[(indexPath as NSIndexPath).row]
            cell.img_product.image = UIImage(named: Product.imageName)
            cell.Actul_price.text = Product.actulPrice
            cell.old_price.attributedText = Product.oldPrice.strikeThrough()
            cell.name.text = Product.name
            cell.Actul_price.changefontandsize(font: MediumFont, size: 16)
            cell.name.changefontandsize(font: BoldFont, size: 16)
            cell.old_price.changefontandsize(font: MediumFont, size: 16)
            return cell
        }
        else if indexPath.section == 1{
             let cell = tableView.dequeueReusableCell(withIdentifier: Strings.Identifiers.EditAddressCell) as! EditAddressCell
            return cell
        }
        else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Strings.Identifiers.ListAdressCell) as! ListAdressCell
               let Product = ListAddressType[(indexPath as NSIndexPath).row]
                cell.charges.text = Product.charges
                cell.nameDelivery.text = Product.nameDelivery
                cell.validity.text = Product.validity
            cell.btn_selction.isSelected = Product.selected
            return cell
        } else if indexPath.section == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Strings.Identifiers.TotalOrderCell) as! TotalOrderCell
            return cell
        }
        else if indexPath.section == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Strings.Identifiers.PaymentTypeCell) as! PaymentTypeCell
            let Payment = ListPaymentType[(indexPath as NSIndexPath).row]
            cell.name.text = Payment.name
            cell.img_Payment.image = Payment.image_payment
            cell.SelectedPayment.isSelected = Payment.Selectedpayment
            
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: Strings.Identifiers.SubmitButton)
            return cell!
        }
        
       
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
