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
    
    fileprivate lazy var cameraView : ParpeCameraView = {
        return ParpeCameraView(frame: .zero)
    }()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.cameraView)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        NSLayoutConstraint.activate([
            self.cameraView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            self.cameraView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            self.cameraView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            self.cameraView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0)
            ])
        
        self.cameraView.setContentHuggingPriority(UILayoutPriorityDefaultHigh, for: .horizontal)
        self.view.setContentHuggingPriority(UILayoutPriorityDefaultHigh, for: .horizontal)
    }
}
