//
//  ListOfObjects.swift
//  v4bj
//
//  Created by lijunjian on 15/11/2.
//  Copyright © 2015年 taobao. All rights reserved.
//

import Foundation

class ListOfObjects: AbsRule {
    var mValidator: Validator?
    
    override func validate(data: AnyObject?) -> AnyObject? {
        var hasError: Bool = false
        var error:[AnyObject?] = [AnyObject?]()
        if data != nil {
            if let dataArray:NSArray = data as? NSArray {
                for dataInArray in dataArray {
                    if !self.mValidator!.validate(dataInArray) {
                        hasError = true;
                    } else {
                        error.append(.None)
                    }
                }
            } else {
                self.mError = Constants.FORMAT_ERROR.rawValue
                return .None
            }
        }
        if hasError {
            self.mError = error.description
            return .None
        } else {
            return data
        }
    }
    
    override func setArgs(args: AnyObject?) -> Bool {
        if args is NSDictionary {
            mValidator = Validator(rule: args)
            return true
        }
        return false
    }
}