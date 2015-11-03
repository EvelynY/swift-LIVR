//
//  NotEmpty.swift
//  v4bj
//
//  Created by lijunjian on 15/10/30.
//  Copyright © 2015年 taobao. All rights reserved.
//

import Foundation

class NotEmpty : AbsRule {
    override func validate(data:AnyObject?) -> AnyObject? {
        if let _:AnyObject = data {
            self.mError = .None
            return data
        }
        self.mError = Constants.CANNOT_BE_EMPTY.rawValue
        return .None
    }
    override func setArgs(args: AnyObject?) -> Bool {
        return true
    }
    override func getError() -> String? {
        return self.mError
    }
}