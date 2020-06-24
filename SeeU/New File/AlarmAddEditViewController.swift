//
//  AlarmAddEditViewController.swift
//  SeeU
//
//  Created by mac on 20.05.2020.
//  Copyright © 2020 sashabalabon. All rights reserved.
//

import UIKit

class AlarmAddEditViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var tableView: UITableView!
    
    var alarmScheduler: AlarmSchedulerDelegate = Scheduler()
    var alarmModel: Alarms = Alarms()
    var segueInfo: SegueInfo!
    var snoozeEnabled: Bool = false
    var enabled: Bool!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Add Reminder"
        datePicker.tintColor = .red
        
        //        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonPressed))
        //        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonPressed))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        alarmModel = Alarms()
        tableView.reloadData()
        snoozeEnabled = segueInfo.snoozeEnabled
        navigationController?.navigationBar.tintColor = .red
    }
    
    @IBAction func saveEditAlarm(_ sender: AnyObject) {
        let date = Scheduler.correctSecondComponent(date: datePicker.date)
        let index = segueInfo.curCellIndex
        var tempAlarm = Alarm()
        tempAlarm.date = date
        tempAlarm.label = segueInfo.label
        tempAlarm.enabled = true
        tempAlarm.mediaLabel = segueInfo.mediaLabel
        tempAlarm.mediaID = segueInfo.mediaID
        tempAlarm.snoozeEnabled = snoozeEnabled
        tempAlarm.repeatWeekdays = segueInfo.repeatWeekdays
        tempAlarm.uuid = UUID().uuidString
        tempAlarm.onSnooze = false
        if segueInfo.isEditMode {
            alarmModel.alarms[index] = tempAlarm
        }
        else {
            alarmModel.alarms.append(tempAlarm)
        }
        self.performSegue(withIdentifier: Identifier.saveSegueIdentifier, sender: self)
    }
    
    @objc func saveButtonPressed(){
        let date = Scheduler.correctSecondComponent(date: datePicker.date)
        let index = segueInfo.curCellIndex
        var tempAlarm = Alarm()
        tempAlarm.date = date
        tempAlarm.label = segueInfo.label
        tempAlarm.enabled = true
        tempAlarm.mediaLabel = segueInfo.mediaLabel
        tempAlarm.mediaID = segueInfo.mediaID
        tempAlarm.snoozeEnabled = snoozeEnabled
        tempAlarm.repeatWeekdays = segueInfo.repeatWeekdays
        tempAlarm.uuid = UUID().uuidString
        tempAlarm.onSnooze = false
        if segueInfo.isEditMode {
            alarmModel.alarms[index] = tempAlarm
        }
        else {
            alarmModel.alarms.append(tempAlarm)
        }
        self.performSegue(withIdentifier: Identifier.saveSegueIdentifier, sender: self)
    }
    
    
    @IBAction func unwindFromWeekdaysView(_ segue: UIStoryboardSegue) {
        let src = segue.source as! WeekdaysViewController
        segueInfo.repeatWeekdays = src.weekdays
    }
    
    @objc func cancelButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}

extension AlarmAddEditViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections.
        
        if segueInfo.isEditMode {
            return 2
        }
        else {
            return 1
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: Identifier.settingIdentifier)
        if(cell == nil) {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: Identifier.settingIdentifier)
        }
        if indexPath.section == 0 {
            
            if indexPath.row == 0 {
                
                cell!.textLabel!.text = "Repeat"
                cell!.detailTextLabel!.text = WeekdaysViewController.repeatText(weekdays: segueInfo.repeatWeekdays)
                cell!.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
            }
            //               else if indexPath.row == 1 {
            //                   cell!.textLabel!.text = "Label"
            //                   cell!.detailTextLabel!.text = segueInfo.label
            //                   cell!.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
            //               }
            //               else if indexPath.row == 2 {
            //                   cell!.textLabel!.text = "Sound"
            //                   cell!.detailTextLabel!.text = segueInfo.mediaLabel
            //                   cell!.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
            //               }
            //               else if indexPath.row == 3 {
            //
            //                   cell!.textLabel!.text = "Snooze"
            //                   let sw = UISwitch(frame: CGRect())
            //                   sw.addTarget(self, action: #selector(AlarmAddEditViewController.snoozeSwitchTapped(_:)), for: UIControl.Event.touchUpInside)
            //
            //                   if snoozeEnabled {
            //                      sw.setOn(true, animated: false)
            //                   }
            //
            //                   cell!.accessoryView = sw
            //               }
        }
        else if indexPath.section == 1 {
            cell = UITableViewCell(
                style: UITableViewCell.CellStyle.default, reuseIdentifier: Identifier.settingIdentifier)
            cell!.textLabel!.text = "Delete Alarm"
            cell!.textLabel!.textAlignment = .center
            cell!.textLabel!.textColor = UIColor.red
        }
        
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        
        if indexPath.section == 0 {
            
            performSegue(withIdentifier: Identifier.weekdaysSegueIdentifier, sender: self)
            cell?.setSelected(true, animated: false)
            cell?.setSelected(false, animated: false)
            
        }
        else if indexPath.section == 1 {
            //delete alarm
            alarmModel.alarms.remove(at: segueInfo.curCellIndex)
            performSegue(withIdentifier: Identifier.saveSegueIdentifier, sender: self)
        }
        
    }
    
}
