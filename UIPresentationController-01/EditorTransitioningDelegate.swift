//
//  EditorTransitioningDelegate.swift
//  BouncyPresent
//
//  Created by Daniel Wallace on 16/02/15.
//  Copyright (c) 2015 ShinobiControls. All rights reserved.
//

import UIKit

class EditorTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
   
    let interactivePresenter  = EditorPresentationInteractiveController()
    let interactiveDismisser  = EditorDismissalInteractiveController()
    
    var interactive = true
    
    
    // Pass these VCs through to the interaction controllers
    // MARK: Pass through the VCs
    var readOnlyVC: UIViewController! {
        didSet {
            interactivePresenter.readOnlyVC = readOnlyVC
        }
    }
    var editorVC: UIViewController! {
        didSet {
            interactiveDismisser.editorVC = editorVC
        }
    }
    
    
    // MARK: Getting the Custom Presentation Controller
    func presentationControllerForPresentedViewController(presented: UIViewController!,
        presentingViewController presenting: UIViewController!,
        sourceViewController source: UIViewController!) -> UIPresentationController! {

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

    
    // MARK: Getting the Interactive Animator Objects
    func interactionControllerForPresentation(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self.interactive ? interactivePresenter : nil
    }
    
    func interactionControllerForDismissal(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self.interactive ? interactiveDismisser : nil
    }
}
