//
//  Integer.swift
//  v4bj
//
//  Created by lijunjian on 15/11/2.
//  Copyright © 2015年 taobao. All rights reserved.
//

import Foundation

class Integer: AbsRule {
    let regex: NSRegularExpression = try!NSRegularExpression(pattern: "^\\-?[0-9]+$", options:.CaseInsensitive)
    override func validate(data: AnyObject?) -> AnyObject? {
        if data != nil {
            if !(data! is NSNumber) {
                let result:[NSTextCheckingResult] = self.regex.matchesInString(data as! String, options: .ReportCompletion, range: NSRange(location: 0, length: (data as! String).characters.count))
                
                if result.count == 0 {
                    self.mError = Constants.NOT_INTEGER.rawValue
                    return .None
                }
            }
        }
        self.mError = nil
        return data
    }
}