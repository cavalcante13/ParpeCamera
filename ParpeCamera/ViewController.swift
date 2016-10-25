//
//  ViewController.swift
//  ParpeCamera
//
//  Created by Diego Cavalcante Costa on 18/10/16.
//  Copyright © 2016 Diego Cavalcante Costa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ParpeCameraDelegate {

    fileprivate lazy var navigationBarTransparent : UINavigationBar = {
        let nav = self.navigationController?.navigationBar
        nav?.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        nav?.shadowImage = UIImage()
        nav?.isTranslucent = true
        nav?.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white, NSFontAttributeName : UIFont.systemFont(ofSize: 20)]
        return nav!
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Parpe Camera"
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        _ = navigationBarTransparent
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

