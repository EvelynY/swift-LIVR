//
//  Required.swift
//  v4bj
//
//  Created by lijunjian on 15/10/30.
//  Copyright © 2015年 taobao. All rights reserved.
//

import Foundation

class Required: AbsRule {
    override func validate(data: AnyObject?) -> AnyObject? {
        if let _:AnyObject = data {
            self.mError = .None
            return data
        }
        self.mError = Constants.REQUIRED.rawValue
        return .None
    }
    override func setArgs(args: AnyObject?) -> Bool {
        return true
    }
}