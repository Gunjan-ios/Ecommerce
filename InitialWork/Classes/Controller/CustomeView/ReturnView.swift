//
//  ReturnView.swift
//  InitialWork
//
//  Created by Gunjan on 10/10/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit
import Cosmos
import GMStepper

protocol ViewDelegate {
    func ReasonReturnProceed(Reason : Bool)
}
class ReturnView: UIView,OrderToReturnDelegate {
    func ReasonSelected(Reason: String) {
        btnReason.setTitle(Reason, for: .normal)
    }
    
    
    var delegate : ViewDelegate!
    @IBOutlet weak var CornerView: UIView!
    @IBOutlet weak var btnHeight: NSLayoutConstraint!
    @IBOutlet weak var stp_qty: GMStepper!
    @IBOutlet weak var messagelable: UILabel!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var ProductView: UIView!
    @IBOutlet weak var btnReason: UIButton!
    @IBOutlet weak var starView: CosmosView!
    @IBOutlet weak var txtComment: UITextView!
    
    override func awakeFromNib() {
        topView.addBorder(toSide: .Bottom, withColor: UIColor.gray.cgColor, andThickness: 1)
        CornerView.layer.cornerRadius = 8
        CornerView.layer.borderWidth = 1
        CornerView.layer.borderColor = UIColor.gray.cgColor
        
        topView.layer.cornerRadius = 8
        
        txtComment.layer.borderWidth = 1
        txtComment.layer.borderColor = UIColor.gray.cgColor
        txtComment.layer.cornerRadius = 8
        
    }
    class func instanceFromNib(message : String?,retunView : Bool?) -> ReturnView? {
        if let alert = UINib(nibName: "ReturnView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? ReturnView{
            alert.frame = CGRect (x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
       
            if message != nil {
                alert.messagelable.text = message
            }
            if retunView == true {
                alert.btnReason.setTitle("Select Reason For Return Item", for: .normal)
                alert.btnReason.isHidden = false
                alert.btnHeight.constant = 34
                alert.btnReason.layer.borderWidth = 1
                alert.btnReason.layer.borderColor = UIColor.gray.cgColor
               alert.btnReason.layer.cornerRadius = 4
                alert.stp_qty.isHidden = false
                alert.starView.isHidden = true
            }
            else{
                alert.btnHeight.constant = 0

                alert.btnReason.isHidden = true
                alert.btnReason.setTitle("", for: .normal)
                alert.stp_qty.isHidden = true
                alert.starView.isHidden = false
                
            }

            return alert
        }
        return nil
    }
    
   
    
    @IBAction func OnCancelPressed(_ sender: Any) {
        self.removeFromSuperview()
    }
    @IBAction func onReasonretunPressed(_ sender: Any) {
        
        delegate.ReasonReturnProceed(Reason: true)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
