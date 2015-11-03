//
//  AbsRule.swift
//  v4bj
//
//  Created by lijunjian on 15/10/30.
//  Copyright © 2015年 taobao. All rights reserved.
//

import Foundation

class AbsRule {
    var mError: String?
    required init(){
        mError = .None
    }
    func validate(data:AnyObject?) -> AnyObject? {
        return .None
    }
    func setArgs(args:AnyObject?) -> Bool {
        return false
    }
    func getError() -> String? {
        return self.mError
    }
}