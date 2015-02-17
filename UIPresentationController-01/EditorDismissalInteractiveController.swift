//
//  EditorDismissalInteractiveController.swift
//  UIPresentationController-01
//
//  Created by Daniel Wallace on 17/02/15.
//  Copyright (c) 2015 nz.co.danielw. All rights reserved.
//

import UIKit

class EditorDismissalInteractiveController: UIPercentDrivenInteractiveTransition {
   
    var interactive = false
    
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
        // how much distance have we panned in reference to the parent view?
        let translation = pan.translationInView(pan.view!)
        
        println("*** translation = \(translation)")
        
        // do some math to translate this to a percentage based value
        let d = translation.x / CGRectGetWidth(pan.view!.bounds) // * 0.5
        
        println("*** d = \(d)")
        
        switch (pan.state) {
            
        case UIGestureRecognizerState.Began:
            self.interactive = true
            editorVC?.dismissViewControllerAnimated(true, completion: nil)
            
        case UIGestureRecognizerState.Changed:
            println("*** EditorDismissalInteractiveController - handlePresentationPan UIGestureRecognizerState.Changed")
            // update progress of the transition
            self.updateInteractiveTransition(d)
            
        default: // .Ended, .Cancelled, .Failed
            
            // return interactive  flag to false and finish or cancel the transition
            println("*** EditorDismissalInteractiveController - handlePresentationPan UIGestureRecognizerState.Ended")
            
            self.interactive = false
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
