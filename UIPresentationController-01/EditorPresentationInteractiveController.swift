//
//  EditorPresentationInteractiveController.swift
//  UIPresentationController-01
//
//  Created by Daniel Wallace on 17/02/15.
//  Copyright (c) 2015 nz.co.danielw. All rights reserved.
//

import UIKit

class EditorPresentationInteractiveController: UIPercentDrivenInteractiveTransition {
   
    var interactive = false
    
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
//        println("*** EditorPresentationInteractiveController - handlePresentationPan(pan:\(pan))")
        
        // how much distance have we panned in reference to the parent view?
        let translation = pan.translationInView(pan.view!)
        
        println("*** translation = \(translation)")
        
        // do some math to translate this to a percentage based value
        let d = translation.x / CGRectGetWidth(pan.view!.bounds) * -1.0//* -0.5
        
        println("*** d = \(d)")
        
        switch (pan.state) {
            
        case UIGestureRecognizerState.Began:
            println("*** EditorPresentationInteractiveController - handlePresentationPan UIGestureRecognizerState.Began")
            if let readOnlyViewController = readOnlyVC as? ReadOnlyViewController{
                readOnlyViewController.presentEditor()
            }
            self.interactive = true
            
        case UIGestureRecognizerState.Changed:
             println("*** EditorPresentationInteractiveController - handlePresentationPan UIGestureRecognizerState.Changed")
            // update progress of the transition
            self.updateInteractiveTransition(d)
            
        default: // .Ended, .Cancelled, .Failed
            
            // return interactive  flag to false and finish or cancel the transition
             println("*** EditorPresentationInteractiveController - handlePresentationPan UIGestureRecognizerState.Ended")
            
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
