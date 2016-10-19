//
//  ViewController.swift
//  ParpeCamera
//
//  Created by Diego Cavalcante Costa on 18/10/16.
//  Copyright © 2016 Diego Cavalcante Costa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ParpeCameraDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func openCamera(_ sender: AnyObject) {
        let parpeCamera = ParpeCameraNavigationController.newParpeCameraDelegate(self)
        self.present(parpeCamera, animated: true, completion: nil)
    }
    
    func didSelectPhoto(_ image: UIImage) {
        
    }
}

