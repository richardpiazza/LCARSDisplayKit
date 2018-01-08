//
//  AppDelegate.swift
//  LCARSDisplayKit
//
//  Created by Richard Piazza on 10/2/15.
//  Copyright © 2015 Richard Piazza. All rights reserved.
//

import UIKit
import LCARSDisplayKitUI
import AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CommandSequencerDelegate {

    var window: UIWindow?
    private var neutralBeepSoundID: SystemSoundID = 0
    private var successBeepSoundID: SystemSoundID = 0
    private var failureBeepSoundID: SystemSoundID = 0

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print(error.localizedDescription)
        }
        
        if let url = Configuration.theme.neutralBeepURL {
            AudioServicesCreateSystemSoundID(url as CFURL, &neutralBeepSoundID)
        }
        if let url = Configuration.theme.successBeepURL {
            AudioServicesCreateSystemSoundID(url as CFURL, &successBeepSoundID)
        }
        if let url = Configuration.theme.failureBeepURL {
            AudioServicesCreateSystemSoundID(url as CFURL, &failureBeepSoundID)
        }
        
        CommandSequencer.`default`.delegate = self
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // MARK: - CommandSequencerDelegate
    
    public func neutralBeep() {
        guard neutralBeepSoundID != 0 else {
            return
        }
        
        AudioServicesPlaySystemSound(neutralBeepSoundID)
    }
    
    public func successBeep() {
        guard successBeepSoundID != 0 else {
            return
        }
        
        AudioServicesPlaySystemSound(successBeepSoundID)
    }
    
    public func failureBeep() {
        guard failureBeepSoundID != 0 else {
            return
        }
        
        AudioServicesPlaySystemSound(failureBeepSoundID)
    }
}

