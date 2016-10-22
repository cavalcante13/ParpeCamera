//
//  ParpeCameraShot.swift
//  ParpeCamera
//
//  Created by Diego Cavalcante Costa on 22/10/16.
//  Copyright © 2016 Diego Cavalcante Costa. All rights reserved.
//

import UIKit
import AVFoundation

class ParpeCameraShot: NSObject {
    
    fileprivate lazy var stillImageOutput : AVCaptureStillImageOutput = {
        let stillImage = AVCaptureStillImageOutput()
        
        return stillImage
    }()

    public static func takePhoto(_ view: UIView, orientation: UIDeviceOrientation, cropSize: CGSize, completion: (UIImage)-> Void) {
        
        
        
    }
}

