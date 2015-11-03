//
//  ListOfDifferentObjects.swift
//  v4bj
//
//  Created by lijunjian on 15/11/2.
//  Copyright © 2015年 taobao. All rights reserved.
//

import Foundation

class ListOfDifferentObjects: AbsRule {
    var mFieldName: String?
    var mValidators: [String: Validator]?

    override func validate(data: AnyObject?) -> AnyObject? {
        var hasError: Bool = false
        var error:[AnyObject?] = [AnyObject?]()
        if data != nil {
            if let dataArray:[AnyObject] = data as? Array {
                for dataInArray in dataArray {
                    if dataInArray is NSDictionary {
                        let validator: Validator? = mValidators?[(dataInArray as! Dictionary) [mFieldName!]!]
                        if validator != nil && !validator!.validate(dataInArray) {
                            hasError = true
                            error.append(validator!.mError!)
                        } else {
                            error.append(.None)
                        }
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
            return nil
        } else {
            return data
        }
    }
    
    override func setArgs(args: AnyObject?) -> Bool {
        if let array: [AnyObject] = args as? [AnyObject] {
            mFieldName = array[0] as? String
            mValidators = [String: Validator]()
            let rules: [String: AnyObject] = array[1] as! [String: AnyObject]
            for key in rules.keys {
                mValidators![key] = Validator(rule: rules[key])
            }
            return true
        }
        return false
    }
}