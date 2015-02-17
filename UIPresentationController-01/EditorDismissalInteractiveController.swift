//
//  EditorDismissalInteractiveController.swift
//  UIPresentationController-01
//
//  Created by Daniel Wallace on 17/02/15.
//  Copyright (c) 2015 nz.co.danielw. All rights reserved.
//

import UIKit

class EditorDismissalInteractiveController: UIPercentDrivenInteractiveTransition {
   
    var editorVC: UIViewController! {
        didSet {
            println("EditorDismissalInteractiveController didSet editorVC = \(editorVC)")
            let dismissalPanGesture = UIPanGestureRecognizer()
            dismissalPanGesture.addTarget(self, action: "handleDismissalPan:")
            println("\(editorVC.view.gestureRecognizers?.count) editorVC recognizers!")
            editorVC.view.addGestureRecognizer(dismissalPanGesture)
        }
    }
    
    func handleDismissalPan(pan: UIPanGestureRecognizer) {
        println("EditorDismissalInteractiveController - handleDismissalPan(pan:\(pan))")
    }
}
