//
//  Constants.swift
//  v4bj
//
//  Created by lijunjian on 15/10/30.
//  Copyright © 2015年 taobao. All rights reserved.
//

import Foundation

enum Constants: String {
    
    case LOG_TAG                            = "v4bj";
    
    case NO_RULE_OR_RULE_NOT_IN_JSON_FORMAT = "NO_RULE_OR_RULE_NOT_IN_JSON_FORMAT"
    case NO_DATA_OR_DATA_NOT_IN_JSON_FORMAT = "NO_DATA_OR_DATA_NOT_IN_JSON_FORMAT"
    
    case FORMAT_ERROR                       = "FORMAT_ERROR";
    case REQUIRED                           = "REQUIRED";
    case CANNOT_BE_EMPTY                    = "CANNOT_BE_EMPTY";
    case NOT_INTEGER                        = "NOT_INTEGER";
    case NOT_POSITIVE_INTEGER               = "NOT_POSITIVE_INTEGER";
    case TOO_LOW                            = "TOO_LOW";
    case TOO_HIGH                           = "TOO_HIGH";
    
    
    case NOT_ALLOWED_VALUE                  = "NOT_ALLOWED_VALUE";
    case TOO_LONG                           = "TOO_LONG"
    case TOO_SHORT                          = "TOO_SHORT"
    case WRONG_FORMAT                       = "WRONG_FORMAT"    
}