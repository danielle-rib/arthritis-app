//
//  WelcomeViewController.swift
//  Arthritis App
//
//  Created by Danielle Ribeiro on 2020-10-30.
//  Copyright © 2020 Danielle Ribeiro. All rights reserved.
//

import UIKit


class WalkthroughContentViewController: UIViewController {
    
    //MARK:outlets
    
    @IBOutlet var headingLabel: UILabel!{
        didSet{
            headingLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet var subHeadingLabel: UILabel!{
        didSet{
            subHeadingLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet var contentImageView: UIImageView!
        //MARK properties
        
    var index = 0
    var heading = ""
    var subHeading = ""
    var imageFile = ""

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        headingLabel.text = heading
        subHeadingLabel.text = subHeading
        contentImageView.image = UIImage(named: imageFile)
        
    }

    

}
