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
            
            // Add pan gesture recognizer
            let presentationPanGesture = UIPanGestureRecognizer()
            presentationPanGesture.addTarget(self, action: "handlePresentationPan:")
            readOnlyVC.view.addGestureRecognizer(presentationPanGesture)
        }
    }
    
    func handlePresentationPan(pan: UIPanGestureRecognizer) {
        
        // how much distance have we panned in reference to the parent view?
        let translation = pan.translationInView(pan.view!)
        // do some math to translate this to a percentage based value
        let d = translation.x / CGRectGetWidth(pan.view!.bounds) * -1.0//* -0.5
        
        switch (pan.state) {
            
            case UIGestureRecognizerState.Began:
                
                if let readOnlyViewController = readOnlyVC as? ReadOnlyViewController{
                    readOnlyViewController.presentEditor()
                }
                
            case UIGestureRecognizerState.Changed:
                // update progress of the transition
                self.updateInteractiveTransition(d)
                
            default: // .Ended, .Cancelled, .Failed
                
                if d > 0.2 {
                    // threshold crossed: finish
                    self.finishInteractiveTransition()
                } else {
                    // threshold not met: cancel
                    self.cancelInteractiveTransition()
                }
        }
    }
}
