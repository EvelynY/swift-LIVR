//
//  OneOf.swift
//  v4bj
//
//  Created by lijunjian on 15/11/2.
//  Copyright © 2015年 taobao. All rights reserved.
//

import Foundation

class OneOf: AbsRule {
    var mAllowedValues: [String] = [String]()
    
    override func validate(data: AnyObject?) -> AnyObject? {
        var error: String?
        if data != nil {
            var value: NSString?
            if data is NSString {
                value = data as? NSString
            }
            if data is NSNumber {
                value = (data as? NSNumber)?.description
            }
            if value != nil {
                for str in mAllowedValues {
                    if value!.isEqualToString(str) {
                        self.mError = nil;
                        return data
                    }
                }
                error = Constants.NOT_ALLOWED_VALUE.rawValue
            } else {
                error = Constants.FORMAT_ERROR.rawValue
            }
        }
        self.mError = error
        if error == nil {
            return data
        } else {
            return .None
        }
    }
    
    override func setArgs(args: AnyObject?) -> Bool {
        if let argArray:NSArray = args as? NSArray {
            for object in argArray {
                if object is String {
                    mAllowedValues.append(object as! String)
                }
            }
        } else {
            return false
        }
        return true
    }
}