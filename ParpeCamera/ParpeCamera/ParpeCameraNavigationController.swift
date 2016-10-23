//
//  ParpeCameraNavigationController.swift
//  ParpeCamera
//
//  Created by Diego Cavalcante Costa on 18/10/16.
//  Copyright © 2016 Diego Cavalcante Costa. All rights reserved.
//

import UIKit
import AVFoundation

class ParpeCameraNavigationController: UINavigationController {
    
    static func newParpeCameraDelegate(_ delegate : ParpeCameraDelegate)-> ParpeCameraNavigationController {
        let parpeCamera = ParpeCameraNavigationController()
        parpeCamera.isNavigationBarHidden = true
        
        let status = AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo)
        switch status {
        case .authorized:
            parpeCamera.setupAuthorizationDelegate(delegate)
            break
        case .notDetermined:
            parpeCamera.setupAuthorizationDelegate(delegate)
            break
        default:
            break
        }
    
        return parpeCamera
    }
    
    func setupAuthorizationDelegate(_ delegate : ParpeCameraDelegate) {
        let parpeCameraViewController = ParpeCameraViewController()
        parpeCameraViewController.delegate = delegate
        
        self.viewControllers.append(parpeCameraViewController)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.setStatusBarHidden(true, with: .fade)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        UIApplication.shared.setStatusBarHidden(false, with: .fade)
    }

    override var shouldAutorotate : Bool {
        return true
    }
}
