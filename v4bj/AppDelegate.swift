//
//  AppDelegate.swift
//  v4bj
//
//  Created by lijunjian on 15/10/30.
//  Copyright © 2015年 taobao. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let json: String = "{\"name\":\"required\",\"gender\":{\"one_of\":[\"male\",\"female\"]},\"phone\":{\"max_length\":10},\"password\":[\"required\",{\"min_length\":10}]}"
        let jsonDic = try!NSJSONSerialization.JSONObjectWithData(json.dataUsingEncoding(NSUTF8StringEncoding)!,options:.MutableContainers)
        
        let data: String = "{\"name\":\"John\",\"gender\":\"male\",\"phone\":\"+22221212222\",\"password\":\"mypassword1\"}"
        let dataDic = try!NSJSONSerialization.JSONObjectWithData(data.dataUsingEncoding(NSUTF8StringEncoding)!, options: .MutableContainers)
        
        let validator:Validator = Validator.init(rule:jsonDic)
        if validator.validate(dataDic) {
            print(validator.mError!)
        } else {
            print(validator.mError!)
        }
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

