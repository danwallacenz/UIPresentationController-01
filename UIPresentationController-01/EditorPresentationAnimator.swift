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
        println("EditorPresentationAnimator - transitionDuration(transitionContext:\(transitionContext))")
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        println("/nEditorPresentationAnimator - animateTransition(transitionContext:\(transitionContext))")
        
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        
        println("EditorPresentationAnimator - animateTransition fromView = \(fromView)")
        println("EditorPresentationAnimator - animateTransition fromViewController = \(fromViewController)")
        
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        println("EditorPresentationAnimator - animateTransition toView = \(toView)")
        println("EditorPresentationAnimator - animateTransition toViewController = \(toViewController)")
        
        let containerView = transitionContext.containerView()
        println("EditorPresentationAnimator - animateTransition containerView = \(containerView)")
        
        if let presentedView = transitionContext.viewForKey(UITransitionContextToViewKey) {
            let centre = presentedView.center
            presentedView.center = CGPointMake(centre.x, -presentedView.bounds.size.height)
            
            transitionContext.containerView().addSubview(presentedView)
            
            UIView.animateWithDuration(self.transitionDuration(transitionContext),
                delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 10.0, options: nil,
                animations: {
                    presentedView.center = centre
                }, completion: {
                    _ in
                    transitionContext.completeTransition(true)
            })
        }
    }
    
    override func animationDidStart(anim: CAAnimation!) {
        println("EditorPresentationAnimator -animationDidStart(anim: \(anim))")
    }
    
    override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
        println("EditorPresentationAnimator - animationDidStop(anim:\(anim), finished:\(flag))")
    }
    
    func animationEnded(transitionCompleted: Bool) {
        println("EditorPresentationAnimator - animationEnded(transitionCompleted:\(transitionCompleted))")
    }
}
