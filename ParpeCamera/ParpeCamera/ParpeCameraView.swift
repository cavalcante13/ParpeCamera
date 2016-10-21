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
    fileprivate lazy var captureView: UIView = {
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
    fileprivate func setupInitialization() {
        translatesAutoresizingMaskIntoConstraints = false
        for device in AVCaptureDevice.devices() {
            if (device as AnyObject).hasMediaType(AVMediaTypeVideo) {
                if (device as AnyObject).position == AVCaptureDevicePosition.back {
                    self.captureDevice = device as? AVCaptureDevice
                    if self.captureDevice != nil {
                        startSession()
                    }
                }
            }
        }
    }
}

extension ParpeCameraView {
    fileprivate func startSession() {
        do {
            try self.captureSession?.addInput(AVCaptureDeviceInput(device: self.captureDevice))
        }catch let error as NSError {
            print(error.localizedDescription)
        }
        setupInterface()
        self.captureSession?.startRunning()
    }
}
extension ParpeCameraView {
    fileprivate func setupInterface() {
        addSubview(self.captureView)
        NSLayoutConstraint.activate([
            self.captureView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            self.captureView.leadingAnchor.constraint(equalTo:  self.leadingAnchor, constant: 0),
            self.captureView.trailingAnchor.constraint(equalTo:  self.trailingAnchor, constant: 0),
            self.captureView.bottomAnchor.constraint(equalTo:  self.bottomAnchor, constant: 0)
            ])
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.previewLayer.frame = self.captureView.frame
        self.captureView.layer.addSublayer(self.previewLayer)
    }
}











