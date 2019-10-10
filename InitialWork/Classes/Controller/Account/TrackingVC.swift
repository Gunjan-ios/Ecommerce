//
//  TrackingVC.swift
//  InitialWork
//
//  Created by Gunjan on 26/09/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit
import StepProgressView

class TrackingVC: ParentViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var stepView: StepProgressView!
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    var timer = Timer()
    let firstSteps = [
        "20-1-2019",
        "22-1-2019",
        "24-1-2019",
        "25-1-2019",
         "25-1-2019",
    ]
    let details = [
        0: "Order Placed",
        1: "Order Confirmed",
        2: "Order Processed",
        3: "Order Shipped",
        4: "Order Delivered",
    ]
//    let margin: CGFloat = 16
    override func viewDidLoad() {
        super.viewDidLoad()
        loadControls()
        topView.layer.cornerRadius = 6
        //        DetailsView.layer.borderWidth = 0.1
        topView.layer.masksToBounds = true
        topView.layer.shadowColor = UIColor.gray.cgColor
        topView.layer.shadowOffset = CGSize(width: -1, height: 1)
        topView.layer.shadowRadius = 3.0
        topView.layer.shadowOpacity = 0.4
        topView.layer.masksToBounds = false
        
        
        bottomView.layer.cornerRadius = 6
        //        DetailsView.layer.borderWidth = 0.1
        bottomView.layer.masksToBounds = true
        bottomView.layer.shadowColor = UIColor.gray.cgColor
        bottomView.layer.shadowOffset = CGSize(width: -1, height: 1)
        bottomView.layer.shadowRadius = 3.0
        bottomView.layer.shadowOpacity = 0.4
        bottomView.layer.masksToBounds = false
        
    
        // Do any additional setup after loading the view.
    }
    
   
    func loadControls() {
        stepView.steps = firstSteps
        stepView.details = details
        stepView.pastStepColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        stepView.pastTextColor = #colorLiteral(red: 0.003921568627, green: 0.2745098039, blue: 0.5764705882, alpha: 1)
        stepView.lineWidth = 4.0
        stepView.pastStepFillColor = stepView.pastStepColor
        stepView.currentStepColor = UIColor.black
        stepView.currentTextColor = stepView.currentStepColor
        stepView.lastStepShape = .square
        stepView.detailFont = UIFont.systemFont(ofSize: 15)
        stepView.textFont = UIFont.boldSystemFont(ofSize: 17)
        timer =  Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(sliderChanged(_:)), userInfo: nil, repeats: true)
    
    }
    @IBAction func onBackPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func sliderchnages(_ sender: UISlider) {
        if sender.value >= sender.maximumValue {
            timer.invalidate()
        }
        stepView.currentStep = Int(sender.value)
    }
    
    @objc func sliderChanged(_ sender: StepProgressView) {
        stepView.currentStep =   stepView.currentStep + 1
        if  stepView.currentStep  >=  stepView.steps.count - 2 {
             timer.invalidate()
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
