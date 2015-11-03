//
//  NestedObject.swift
//  v4bj
//
//  Created by lijunjian on 15/11/2.
//  Copyright © 2015年 taobao. All rights reserved.
//

import Foundation

class NestedObject: AbsRule {
    var mValidator: Validator?
    
    override func validate(data: AnyObject?) -> AnyObject? {
        var error: AnyObject?
        if data != nil {
            if let dataDic: NSDictionary = data as? NSDictionary {
                if mValidator != nil {
                    if !mValidator!.validate(dataDic) {
                        error = mValidator?.mError
                    }
                }
            } else {
                error = Constants.FORMAT_ERROR.rawValue
            }
        }
        self.mError = error?.description
        if error == nil {
            return data
        } else {
            return nil
        }
    }
    
    override func setArgs(args: AnyObject?) -> Bool {
        if args is NSDictionary {
            mValidator = Validator(rule: args as? NSDictionary)
            return true
        }
        return false
    }
}