//
//  RuleManager.swift
//  v4bj
//
//  Created by lijunjian on 15/10/30.
//  Copyright © 2015年 taobao. All rights reserved.
//

import Foundation

class  RuleManager {
    
    static let instance: RuleManager = RuleManager()

    var DEFAULT_RULES: [String: AbsRule.Type] = [String: AbsRule.Type]()
    
    init(){
        self.registerDefaultRules()
    }
    
    func registerDefaultRules() {
        DEFAULT_RULES["required"] = Required.self
        DEFAULT_RULES["not_empty"] = NotEmpty.self
        DEFAULT_RULES["not_empty_list"] = NotEmptyList.self
        DEFAULT_RULES["one_of"] = OneOf.self
        DEFAULT_RULES["min_length"] = MinLength.self
        DEFAULT_RULES["max_length"] = MaxLength.self
        DEFAULT_RULES["like"] = Like.self
        DEFAULT_RULES["integer"] = Integer.self
        DEFAULT_RULES["positive_integer"] = PositiveInteger.self
        DEFAULT_RULES["max_number"] = MaxNumber.self
        DEFAULT_RULES["min_number"] = MinNumber.self
        DEFAULT_RULES["number_between"] = NumberBetween.self
        DEFAULT_RULES["nested_object"] = NestedObject.self
        DEFAULT_RULES["list_of"] = ListOf.self
        DEFAULT_RULES["list_of_objects"] = ListOfObjects.self
        DEFAULT_RULES["list_of_different_objects"] = ListOfDifferentObjects.self
    }
    
    func createRules(ruleName: String, args: AnyObject?) -> AbsRule? {
        let keys:[String] = [String](DEFAULT_RULES.keys)
        if (keys.contains(ruleName)) {
            let ruleClass:AbsRule.Type = DEFAULT_RULES[ruleName]!
            if let rule:AbsRule = ruleClass.init() {
                if !rule.setArgs(args) {
                    return .None
                }
                return rule
            }
        }
        return .None
    }
    
    class func getInstance() -> RuleManager {
        return instance
    }
}