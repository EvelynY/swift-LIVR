//
//  MinLength.swift
//  v4bj
//
//  Created by lijunjian on 15/11/2.
//  Copyright © 2015年 taobao. All rights reserved.
//

import Foundation

class MinLength: AbsRule {
    var mMin: Int = 0
    
    override func validate(data: AnyObject?) -> AnyObject? {
        var error:String?
        if data != nil {
            if data is NSString {
                if (data as! String).characters.count < mMin {
                    error = Constants.TOO_SHORT.rawValue
                }
            } else if data is NSNumber {
                if data!.description.characters.count < mMin {
                    error = Constants.TOO_SHORT.rawValue
                }
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
        if let argArray: NSArray = args as? NSArray {
            mMin = argArray[0].integerValue
        } else if args is NSNumber {
            mMin = (args as? NSNumber)!.integerValue
        } else {
            mMin = (args as? NSString)!.integerValue
        }
        return true
    }
}