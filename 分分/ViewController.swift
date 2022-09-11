//
//  ViewController.swift
//  分分
//
//  Created by Jube on 2022/9/9.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var totalMoneyTextField: UITextField!
    @IBOutlet weak var averagePriceLabel: UILabel!
    @IBOutlet weak var tipTextField: UITextField!
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var downImageView: UIImageView!
    @IBOutlet weak var leftImageView: UIImageView!
    
    let topImageNames = ["upOne", "upTwo", "upThree"]
    let rightImageNames = ["rightOne", "rightTwo", "rightThree"]
    let downImageNames = ["downOne", "downTwo", "downThree"]
    let leftImageNames = ["leftOne", "leftTwo", "leftThree"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 53/255, green: 4/255, blue: 200/255, alpha: 1)
        calculateBg()
        hideRightLeftImage()
    }
    
    @IBAction func calculateBtn(_ sender: Any) {
        let totalMoneyText = totalMoneyTextField.text!
        let tipText = tipTextField.text!
        let peopleText = peopleLabel.text!
        let totalMoney = Double(totalMoneyText)
        let tipNum = Double(tipText)
        let people = Double(peopleText)!
        if totalMoney != nil, tipNum != nil{
            let tip = Double(tipNum! / 100 + 1)
            let averagePrice = totalMoney! * tip / people
            averagePriceLabel.text = String(averagePrice)
        } else if totalMoney != nil, tipNum == nil {
            let averagePrice = totalMoney! / people
            averagePriceLabel.text = String(format: "%.1f", averagePrice)
        } else {
            averagePriceLabel.text = "不用錢"
        }
    }
    
    @IBAction func eraseBtn(_ sender: Any) {
        totalMoneyTextField.text = ""
        tipTextField.text = ""
        averagePriceLabel.text = ""
        showImage(peopleNum: 2)
    }
    @IBAction func closeKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func peopleStepper(_ sender: UIStepper) {
        showImage(peopleNum: Int(sender.value))
    }
    func calculateBg(){
        let calculateBgLayer = CAShapeLayer()
        let calculateShapePath = UIBezierPath()
        calculateShapePath.move(to: CGPoint(x: 557, y: 0))
        calculateShapePath.addLine(to: CGPoint(x: 812, y: 0))
        calculateShapePath.addLine(to: CGPoint(x: 812, y: view.bounds.width))
        calculateShapePath.addLine(to: CGPoint(x: 487, y: view.bounds.width))
        calculateShapePath.addLine(to: CGPoint(x: 487, y: 70))
        calculateShapePath.addQuadCurve(to: CGPoint(x: 557, y: 0), controlPoint: CGPoint(x: 487, y: 0))
        calculateBgLayer.path = calculateShapePath.cgPath
        calculateBgLayer.fillColor = CGColor(red: 203/255, green: 237/255, blue: 1, alpha: 1)
        calculateBgLayer.shadowOpacity = 0.4
        calculateBgLayer.shadowOffset = CGSizeMake(-10.0, 0.0)
        calculateBgLayer.shadowColor = CGColor(red: 4/255, green: 59/255, blue: 86/255, alpha: 1)
        calculateBgLayer.shadowRadius = 12
        view.layer.insertSublayer(calculateBgLayer, at: 0)
    }
    func hideRightLeftImage(){
        rightImageView.isHidden = true
        leftImageView.isHidden = true
    }
    func showImage(peopleNum: Int){
        peopleLabel.text = String(peopleNum)
        let quotient = peopleNum/4
        if peopleNum % 4 == 1 {
            topImageView.image = UIImage(named: topImageNames[quotient])
            downImageView.image = UIImage(named: downImageNames[quotient-1])
            leftImageView.image = UIImage(named: leftImageNames[quotient-1])
            rightImageView.image = UIImage(named: rightImageNames[quotient-1])
        } else if peopleNum % 4 == 2 {
            if peopleNum == 2 {
                topImageView.image = UIImage(named: topImageNames[quotient])
                downImageView.image = UIImage(named: downImageNames[quotient])
                hideRightLeftImage()
            } else {
                topImageView.image = UIImage(named: topImageNames[quotient])
                downImageView.image = UIImage(named: downImageNames[quotient])
                leftImageView.image = UIImage(named: leftImageNames[quotient-1])
                rightImageView.image = UIImage(named: rightImageNames[quotient-1])
            }
        } else if peopleNum % 4 == 3 {
            if peopleNum == 3 {
                topImageView.image = UIImage(named: topImageNames[quotient])
                downImageView.image = UIImage(named: downImageNames[quotient])
                leftImageView.isHidden = false
                leftImageView.image = UIImage(named: leftImageNames[quotient])
                rightImageView.isHidden = true
            } else {
                topImageView.image = UIImage(named: topImageNames[quotient])
                downImageView.image = UIImage(named: downImageNames[quotient])
                leftImageView.isHidden = false
                leftImageView.image = UIImage(named: leftImageNames[quotient])
                rightImageView.image = UIImage(named: rightImageNames[quotient-1])
            }
        } else if peopleNum % 4 == 0 {
            leftImageView.isHidden = false
            rightImageView.isHidden = false
            topImageView.image = UIImage(named: topImageNames[quotient-1])
            downImageView.image = UIImage(named: downImageNames[quotient-1])
            leftImageView.image = UIImage(named: leftImageNames[quotient-1])
            rightImageView.image = UIImage(named: rightImageNames[quotient-1])
        }
    }
}

