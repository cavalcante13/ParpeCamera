//
//  ParpeCameraViewController.swift
//  ParpeCamera
//
//  Created by Diego Cavalcante Costa on 18/10/16.
//  Copyright © 2016 Diego Cavalcante Costa. All rights reserved.
//

import UIKit
protocol ParpeCameraDelegate: class {
    func didSelectPhoto(_ image: UIImage)
}

class ParpeCameraViewController: UIViewController {
    weak var delegate : ParpeCameraDelegate?
    
    fileprivate lazy var captureView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    fileprivate lazy var shotView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.clear
        return view
    }()
    fileprivate lazy var shotShapLayer : CAShapeLayer =  {
        let circlePath = UIBezierPath(arcCenter: .zero, radius: 35, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.borderColor = UIColor.gray.cgColor
        shapeLayer.lineWidth = 7.0
        return shapeLayer
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
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupInterface()
        updateViewConstraints()
    }
}
extension ParpeCameraViewController {
    fileprivate func setupInterface() {
        NSLayoutConstraint.activate([
            self.captureView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            self.captureView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            self.captureView.trailingAnchor.constraint(equalTo:self.view.trailingAnchor, constant: 0),
            self.captureView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0)
            ])
        NSLayoutConstraint.activate([
            self.shotView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.shotView.topAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -54)
            ])
        
        self.shotView.layer.addSublayer(self.shotShapLayer)
    }
}

