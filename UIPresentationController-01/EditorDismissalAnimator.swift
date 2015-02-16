//
//  EditorDismissalAnimator.swift
//  UIPresentationController-01
//
//  Created by Daniel Wallace on 17/02/15.
//  Copyright (c) 2015 nz.co.danielw. All rights reserved.
//

import UIKit

class EditorDismissalAnimator: NSObject, UIViewControllerAnimatedTransitioning {
   
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        println("EditorDismissalAnimator - transitionDuration(transitionContext:\(transitionContext))")
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        // -------------------------------------------------------------------------------------------------
        println("/EditorDismissalAnimator - animateTransition(transitionContext:\(transitionContext))")
        
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        
        println("EditorDismissalAnimator - animateTransition fromView = \(fromView)")
        println("EditorDismissalAnimator - animateTransition fromViewController = \(fromViewController)")
        
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        println("EditorDismissalAnimator - animateTransition toView = \(toView)")
        println("EditorDismissalAnimator - animateTransition toViewController = \(toViewController)")
        
        let containerView = transitionContext.containerView()
        println("EditorDismissalAnimator - animateTransition containerView = \(containerView)")
        // -------------------------------------------------------------------------------------------------
        
        if let presentedView = transitionContext.viewForKey(UITransitionContextFromViewKey) {
            
            let centre = presentedView.center
            
            UIView.animateWithDuration(self.transitionDuration(transitionContext),
                delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 5.0, options: nil,
                animations: {
                    presentedView.center = CGPointMake(presentedView.bounds.size.width*1.5, centre.y)
                }, completion: {
                    _ in
                    presentedView.removeFromSuperview()
                    transitionContext.completeTransition(true)
            })
        }
    }
    
    override func animationDidStart(anim: CAAnimation!) {
        println("EditorDismissalAnimator -animationDidStart(anim: \(anim))")
    }
    
    override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
        println("EditorDismissalAnimator - animationDidStop(anim:\(anim), finished:\(flag))")
    }
    
    func animationEnded(transitionCompleted: Bool) {
        println("EditorDismissalAnimator - animationEnded(transitionCompleted:\(transitionCompleted))")
    }
}
