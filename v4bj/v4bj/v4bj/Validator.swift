//
//  Validator.swift
//  v4bj
//
//  Created by lijunjian on 15/10/30.
//  Copyright © 2015年 taobao. All rights reserved.
//

import Foundation

class Validator {
    var mIsPrepared: Bool
    var mAllRules: NSDictionary?
    var mData: NSDictionary?
    var mValidator: [String: [AbsRule]]
    var mError: [String: String]?
    var mResult: [String: String]?
    
    
    init(rule: NSDictionary?) {
        self.mIsPrepared = false
        self.mValidator = [String: [AbsRule]]()
        if let theRule: NSDictionary = rule {
            self.mAllRules = theRule
        }
    }
    
    func validate(data: NSDictionary?) -> Bool {
        if !self.mIsPrepared {
            prepar()
        }
        self.mError = [String: String]()
        self.mResult = [String: String]()
        
        if(self.mAllRules == nil)
        {
            self.mError!["ERROR"] = Constants.NO_RULE_OR_RULE_NOT_IN_JSON_FORMAT.rawValue
            return false
        }
        
        self.mData = data

        for key: String in self.mValidator.keys {
            let fieldName: String = key
            let validators: [AbsRule]? = self.mValidator[fieldName]
            
            if validators == nil || validators!.isEmpty {
                continue
            }
            
            for iRule: AbsRule in validators! {
                let result = iRule.validate(self.mData![fieldName])
                if iRule.getError() == nil {
                    mResult![fieldName] = result as? String
                } else {
                    mError![fieldName] = iRule.getError()!
                    break
                }
            }
        }
        return mError!.isEmpty
    }
    
    func prepar() -> Void {
        if let rulesDic: NSDictionary = mAllRules {
            for key: NSString in (rulesDic.allKeys as? [NSString])! {
                let rules = rulesDic[key]
                var fieldRules: [AbsRule] = [AbsRule]()
                if rules is NSDictionary {
                    fieldRules.append(self.generateRule(rules as? NSDictionary)!)
                } else if rules is NSArray {
                    let array: NSArray = rules as! NSArray
                    for ruleInArray in array {
                        if let theRulesInArray: NSDictionary = ruleInArray as? NSDictionary {
                            if let newRule:AbsRule = self.generateRule(theRulesInArray) {
                                fieldRules.append(newRule)
                            }
                        } else if let theRulesInArray: NSString = ruleInArray as? NSString {
                            fieldRules.append(RuleManager.getInstance().createRules(theRulesInArray as String, args: .None)!)
                        } else {
                            let theRulesInArray: NSArray = ruleInArray as! NSArray
                            let strData: NSData = try!NSJSONSerialization.dataWithJSONObject(theRulesInArray, options: NSJSONWritingOptions.PrettyPrinted)
                            
                            let str: NSString = NSString(data: strData, encoding: NSUTF16BigEndianStringEncoding)!
                            fieldRules.append(RuleManager.getInstance().createRules(str as String, args: .None)!)
                        }
                    }
                } else {
                    fieldRules.append(RuleManager.getInstance().createRules(rules as! String, args: .None)!)
                }
                
                if(!fieldRules.isEmpty)
                {
                    self.mValidator[key as String] = fieldRules
                }
            }
            mIsPrepared = true;
        }
    }
    
    
    func generateRule (rule: NSDictionary?) -> AbsRule? {
        if let theRule: NSDictionary = rule {
            for key: NSString in (theRule.allKeys as? [NSString])! {
                return RuleManager.getInstance().createRules(key as String, args: theRule[key]!)
            }
        }
        return .None
    }
    
    func hasError() -> Bool? {
        if (self.mError != nil && !self.mError!.isEmpty) {
            return true
        }
        return false
    }
    
    func getPrintErrors() -> String? {
        return self.mError?.description
    }
    
    func getPrintResult() -> String? {
        return self.mResult?.description
    }
}
