//
//  Url.swift
//  v4bj
//
//  Created by lijunjian on 15/11/2.
//  Copyright © 2015年 taobao. All rights reserved.
//

import Foundation

class Url: AbsRule{
    let regex: NSRegularExpression = try!NSRegularExpression(pattern: "^(?:(?:http|https)://)(?:\\S+(?::\\S*)?@)?(?:(?:(?:[1-9]\\d?|1\\d\\d|2[01]\\d|22[0-3])(?:\\.(?:1?\\d{1,2}|2[0-4]\\d|25[0-5])){2}(?:\\.(?:[0-9]\\d?|1\\d\\d|2[0-4]\\d|25[0-4]))|(?:(?:[a-z\\u00a1-\\uffff0-9]+-?)*[a-z\\u00a1-\\uffff0-9]+)(?:\\.(?:[a-z\\u00a1-\\uffff0-9]+-?)*[a-z\\u00a1-\\uffff0-9]+)*(?:\\.(?:[a-z\\u00a1-\\uffff]{2,})))|localhost)(?::\\d{2,5})?(?:(/|\\?|#)[^\\s]*)?$", options:.CaseInsensitive)
    
    override func validate(data: AnyObject?) -> AnyObject? {
        var error: String? = .None
        if data != nil {
            if data is NSString {
                let result:[NSTextCheckingResult] = self.regex.matchesInString(data as! String, options: .ReportCompletion, range: NSRange(location: 0, length: (data as! String).characters.count))
                if result.count == 0 {
                    error = Constants.WRONG_FORMAT.rawValue
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
        return true
    }
}