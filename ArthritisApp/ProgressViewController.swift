//
//  ProgressViewController.swift
//  Arthritis App
//
//  Created by Danielle Ribeiro on 2020-10-22.
//  Copyright © 2020 Danielle Ribeiro. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Accelerate


class ProgressViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let first: [Float] = [10,20,30,40]
        let second: [Float] = [1,2,3,4]
        let result = vDSP.multiply(first, second)
        print(result)
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
