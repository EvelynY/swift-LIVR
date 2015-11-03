//
//  ViewController.swift
//  v4bj
//
//  Created by lijunjian on 15/10/30.
//  Copyright © 2015年 taobao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var rule: UITextView!
    @IBOutlet weak var data: UITextView!
    @IBOutlet weak var result: UITextView!
    
    var ruleJson: NSDictionary?
    var dataJson: NSDictionary?
    
    override func viewDidLoad() {
        super.viewDidLoad()        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func doValidate(sender: UIButton) {
        let ruleStr: String = rule.text!
        let dataStr: String = data.text!
        do {
            self.ruleJson = try NSJSONSerialization.JSONObjectWithData(ruleStr.dataUsingEncoding(NSUTF8StringEncoding)!,options:.MutableContainers) as? NSDictionary
            self.dataJson = try NSJSONSerialization.JSONObjectWithData(dataStr.dataUsingEncoding(NSUTF8StringEncoding)!,options:.MutableContainers) as? NSDictionary
            
            let validator:Validator = Validator.init(rule:self.ruleJson)
            if validator.validate(self.dataJson) {
                self.result.text = self.data.text
                self.result.backgroundColor = UIColor.greenColor()
            } else {
                self.result.text = validator.mError!.description
                self.result.backgroundColor = UIColor.redColor()
            }
            
        } catch let error as NSError {
            self.result.text = error.description
            self.result.backgroundColor = UIColor.redColor()
        }
    }
}

