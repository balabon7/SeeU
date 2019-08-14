//
//  AppDelegate.swift
//  iSeeYouAgainApp
//
//  Created by mac on 16.07.2019.
//  Copyright © 2019 sashabalabon. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let notificationCenter = UNUserNotificationCenter.current() // наш центр нотификаций
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        requestAutorization()
        notificationCenter.delegate = self
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        UIApplication.shared.applicationIconBadgeNumber = 0
    }
    
    func requestAutorization() { // запрос на отправку уведомлений
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            print("Ответ пользователя: \(granted)")
            
            guard granted else{ return }  //если дали согласие...
            self.getNotificationSetting()
        }
    }
    
    func getNotificationSetting() { // отслеживает настройки уведомлений
        notificationCenter.getNotificationSettings { (settings) in
            //  print("Настройки уведомдений: \(settings)")
            
        }
    }
    
    func scheduleNotification(notificationType: String, by date: DateComponents, id: String) {
        let content = UNMutableNotificationContent()
        content.title = notificationType
        content.body = "Время делать упражнения для глаз"
        content.sound = .default
        content.badge = 1
        
        let date = date
        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
        
        let identificator = id
        let request = UNNotificationRequest(identifier: identificator, content: content, trigger: trigger)
        
        notificationCenter.add(request) { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    // позволяет уведомления отображаться при запущенном экране
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
    }
    
}
