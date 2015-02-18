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

            // Add pan gesture recognizer
            let dismissalPanGesture = UIPanGestureRecognizer()
            dismissalPanGesture.addTarget(self, action: "handleDismissalPan:")
            editorVC.view.addGestureRecognizer(dismissalPanGesture)
        }
    }
    
    func handleDismissalPan(pan: UIPanGestureRecognizer) {
        
        // how much distance have we panned in reference to the parent view?
        let translation = pan.translationInView(pan.view!)
        // do some math to translate this to a percentage based value
        let d = translation.x / CGRectGetWidth(pan.view!.bounds) // * 0.5

        switch (pan.state) {
            
            case UIGestureRecognizerState.Began:

                editorVC?.dismissViewControllerAnimated(true, completion: nil)
                
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
