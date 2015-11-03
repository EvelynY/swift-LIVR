//
//  MinNumber.swift
//  v4bj
//
//  Created by lijunjian on 15/11/2.
//  Copyright © 2015年 taobao. All rights reserved.
//

import Foundation

class MinNumber: AbsRule {
    var mMin: Int = 0
    override func validate(data: AnyObject?) -> AnyObject? {
        if data != nil {
            let scan: NSScanner = NSScanner(string: data!.description)
            var val: Int = 0
            if scan.scanInteger(&val) && scan.atEnd {
                if val < mMin {
                    self.mError = Constants.TOO_LOW.rawValue
                    return .None
                }
            } else {
                self.mError = Constants.FORMAT_ERROR.rawValue
                return .None
            }
        }
        self.mError = .None
        return data
    }
    override func setArgs(args: AnyObject?) -> Bool {
        if let argArray: NSArray = args as? NSArray {
            mMin = argArray[0].integerValue
        } else {
            mMin = (args as? NSString)!.integerValue
        }
        return true
    }
}