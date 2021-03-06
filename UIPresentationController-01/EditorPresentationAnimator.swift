//
//  EditorPresentationAnimator.swift
//  UIPresentationController-01
//
//  Created by Daniel Wallace on 16/02/15.
//  Copyright (c) 2015 nz.co.danielw. All rights reserved.
//

import UIKit

class EditorPresentationAnimator: NSObject, UIViewControllerAnimatedTransitioning {
   
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        println("interactive = \(transitionContext.isInteractive())")
        
        if let presentedView = transitionContext.viewForKey(UITransitionContextToViewKey) {
            let centre = presentedView.center
            presentedView.center = CGPointMake(presentedView.bounds.size.width * 1.5, centre.y)
            
            transitionContext.containerView().addSubview(presentedView)
            
            if(transitionContext.isInteractive()){
                
                UIView.animateWithDuration(self.transitionDuration(transitionContext),
                    delay: 0.0,
                    options: UIViewAnimationOptions.CurveLinear,
                    animations: {
                        presentedView.center = centre
                    },
                    completion: {
                        finished in
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
                            presentedView.center = centre
                        },
                        completion: {
                            finished in
                                transitionContext.completeTransition(true)
                })
            }
        }
    }
    
//    func animationEnded(transitionCompleted: Bool) {
//        println("EditorPresentationAnimator - animationEnded(transitionCompleted:\(transitionCompleted))")
//    }
}
