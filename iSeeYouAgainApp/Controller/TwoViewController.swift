//
//  TwoViewController.swift
//  iSeeYouAgainApp
//
//  Created by mac on 17.07.2019.
//  Copyright © 2019 sashabalabon. All rights reserved.
//

import UIKit

class TwoViewController: UIViewController {
    
    
    @IBOutlet weak var nextImageView: UIImageView!
    @IBOutlet weak var nextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = infoOne.tittle
        nextImageView.image = UIImage(named: infoOne.image)
        nextLabel.text = infoOne.description
    }
    
    
    @IBAction func nextButton(_ sender: UIButton) {
        
        if title == infoOne.tittle, nextImageView.image == UIImage(named: infoOne.image), nextLabel.text == infoOne.description {
            
            title = infoTwo.tittle
            nextImageView.image = UIImage(named: infoTwo.image)
            nextLabel.text = infoTwo.description
        } else if title == infoTwo.tittle, nextImageView.image == UIImage(named: infoTwo.image), nextLabel.text == infoTwo.description {
            
            title = infoThree.tittle
            nextImageView.image = UIImage(named: infoThree.image)
            nextLabel.text = infoThree.description
            
        } else if title == infoThree.tittle, nextImageView.image == UIImage(named: infoThree.image), nextLabel.text == infoThree.description {
            
            title = infoFour.tittle
            nextImageView.image = UIImage(named: infoFour.image)
            nextLabel.text = infoFour.description
        } else if title == infoFour.tittle, nextImageView.image == UIImage(named: infoFour.image), nextLabel.text == infoFour.description {
            
            title = infoFive.tittle
            nextImageView.image = UIImage(named: infoFive.image)
            nextLabel.text = infoFive.description
        } else if title == infoFive.tittle, nextImageView.image == UIImage(named: infoFive.image), nextLabel.text == infoFive.description {
            
            title = infoSix.tittle
            nextImageView.image = UIImage(named: infoSix.image)
            nextLabel.text = infoSix.description
        }
        
    }
    
}
