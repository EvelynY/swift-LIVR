//
//  Like.swift
//  v4bj
//
//  Created by lijunjian on 15/11/2.
//  Copyright © 2015年 taobao. All rights reserved.
//

import Foundation

class Like: AbsRule {
    var mLike: NSString?
    
    var regex: NSRegularExpression?

    override func validate(data: AnyObject?) -> AnyObject? {
        var error: String?
        if data != nil {
            if data is NSString {
                let result:[NSTextCheckingResult] = self.regex!.matchesInString(data as! String, options: .ReportCompletion, range: NSRange(location: 0, length: (data as! String).characters.count))
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
        if let argArray: NSArray = args as? NSArray {
            mLike = argArray[0] as? NSString
            regex = try!NSRegularExpression(pattern: mLike as! String, options:.CaseInsensitive)
        } else if args is NSNumber {
            mLike = NSString(format:"%@",args as! NSNumber)
            regex = try!NSRegularExpression(pattern: mLike as! String, options:.CaseInsensitive)
        } else {
            mLike = args as? NSString
            regex = try!NSRegularExpression(pattern: mLike as! String, options:.CaseInsensitive)
        }
        return true
    }
}