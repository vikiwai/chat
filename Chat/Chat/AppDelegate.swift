//
//  AppDelegate.swift
//  Chat
//
//  Created by vikiwai on 16.09.2020.
//  Copyright © 2020 vikiwai. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    private let logger: Logger = Logger(true);
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.logger.logLifecycle(stateFrom: States.inactive,
                     stateTo: States.active,
                     functionName: #function)
        return true
    }
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.logger.logLifecycle(stateFrom: States.notRunning,
                     stateTo: States.inactive,
                     functionName: #function)
        return true
    }

    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

}

class Logger{
    
    private var isPrintEnabled: Bool
    
    init(_ isPrintEnabled: Bool){
        self.isPrintEnabled = isPrintEnabled
    }
    
    public func logToConsole(_ message: String) -> () {
        if(isPrintEnabled){
            print(message)
        }
    }
    public func logLifecycle(stateFrom: States,
                              stateTo: States,
                              functionName: String) -> () {
        logToConsole("Application moved from \(stateFrom) state to \(stateTo): \(functionName)")
    }
}

enum States : String{
    case notRunning = "not running"
    case inactive = "inactive"
    case active = "active"
    case background = "background"
    case suspended = "suspended"
}
