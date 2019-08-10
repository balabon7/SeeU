//
//  OneViewController.swift
//  iSeeYouAgainApp
//
//  Created by mac on 17.07.2019.
//  Copyright © 2019 sashabalabon. All rights reserved.
//

import UIKit

class NotificationVC: UIViewController {
    
    private let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    @IBOutlet weak var propertiesFirstSwithc: UISwitch!
    @IBOutlet weak var propertiesSecondSwithc: UISwitch!
    @IBOutlet weak var propertiesThirdSwithc: UISwitch!
    @IBOutlet weak var propertiesFourthSwithc: UISwitch!
    @IBOutlet weak var propertiesFifthSwithc: UISwitch!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        propertiesFirstSwithc.isOn  = UserDefaults.standard.bool(forKey: "firstToggleValue")
        propertiesSecondSwithc.isOn = UserDefaults.standard.bool(forKey: "secondToggleValue")
        propertiesThirdSwithc.isOn  = UserDefaults.standard.bool(forKey: "thirdToggleValue")
        propertiesFourthSwithc.isOn  = UserDefaults.standard.bool(forKey: "fourToggleValue")
        propertiesFifthSwithc.isOn  = UserDefaults.standard.bool(forKey: "fifthToggleValue")

    }
    
    private func alertDisplay(timeIndex: String, componentIndex: DateComponents, idIndex: String) {
        let alert = UIAlertController(title: "Включено ежедневное напоминание", message: "Вы получите уведомлении в \(timeIndex)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            self.appDelegate?.scheduleNotification(notificationType: "Уведомление пользователя", by: componentIndex, id: idIndex )
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func firstActivSwitch(_ sender: UISwitch) {
        if sender.isOn == true {
            UserDefaults.standard.set(true, forKey: "firstToggleValue")
            alertDisplay(timeIndex: dateOne.timeToActive, componentIndex: dateOne.dateValue, idIndex: dateOne.id)
        } else if sender.isOn == false {
            UserDefaults.standard.set(false, forKey: "firstToggleValue")
            self.appDelegate?.notificationCenter.removePendingNotificationRequests(withIdentifiers: [dateOne.id])
        }
    }
    
    
    @IBAction func secondActivSwitch(_ sender: UISwitch) {
        if sender.isOn == true {
            UserDefaults.standard.set(true, forKey: "secondToggleValue")
            alertDisplay(timeIndex: dateTwo.timeToActive, componentIndex: dateTwo.dateValue, idIndex: dateTwo.id)
        } else if sender.isOn == false {
            UserDefaults.standard.set(false, forKey: "secondToggleValue")
            self.appDelegate?.notificationCenter.removePendingNotificationRequests(withIdentifiers: [dateTwo.id])
        }
    }
    
    @IBAction func thirdActivSwitch(_ sender: UISwitch) {
        if sender.isOn == true {
            UserDefaults.standard.set(true, forKey: "thirdToggleValue")
            alertDisplay(timeIndex: dateThree.timeToActive, componentIndex: dateThree.dateValue, idIndex: dateThree.id)
        } else if sender.isOn == false {
            UserDefaults.standard.set(false, forKey: "thirdToggleValue")
            self.appDelegate?.notificationCenter.removePendingNotificationRequests(withIdentifiers: [dateThree.id])
        }
    }
    
    @IBAction func fourthActivSwitch(_ sender: UISwitch) {
        if sender.isOn == true {
            UserDefaults.standard.set(true, forKey: "fourToggleValue")
            alertDisplay(timeIndex: dateFour.timeToActive, componentIndex: dateFour.dateValue, idIndex: dateFour.id)
        } else if sender.isOn == false {
            UserDefaults.standard.set(false, forKey: "fourToggleValue")
            self.appDelegate?.notificationCenter.removePendingNotificationRequests(withIdentifiers: [dateFour.id])
        }
    }
    
    @IBAction func fifthActivSwitch(_ sender: UISwitch) {
      
        if sender.isOn == true {
            UserDefaults.standard.set(true, forKey: "fifthToggleValue")
            alertDisplay(timeIndex: dateFive.timeToActive, componentIndex: dateFive.dateValue, idIndex: dateFive.id)
        } else if sender.isOn == false {
            UserDefaults.standard.set(false, forKey: "fifthToggleValue")
            self.appDelegate?.notificationCenter.removePendingNotificationRequests(withIdentifiers: [dateFive.id])
        }
    }
    
}
