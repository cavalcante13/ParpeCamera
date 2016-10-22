////
////  ParpeCameraView.swift
////  ParpeCamera
////
////  Created by Diego Cavalcante Costa on 19/10/16.
////  Copyright © 2016 Diego Cavalcante Costa. All rights reserved.
////
//
import UIKit
//import AVFoundation
//
//@IBDesignable
class ParpeCameraView: UIView {
//
////    fileprivate lazy var captureView: UIView = {
////        let view = UIView()
////        view.translatesAutoresizingMaskIntoConstraints = false
////        return view
////    }()
////    fileprivate lazy var shotView: UIView = {
////        let view = UIView()
////        view.translatesAutoresizingMaskIntoConstraints = false
////        view.backgroundColor = UIColor.clear
////        return view
////    }()
////    fileprivate lazy var shotLayer : CAShapeLayer =  {
////        let circlePath = UIBezierPath(arcCenter: .zero, radius: 35, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true)
////        let shapeLayer = CAShapeLayer()
////        shapeLayer.path = circlePath.cgPath
////        shapeLayer.fillColor = UIColor.clear.cgColor
////        shapeLayer.strokeColor = UIColor.white.cgColor
////        shapeLayer.borderColor = UIColor.gray.cgColor
////        shapeLayer.lineWidth = 7.0
////        return shapeLayer
////    }()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
////        setupInitialization()
//    }
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
////        setupInitialization()
//    }
//}
////extension ParpeCameraView {
////    fileprivate func setupInitialization() {
////        translatesAutoresizingMaskIntoConstraints = false
////        for device in AVCaptureDevice.devices() {
////            if (device as AnyObject).hasMediaType(AVMediaTypeVideo) {
////                if (device as AnyObject).position == AVCaptureDevicePosition.back {
////                    self.captureDevice = device as? AVCaptureDevice
////                    if self.captureDevice != nil {
////                        startSession()
////                    }
////                }
////            }
////        }
////    }
////}
//
////extension ParpeCameraView {
////    fileprivate func startSession() {
////        do {
////            try self.captureSession?.addInput(AVCaptureDeviceInput(device: self.captureDevice))
////            setupInterface()
////            self.captureSession?.startRunning()
////        }catch let error as NSError {
////            print(error.localizedDescription)
////            return
////        }
////    }
////    func stopSession() {
////        self.captureSession?.stopRunning()
////    }
////}
//extension ParpeCameraView {
//    fileprivate func setupInterface() {
//        addSubview(self.captureView)
//        addSubview(self.shotView)
//        NSLayoutConstraint.activate([
//            self.captureView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
//            self.captureView.leadingAnchor.constraint(equalTo:  self.leadingAnchor, constant: 0),
//            self.captureView.trailingAnchor.constraint(equalTo:  self.trailingAnchor, constant: 0),
//            self.captureView.bottomAnchor.constraint(equalTo:  self.bottomAnchor, constant: 0)
//            ])
//    }
//    override func layoutSubviews() {
//        super.layoutSubviews()
////        self.previewLayer.frame = self.captureView.frame
////        self.captureView.layer.addSublayer(self.previewLayer)
//        self.shotView.layer.addSublayer(self.shotLayer)
//        layoutShotView()
//    }
//    
//    fileprivate func layoutShotView() {
//        let centerX = NSLayoutConstraint(item: self.shotView,
//                                              attribute: NSLayoutAttribute.centerX,
//                                              relatedBy: NSLayoutRelation.equal,
//                                              toItem: self.captureView,
//                                              attribute: NSLayoutAttribute.centerX,
//                                              multiplier: 1,
//                                              constant: 0)
//        let bottom = NSLayoutConstraint(item:  self.shotView,
//                                              attribute: NSLayoutAttribute.top,
//                                              relatedBy: NSLayoutRelation.equal,
//                                              toItem: self.captureView,
//                                              attribute: NSLayoutAttribute.bottomMargin,
//                                              multiplier: 1,
//                                              constant: -40)
//      
//        addConstraints([bottom, centerX])
//    }
//}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
}
