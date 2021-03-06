//
//  EditorViewController.swift
//  UIPresentationController-01
//
//  Created by Daniel Wallace on 16/02/15.
//  Copyright (c) 2015 nz.co.danielw. All rights reserved.
//

import UIKit

class EditorViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet var contentViewContraints: [NSLayoutConstraint]!
    
    @IBAction func dismissButtonPressed() {
        if let editorTransitioningDelegate = transitioningDelegate as? EditorTransitioningDelegate {
            
            editorTransitioningDelegate.interactive = false
            presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
            editorTransitioningDelegate.interactive = true
        }
    }
    
    override func viewDidLoad() {
        println("\(contentViewContraints.count)")
    }
}
