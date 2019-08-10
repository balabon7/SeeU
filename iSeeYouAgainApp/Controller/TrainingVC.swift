//
//  TwoViewController.swift
//  iSeeYouAgainApp
//
//  Created by mac on 17.07.2019.
//  Copyright © 2019 sashabalabon. All rights reserved.
//

import UIKit

class TrainingVC: UIViewController {
    
    var TrTittle = String()
    var TrImage = UIImage()
    var TrLabelText = String()
    
    @IBOutlet weak var trainingImageView: UIImageView!
    @IBOutlet weak var trainingLabel: UILabel!
    @IBOutlet var skinButton: [UIButton]!
    
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for value in skinButton {
            value.layer.cornerRadius = 10
        }
        
        trainingLabel.text = TrLabelText
        trainingImageView.image = TrImage
        title = TrTittle
        leftButton.isHidden = true
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        if title == infoSix.tittle, trainingImageView.image == UIImage(named: infoSix.image), trainingLabel.text == infoSix.description {
            
            title = infoFive.tittle
            trainingImageView.image = UIImage(named: infoFive.image)
            trainingLabel.text = infoFive.description
            rightButton.isHidden = false
        } else if title == infoFive.tittle, trainingImageView.image == UIImage(named: infoFive.image), trainingLabel.text == infoFive.description {
            
            title = infoFour.tittle
            trainingImageView.image = UIImage(named: infoFour.image)
            trainingLabel.text = infoFour.description
           // rightButton.isHidden = false
        } else if title == infoFour.tittle, trainingImageView.image == UIImage(named: infoFour.image), trainingLabel.text == infoFour.description {
            
            title = infoThree.tittle
            trainingImageView.image = UIImage(named: infoThree.image)
            trainingLabel.text = infoThree.description
            
        } else if title == infoThree.tittle, trainingImageView.image == UIImage(named: infoThree.image), trainingLabel.text == infoThree.description {
            
            title = infoTwo.tittle
            trainingImageView.image = UIImage(named: infoTwo.image)
            trainingLabel.text = infoTwo.description
            
        } else if title == infoTwo.tittle, trainingImageView.image == UIImage(named: infoTwo.image), trainingLabel.text == infoTwo.description {
            
            title = infoOne.tittle
            trainingImageView.image = UIImage(named: infoOne.image)
            trainingLabel.text = infoOne.description
            leftButton.isHidden = true
        }
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        if title == infoOne.tittle, trainingImageView.image == UIImage(named: infoOne.image), trainingLabel.text == infoOne.description {
            
            title = infoTwo.tittle
            trainingImageView.image = UIImage(named: infoTwo.image)
            trainingLabel.text = infoTwo.description
            leftButton.isHidden = false
            
        } else if title == infoTwo.tittle, trainingImageView.image == UIImage(named: infoTwo.image), trainingLabel.text == infoTwo.description {
            
            title = infoThree.tittle
            trainingImageView.image = UIImage(named: infoThree.image)
            trainingLabel.text = infoThree.description
            leftButton.isHidden = false
            
        } else if title == infoThree.tittle, trainingImageView.image == UIImage(named: infoThree.image), trainingLabel.text == infoThree.description {
            
            title = infoFour.tittle
            trainingImageView.image = UIImage(named: infoFour.image)
            trainingLabel.text = infoFour.description
        } else if title == infoFour.tittle, trainingImageView.image == UIImage(named: infoFour.image), trainingLabel.text == infoFour.description {
            
            title = infoFive.tittle
            trainingImageView.image = UIImage(named: infoFive.image)
            trainingLabel.text = infoFive.description
          
        } else if title == infoFive.tittle, trainingImageView.image == UIImage(named: infoFive.image), trainingLabel.text == infoFive.description {
            
            title = infoSix.tittle
            trainingImageView.image = UIImage(named: infoSix.image)
            trainingLabel.text = infoSix.description
            rightButton.isHidden = true
        }
        else if title == infoFive.tittle, trainingImageView.image == UIImage(named: infoFive.image), trainingLabel.text == infoFive.description {
            
            title = infoSix.tittle
            trainingImageView.image = UIImage(named: infoSix.image)
            trainingLabel.text = infoSix.description
        }
        
        
    }
    
}
