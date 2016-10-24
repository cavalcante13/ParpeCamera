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
    
    fileprivate lazy var session : AVCaptureSession? = {
        let session = AVCaptureSession()
        session.sessionPreset = AVCaptureSessionPresetPhoto
        return session
    }()
    fileprivate lazy var stillImageOutput : AVCaptureStillImageOutput = {
        let stillImage = AVCaptureStillImageOutput()
        return stillImage
    }()
    fileprivate lazy var previewLayer : AVCaptureVideoPreviewLayer = {
        let preview = AVCaptureVideoPreviewLayer(session: self.session)
        preview?.videoGravity = AVLayerVideoGravityResizeAspectFill
        return preview!
    }()

    override init() {
        super.init()
        let device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        do {
            try device?.lockForConfiguration()
            if let device = device {
                if device.isAutoFocusRangeRestrictionSupported {
                    device.autoFocusRangeRestriction = AVCaptureAutoFocusRangeRestriction.near
                }
                if device.isFocusModeSupported(AVCaptureFocusMode.autoFocus){
                    device.focusMode = .continuousAutoFocus
                }
                device.unlockForConfiguration()
            }
        }catch { print("device lockForConfiguration"); return }
        
        do {
            let input = try AVCaptureDeviceInput(device: device)
            self.session?.addInput(input)
            let outputSetting : [String : String] = [AVVideoCodecKey : AVVideoCodecJPEG]
            stillImageOutput.outputSettings = outputSetting
            self.session?.addOutput(stillImageOutput)
        }catch { return }
    }
}


extension ParpeCamera {
    public func setupPreviewLayer(view : UIView) {
        self.previewLayer.frame = view.frame
        view.layer.addSublayer(previewLayer)
    }
    public func startRunning() {
        self.session?.startRunning()
    }
    public func cameraFocus(focus : Float) {
        let device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        do {
            try device?.lockForConfiguration()
            if let device = device {
                device.setFocusModeLockedWithLensPosition(focus, completionHandler: nil)
                device.unlockForConfiguration()
            }
        }catch { return }
    }
}

extension ParpeCamera {
    public func takePhoto(view : UIView, cropSize : CGSize, completion: @escaping (UIImage)-> Void) {
        let connection = stillImageOutput.connection(withMediaType: AVMediaTypeVideo)
        connection?.videoOrientation = .portrait
        
        stillImageOutput.captureStillImageAsynchronously(from: connection, completionHandler: {(imageDataBuffer, error)-> Void in
            if let imageBuffer = imageDataBuffer {
                if let imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(imageBuffer) {
                    let image = UIImage(data: imageData)
                    completion(image!)
                }
            }
        })
    }
    
    public func focus(touchPoint : CGPoint, view : UIView) {
        let device = self.session?.inputs.last
        
    }
}










