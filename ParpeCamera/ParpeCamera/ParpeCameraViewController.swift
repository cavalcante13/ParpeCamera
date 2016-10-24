//
//  ParpeCameraViewController.swift
//  ParpeCamera
//
//  Created by Diego Cavalcante Costa on 18/10/16.
//  Copyright © 2016 Diego Cavalcante Costa. All rights reserved.
//

import UIKit
import AVFoundation
import QuartzCore

protocol ParpeCameraDelegate: class {
    func didSelectPhoto(_ image: UIImage)
}

class ParpeCameraViewController: UIViewController {
    weak var delegate : ParpeCameraDelegate?
    
    fileprivate lazy var screenSize : CGRect = {
        return UIScreen.main.bounds
    }()
    fileprivate lazy var touchUpInside : UITapGestureRecognizer = {
        let touch = UITapGestureRecognizer(target: self, action: #selector(ParpeCameraViewController.shotViewTouchUpInside))
        return touch
    }()
    fileprivate lazy var captureView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        return view
    }()
    fileprivate lazy var closeButton : UIButton = {
        let closeButton = UIButton(type: UIButtonType.custom)
        closeButton.setImage(UIImage(named: "close"), for: UIControlState.normal)
        closeButton.addTarget(self, action: #selector(ParpeCameraViewController.dismissViewController), for: UIControlEvents.touchUpInside)
        closeButton.imageView?.contentMode = .scaleAspectFill
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        return closeButton
    }()
    fileprivate lazy var flashButton : UIButton = {
        let closeButton = UIButton(type: UIButtonType.custom)
        closeButton.setImage(UIImage(named: "flash_active"), for: UIControlState.normal)
        closeButton.addTarget(self, action: #selector(ParpeCameraViewController.flashAction), for: UIControlEvents.touchUpInside)
        closeButton.imageView?.contentMode = .scaleAspectFill
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        return closeButton
    }()
    fileprivate lazy var shotView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.clear
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(self.touchUpInside)
        return view
    }()
    fileprivate lazy var imageView : UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 320, height: 568))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    fileprivate lazy var shotShapLayer : CAShapeLayer =  {
        let circlePath = UIBezierPath(arcCenter:.zero, radius: 35, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.borderColor = UIColor.gray.cgColor
        shapeLayer.lineWidth = 7.0
        return shapeLayer
    }()

    fileprivate lazy var camera : ParpeCamera = {
        return ParpeCamera()
    }()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.captureView)
        self.view.addSubview(self.shotView)
        self.view.addSubview(self.closeButton)
        self.view.addSubview(self.flashButton)        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        camera.startRunning()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupInterface()
    }
}
extension ParpeCameraViewController {
    fileprivate func setupInterface() {
        NSLayoutConstraint.activate([
            self.captureView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            self.captureView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            self.captureView.trailingAnchor.constraint(equalTo:self.view.trailingAnchor, constant: 0),
            self.captureView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
            ])
        NSLayoutConstraint.activate([
            self.shotView.widthAnchor.constraint(equalToConstant: 70),
            self.shotView.heightAnchor.constraint(equalToConstant: 70),
            self.shotView.centerXAnchor.constraint(equalTo: self.captureView.centerXAnchor),
            self.shotView.bottomAnchor.constraint(equalTo: self.captureView.bottomAnchor, constant: -20)
            ])
        NSLayoutConstraint.activate([
            self.closeButton.widthAnchor.constraint(equalToConstant: 70),
            self.closeButton.heightAnchor.constraint(equalToConstant: 70),
            self.closeButton.topAnchor.constraint(equalTo: self.captureView.layoutMarginsGuide.topAnchor),
            self.closeButton.leadingAnchor.constraint(equalTo: self.captureView.layoutMarginsGuide.leadingAnchor)
            ])
        NSLayoutConstraint.activate([
            self.flashButton.widthAnchor.constraint(equalToConstant: 70),
            self.flashButton.heightAnchor.constraint(equalToConstant: 70),
            self.flashButton.topAnchor.constraint(equalTo: self.captureView.layoutMarginsGuide.topAnchor),
            self.flashButton.trailingAnchor.constraint(equalTo: self.captureView.layoutMarginsGuide.trailingAnchor)
            ])
        
        camera.setupPreviewLayer(view: self.captureView)
        setupShotShapLayer()
    }
    private func setupShotShapLayer() {
        shotShapLayer.position = adjustShotViewPosition(view: self.shotView)
        self.shotView.layer.addSublayer(shotShapLayer)
    }
    private func adjustShotViewPosition(view : UIView)-> CGPoint {
        return CGPoint(x: view.frame.size.width / 2, y: view.frame.size.width / 2)
    }
}
extension ParpeCameraViewController {
    
    @objc public func shotViewTouchUpInside() {
        camera.takePhoto(view: self.captureView, cropSize: CGSize(width: 320, height: 568), completion: {(image)-> Void in
            self.view.addSubview(self.imageView)
            self.imageView.image = image
        })
    }
    @objc public func dismissViewController() {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    @objc public func flashAction() {
        
    }
}

