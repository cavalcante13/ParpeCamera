//
//  ParpeCameraView.swift
//  ParpeCamera
//
//  Created by Diego Cavalcante Costa on 19/10/16.
//  Copyright © 2016 Diego Cavalcante Costa. All rights reserved.
//

import UIKit
import AVFoundation

@IBDesignable
class ParpeCameraView: UIView {
    
    private lazy var captureSession : AVCaptureSession? = {
        let session = AVCaptureSession()
        session.sessionPreset = AVCaptureSessionPresetMedium
        return session
    }()
    private lazy var previewLayer : AVCaptureVideoPreviewLayer = {
        let preview = AVCaptureVideoPreviewLayer(session: self.captureSession)
        return preview
    }()
    private lazy var captureDevice : AVCaptureDevice? = {
        let device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        device.focusMode = .Locked
        device.unlockForConfiguration()
        return device
    }()
    private lazy var captureView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupInitialization()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupInitialization()
    }
    
    
}
extension ParpeCameraView {

    private func setupInitialization() {
        translatesAutoresizingMaskIntoConstraints = false
        
        for device in AVCaptureDevice.devices() {
            if device.hasMediaType(AVMediaTypeVideo) {
                if device.position == AVCaptureDevicePosition.Back {
                    self.captureDevice = device as? AVCaptureDevice
                    if self.captureDevice != nil {
                        print("Capture Device found")
                        startSession()
                    }
                }
            }
        }
    }
}

extension ParpeCameraView {
    private func startSession() {
        do {
            try self.captureSession?.addInput(AVCaptureDeviceInput(device: self.captureDevice))
        }catch let error as NSError {
            print(error.localizedDescription)
        }
        
        self.layer.addSublayer(previewLayer)
        previewLayer.frame = self.layer.frame
        captureSession?.startRunning()
    }
    
}











