//
//  ListOf.swift
//  v4bj
//
//  Created by lijunjian on 15/10/30.
//  Copyright © 2015年 taobao. All rights reserved.
//

import Foundation

class ListOf: AbsRule {
    let FIELD: String = "field"
    var mValidator: Validator?
    
    override func validate(data: AnyObject?) -> AnyObject? {
        var hasError: Bool = false
        var error: [AnyObject?] = [AnyObject]()
        
        if data != nil {
            if let dataArray:[AnyObject] = data as? Array {
                for dataInArray in dataArray {
                    var rules: [String: AnyObject] = [String: AnyObject]()
                    rules[FIELD] = dataInArray
                    if !mValidator!.validate(rules) {
                        hasError = true
                        error.append(mValidator!.mError![FIELD]!)
                    } else {
                        error.append(.None)
                    }
                }
            } else {
                self.mError = Constants.FORMAT_ERROR.rawValue
                return nil
            }
        }
        
        if hasError {
            self.mError = error.description
            return nil;
        } else {
            return data
        }
    }
    
    override func setArgs(args: AnyObject?) -> Bool {
        if args != nil {
            var rules: [String: AnyObject] = [String: AnyObject]()
            rules[FIELD] = args
            self.mValidator = Validator(rule: rules)
            return true
        }
        return false
    }
}