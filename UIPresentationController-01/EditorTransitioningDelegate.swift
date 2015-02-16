//
//  EditorTransitioningDelegate.swift
//  BouncyPresent
//
//  Created by Daniel Wallace on 16/02/15.
//  Copyright (c) 2015 ShinobiControls. All rights reserved.
//

import UIKit

class EditorTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
   
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
}
