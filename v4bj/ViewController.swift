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
    
    let validateColor: UIColor = UIColor(red: 199/255, green: 235/255, blue: 198/255, alpha: 1)
    let errorColor: UIColor = UIColor(red: 251/255, green: 190/255, blue: 191/255, alpha: 1)
    
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
                self.result.backgroundColor = validateColor
            } else {
                self.result.text = validator.mError!.description
                self.result.backgroundColor = errorColor
            }
            
        } catch let error as NSError {
            self.result.text = error.description
            self.result.backgroundColor = errorColor
        }
    }
}

