//
//  EditorPresentationInteractiveController.swift
//  UIPresentationController-01
//
//  Created by Daniel Wallace on 17/02/15.
//  Copyright (c) 2015 nz.co.danielw. All rights reserved.
//

import UIKit

class EditorPresentationInteractiveController: UIPercentDrivenInteractiveTransition {
   
    var readOnlyVC: UIViewController! {
        didSet {
            println("EditorPresentationInteractiveController didSet readOnlyVC = \(readOnlyVC)")
            let presentationPanGesture = UIPanGestureRecognizer()
            presentationPanGesture.addTarget(self, action: "handlePresentationPan:")
            println("\(readOnlyVC.view.gestureRecognizers?.count) readOnlyVC recognizers!")
            readOnlyVC.view.addGestureRecognizer(presentationPanGesture)
        }
    }
    
    func handlePresentationPan(pan: UIPanGestureRecognizer) {
        println("EditorPresentationInteractiveController - handlePresentationPan(pan:\(pan))")
    }
}
