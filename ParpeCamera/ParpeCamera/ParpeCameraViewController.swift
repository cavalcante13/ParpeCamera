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
        return ParpeCameraView(frame: CGRect(x: 0, y: 0, width: 320, height: 400))
    }()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(cameraView)
    }
}
