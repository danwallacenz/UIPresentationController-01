//
//  EditorViewController.swift
//  UIPresentationController-01
//
//  Created by Daniel Wallace on 16/02/15.
//  Copyright (c) 2015 nz.co.danielw. All rights reserved.
//

import UIKit

class EditorViewController: UIViewController {

    @IBAction func dismissButtonPressed() {
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
