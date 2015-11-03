//
//  NotEmptyList.swift
//  v4bj
//
//  Created by lijunjian on 15/10/30.
//  Copyright © 2015年 taobao. All rights reserved.
//

import Foundation

class NotEmptyList: AbsRule {
    override func validate(data: AnyObject?) -> AnyObject? {
        if let someThing:[AnyObject] = data as? [AnyObject] {
            if someThing.count != 0 {
                self.mError = .None
                return data
            }
            self.mError = Constants.CANNOT_BE_EMPTY.rawValue
            return .None
        }
        self.mError = Constants.FORMAT_ERROR.rawValue
        return .None
    }
    override func setArgs(args: AnyObject?) -> Bool {
        return true
    }
}