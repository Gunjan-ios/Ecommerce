//
//  AddAddressVC.swift
//  InitialWork
//
//  Created by Gunjan on 09/10/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit

class AddAddressVC: UIViewController {

    @IBOutlet weak var otherbtn: UIButton!
    @IBOutlet weak var workbtn: UIButton!
    @IBOutlet weak var homebtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func internationalShippingResponder(_ sender: UIButton) {
        unselectall()
        sender.isSelected = true
//        addressType = sender.tag
    }
    
    func unselectall(){
        homebtn.isSelected = false
        workbtn.isSelected = false
        otherbtn.isSelected = false
        
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
