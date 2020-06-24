//
//  ViewController.swift
//  iSeeYouAgainApp
//
//  Created by mac on 16.07.2019.
//  Copyright © 2019 sashabalabon. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var propertiesButtons: [UIButton]!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for value in propertiesButtons {
            value.layer.cornerRadius = 10
        }
    }
    
     override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
        navigationController?.navigationBar.tintColor = UIColor(hex: 0x007AFF)
      
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)  {
        if segue.identifier == "firstSegue" || segue.identifier == "startSegue" {
            let DestinationViewController: TrainingVC = segue.destination as! TrainingVC
            DestinationViewController.TrTittle = infoOne.tittle
            DestinationViewController.TrLabelText = infoOne.description
            DestinationViewController.TrImage = UIImage(named: infoOne.image)!
            
        }
    }
}
