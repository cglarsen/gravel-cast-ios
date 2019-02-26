//
//  NotificationManager.swift
//  Explore
//
//  Created by Christian Graver on 20/01/2019.
//  Copyright © 2019 nordgrus. All rights reserved.
//

import Foundation
import UserNotifications

struct NotificationManager {
    static func requestPermission() {
        let center = UNUserNotificationCenter.current()
        let options: UNAuthorizationOptions = [.alert, .sound];
        
        center.requestAuthorization(options: options) {
            (granted, error) in
            if !granted {
                print("Something went wrong")
            }
        }
    }
    
    
    static func triggerNow(title: String, body: String?) {
        let center = UNUserNotificationCenter.current()
        center.getNotificationSettings { (settings) in
            if settings.authorizationStatus == .authorized {
                // Notifications allowed
                let content = UNMutableNotificationContent()
                content.title = title
                if let body = body {
                    content.body = body
                }
                content.sound = UNNotificationSound(named: UNNotificationSoundName("notification_sound_h.m4a"))
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1,
                                                                repeats: false)
                let identifier = "GCLocalNot"
                let request = UNNotificationRequest(identifier: identifier,
                                                    content: content, trigger: trigger)
                center.add(request, withCompletionHandler: { (error) in
                    if let error = error {
                        // Something went wrong
                        print("Local push was not send: \(error.localizedDescription)")
                    } else {
                        print("Local push was send!")
                    }
                })
            }
        }
    }
}
