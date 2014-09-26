//
//  AppDelegate.swift
//  UnipagosIntegrationTest
//
//  Created by Leonardo Cid on 22/09/14.
//  Copyright (c) 2014 Unipagos. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
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
    
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication sourceApp: String, annotation theAnnotation: AnyObject?) -> Bool {
        var query = url.query! as NSString;
        let queryComponents = NSMutableDictionary();
        let components = query.componentsSeparatedByString("&");
        for component in components {
            var keyValuePairArray = component.componentsSeparatedByString("=") as [String];
            if (keyValuePairArray.count < 2) {
                continue; // Verify that there is at least one key, and at least one value.  Ignore extra = signs
            }
            var key = keyValuePairArray[0];
            var value = keyValuePairArray[1];
            var results = queryComponents.valueForKey(key) as NSMutableArray?; // URL spec says that multiple values are allowed per key
            if(results == nil) // First object
            {
                results = NSMutableArray();
                queryComponents[key] = results;
            }
            results?.addObject(value);
        }
        NSLog("%@", queryComponents);
        
        
        
        return true;
    }


}

