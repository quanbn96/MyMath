//
//  ViewController.swift
//  MyMath
//
//  Created by Quan on 6/14/16.
//  Copyright © 2016 MyStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbl_p1: UILabel!
    @IBOutlet weak var lbl_p2: UILabel!
    @IBOutlet weak var op: UILabel!
    
    @IBOutlet weak var lbl_true: UILabel!
    @IBOutlet weak var lbl_fall: UILabel!
    
    @IBOutlet weak var btn_p1: UIButton!
    @IBOutlet weak var btn_p2: UIButton!
    @IBOutlet weak var btn_p3: UIButton!
    
    var True: Int = 0
    var Fall: Int = 0
    
    @IBOutlet weak var counterLbl: UILabel!
    var count = 0
    var timer = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRandom()
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.counter), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func btn_action(sender: AnyObject) {
        //Tinh True, Fall
        
        let checkVar = Int(sender.currentTitle!!)!
        let p1 = Int(lbl_p1.text!)!
        let p2 = Int(lbl_p2.text!)!
        let p3 = op.text!
        
        
        var result_1: Int
        
        if p3 == "+" {
            result_1 = result(p1, p2: p2, randomOperator: 0)
        } else if p3 == "-" {
            result_1 = result(p1, p2: p2, randomOperator: 1)
        } else if p3 == "*" {
            result_1 = result(p1, p2: p2, randomOperator: 2)
        } else {
            result_1 = result(p1, p2: p2, randomOperator: 3)
        }
        
        if checkVar == result_1 {
            True += 1
        } else {
            Fall += 1
        }
        
        lbl_true.text = String(True)
        lbl_fall.text = String(Fall)
        
        // set random
        setRandom()
        
        
    }
    func setRandom() {
        
        
        let randomOperation = Int(arc4random_uniform(4)) //0: cong, 1: tru, 2: nhan, 3: chia

        
        let random1 = Int(arc4random_uniform(4)) + 1
        let random2 = Int(arc4random_uniform(4)) + 1
        
        lbl_p1.text = String(random1)
        lbl_p2.text = String(random2)
        
        if randomOperation == 0 {
            op.text = "+"
            
        } else if randomOperation == 1 {
            op.text = "-"
            
        } else if randomOperation == 2 {
            op.text = "*"
            
        } else {
            op.text = "/"
            
        }
        
        setResult(random1, randomB: random2, randomOperation: randomOperation)
    }
    
    func setResult(randomA: Int, randomB: Int, randomOperation: Int) {
        let randomLocation = Int(arc4random_uniform(3)) //random vi tri cua ket qua dung
        
        if randomLocation == 0 {
            btn_p1.setTitle(String(randomA), forState: .Normal)
            btn_p2.setTitle(String(randomB), forState: .Normal)
            btn_p3.setTitle(String(result(randomA, p2: randomB, randomOperator: randomOperation)), forState: .Normal)
            
        } else if randomLocation == 1 {
            btn_p1.setTitle(String(randomA), forState: .Normal)
            btn_p2.setTitle(String(result(randomA, p2: randomB, randomOperator: randomOperation)), forState: .Normal)
            btn_p3.setTitle(String(randomB), forState: .Normal)
            
        } else {
            btn_p1.setTitle(String(result(randomA, p2: randomB, randomOperator: randomOperation)), forState: .Normal)
            btn_p2.setTitle(String(randomA), forState: .Normal)
            btn_p3.setTitle(String(randomB), forState: .Normal)
        }

    }
    
    func result(p1: Int, p2: Int, randomOperator: Int) -> Int {
        if randomOperator == 0 {
            return p1 + p2
            
        } else if randomOperator == 1 {
            return p1 - p2
            
        } else if randomOperator == 2 {
            return p1 * p2
            
        } else {
            return Int(p1 / p2)
            
        }
    }
    
    func counter() {
        
        count += 1
        
        counterLbl.text = "\(count)"
        
    }


}

