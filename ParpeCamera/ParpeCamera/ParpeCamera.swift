//
//  ParpeCamera.swift
//  ParpeCamera
//
//  Created by Diego Cavalcante Costa on 22/10/16.
//  Copyright © 2016 Diego Cavalcante Costa. All rights reserved.
//

import UIKit
import AVFoundation

class ParpeCamera: NSObject {
    
    fileprivate lazy var captureSession : AVCaptureSession? = {
        let session = AVCaptureSession()
        session.sessionPreset = AVCaptureSessionPresetHigh
        return session
    }()
    fileprivate lazy var previewLayer : AVCaptureVideoPreviewLayer = {
        let preview = AVCaptureVideoPreviewLayer(session: self.captureSession)
        preview?.videoGravity = AVLayerVideoGravityResizeAspectFill
        return preview!
    }()
    fileprivate lazy var captureDevice : AVCaptureDevice? = {
        let device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        try? device?.lockForConfiguration()
        device?.focusMode = .autoFocus
        device?.unlockForConfiguration()
        return device
    }()
    

}
