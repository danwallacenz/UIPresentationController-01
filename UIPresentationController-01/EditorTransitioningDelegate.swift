//
//  EditorTransitioningDelegate.swift
//  BouncyPresent
//
//  Created by Daniel Wallace on 16/02/15.
//  Copyright (c) 2015 ShinobiControls. All rights reserved.
//

import UIKit

class EditorTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
   
    
    
    var presentingController: UIViewController! {
        didSet {
            
        }
    }
    
    var presentedController: UIViewController! {
        didSet {
            
        }
    }
    
    var sourceController: UIViewController! {
        didSet {
            
        }
    }
    
    // MARK: Getting the Custom Presentation Controller
    func presentationControllerForPresentedViewController(presented: UIViewController!,
        presentingViewController presenting: UIViewController!,
        sourceViewController source: UIViewController!) -> UIPresentationController! {
            
            println("EditorTransitioningDelegate - presentationControllerForPresentedViewController(presented:\(presented) presenting:\(presenting) source: \(source)")
            
            return EditorPresentationController(presentedViewController: presented,
                presentingViewController: presenting)
    }
    
    // MARK: Getting the Transition Animator Objects
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        println("EditorTransitioningDelegate - animationControllerForPresentedController(presented:\(presented) presenting:\(presenting) source: \(source)")
        
        self.presentingController = presented
        self.presentedController = presenting
        self.sourceController = source
        
        return EditorPresentationAnimator()
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return EditorDismissalAnimator()
    }
    
    override func animationDidStart(anim: CAAnimation!) {
        println("EditorTransitioningDelegate - animationDidStart(anim: \(anim))")
    }
    
    override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
        println("EditorTransitioningDelegate - animationDidStop(anim: \(anim), finished:\(flag))")
    }
    
    // MARK: Getting the Interactive Animator Objects
//    func interactionControllerForPresentation(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//        return EditorPresentationInteractiveController()
//    }
//    
//    func interactionControllerForDismissal(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//        return EditorDismissalInteractiveController()
//    }
}
