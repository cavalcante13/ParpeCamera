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
    
    static func newParpeCameraDelegate(delegate : ParpeCameraDelegate)-> ParpeCameraNavigationController {
        let parpeCamera = ParpeCameraNavigationController()
        parpeCamera.navigationBarHidden = true
        
        let status = AVCaptureDevice.authorizationStatusForMediaType(AVMediaTypeVideo)
        switch status {
        case .Authorized:
            parpeCamera.setupAuthorizationDelegate(delegate)
            break
        case .NotDetermined:
            parpeCamera.setupAuthorizationDelegate(delegate)
            break
        default:
            break
        }
    
        return parpeCamera
    }
    
    func setupAuthorizationDelegate(delegate : ParpeCameraDelegate) {
        let parpeCameraViewController = ParpeCameraViewController()
        parpeCameraViewController.delegate = delegate
        
        self.viewControllers.append(parpeCameraViewController)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.sharedApplication().setStatusBarHidden(true, withAnimation: .Fade)
    }
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        UIApplication.sharedApplication().setStatusBarHidden(false, withAnimation: .Fade)
    }

    override func shouldAutorotate() -> Bool {
        return false
    }
}
