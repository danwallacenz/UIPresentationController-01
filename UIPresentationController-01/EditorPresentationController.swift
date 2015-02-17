//
//  EditorPresentationController.swift
//  UIPresentationController-01
//
//  Created by Daniel Wallace on 16/02/15.
//  Copyright (c) 2015 nz.co.danielw. All rights reserved.
//

import UIKit

class EditorPresentationController: UIPresentationController {
   
    
    override init(presentedViewController: UIViewController!, presentingViewController: UIViewController!) {
        
        super.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController)
        
        println("EditorPresentationController - containerView is \(containerView)")
        println("EditorPresentationController - presentingViewController is \(presentingViewController)")
        println("EditorPresentationController - presentedViewController is \(presentedViewController)")
        
//        dimmingView.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
    }
    
    // MARK: The presentation phase
    // ...  involves moving the new view controller onscreen through a series of transition animations.
    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        println("\nEditorPresentationController - presentationTransitionWillBegin()")
        println("EditorPresentationController - presentationTransitionWillBegin() containerView is \(containerView)")
        
    }
    
    override func presentationTransitionDidEnd(completed: Bool) {
        super.presentationTransitionDidEnd(completed)
         println("EditorPresentationController - presentationTransitionDidEnd(\(completed))")
    }

    // MARK: The dismissal phase
    // ... involves moving the new view controller off screen through a series of transition animations.
    override func dismissalTransitionWillBegin() {
        super.dismissalTransitionWillBegin()
        println("\nEditorPresentationController - dismissalTransitionWillBegin")
    }
    
    override func dismissalTransitionDidEnd(completed: Bool) {
        super.dismissalTransitionDidEnd(completed)
        println("EditorPresentationController - dismissalTransitionDidEnd(\(completed))")
    }
    
    // MARK: The management phase
    // ... involves responding to environment changes (such as device rotations) while the new view controller is onscreen.
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        println("EditorPresentationController - containerViewWillLayoutSubviews")
    }
    
    override func containerViewDidLayoutSubviews() {
        super.containerViewDidLayoutSubviews()
        println("EditorPresentationController - containerViewDidLayoutSubviews")
    }
    
    override func willTransitionToTraitCollection(newCollection: UITraitCollection, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransitionToTraitCollection(newCollection, withTransitionCoordinator: coordinator)
        println("\nEditorPresentationController - willTransitionToTraitCollection(newCollection: \(newCollection) coordinator: \(coordinator)")
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        println("EditorPresentationController - viewWillTransitionToSize(size:\(size) coordinator:\(coordinator))")
    }
    
    // MARK: Adjusting the Size and Layout of the Presentation
//    override func frameOfPresentedViewInContainerView() -> CGRect {
//        return containerView.bounds.rectByInsetting(dx: 30, dy: 30) // Doesn't work!!
//    }
}
