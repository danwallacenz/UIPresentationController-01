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
        return 0.6
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        println("interactive = \(transitionContext.isInteractive())")
        
        if let presentedView = transitionContext.viewForKey(UITransitionContextFromViewKey) {
            let centre = presentedView.center
            
            if transitionContext.isInteractive() {
                UIView.animateWithDuration(self.transitionDuration(transitionContext),
                    delay: 0.0,
                    options: UIViewAnimationOptions.CurveLinear,
                    animations: {
                        presentedView.center = CGPointMake(presentedView.bounds.size.width*1.5, centre.y)
                    }, completion: {
                        finished in
                            println("EditorDismissalAnimator - transaction finished = \(finished)")
                            if(transitionContext.transitionWasCancelled()) {
                                transitionContext.completeTransition(false)
                            } else {
                                transitionContext.completeTransition(true)
                            }
                })
            
            } else {
                // non-interactive - gradual stop
                UIView.animateWithDuration(self.transitionDuration(transitionContext),
                    delay: 0.0,
                    usingSpringWithDamping: 1.0,
                    initialSpringVelocity: 1,
                    options: nil,
                    animations: {
                        presentedView.center = CGPointMake(presentedView.bounds.size.width*1.5, centre.y)
                    },
                    completion: {
                        finished in
                        transitionContext.completeTransition(true)
                })
            }
        }
    }
    
//    func animationEnded(transitionCompleted: Bool) {
//        println("EditorDismissalAnimator - animationEnded(transitionCompleted:\(transitionCompleted))")
//    }
}
