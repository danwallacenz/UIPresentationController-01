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
        
//        dimmingView.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
    }
    
     // MARK: The presentation phase
     // ...  involves moving the new view controller onscreen through a series of transition animations.
    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        println("\nEditorPresentationController - presentationTransitionWillBegin()")
        println("EditorPresentationController - presentationTransitionWillBegin() containerView is \(containerView)")
//        addBlur()
        addVibrancy()
    }
    
    override func presentationTransitionDidEnd(completed: Bool) {
        super.presentationTransitionDidEnd(completed)
        println("EditorPresentationController - presentationTransitionDidEnd(\(completed))")
    }

    
    // MARK: UIVisualEffects
    private func addBlur() {
        
//        if let editorVC = presentedViewController as? EditorViewController {
//            if let contentView = editorVC.contentView {
//                println("temp!!!!!!")
//                contentView.backgroundColor = UIColor.redColor().colorWithAlphaComponent(0.4)
//            }
//        }
        
        let blurEffect = UIBlurEffect(style: .ExtraLight)
        
        // Create a UIVisualEffectView and tell it which effect to use. This class is a subclass of UIView; its sole purpose is to define and display complex visual effects.
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.presentedView().frame
        
        //  Disable translating the auto-resizing masks into constraints on the blurView, as you’ll manually add constraints in just a moment, and add it at the bottom of view stack.
        // If you just added blurView on top of the view, it would end up blurring all of the controls underneath it instead!
        blurView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.presentedView().insertSubview(blurView, atIndex: 0)
        
        // blurView constraints
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(NSLayoutConstraint(item: blurView, attribute: .Height, relatedBy: .Equal,
            toItem: self.presentedView(), attribute: .Height, multiplier: 1, constant: 0))
        
        constraints.append(NSLayoutConstraint(item: blurView, attribute: .Width, relatedBy: .Equal,
            toItem: self.presentedView(), attribute: .Width, multiplier: 1, constant: 0))
        
        self.presentedView().addConstraints(constraints)
    }
    
    private func addVibrancy() {
        if let editorVC = presentedViewController as? EditorViewController {
            if let contentView = editorVC.contentView {
                println("contentView:\(contentView)")
//                contentView.backgroundColor = UIColor.redColor().colorWithAlphaComponent(0.4)
                
                let blurEffect = UIBlurEffect(style: .ExtraLight)
                let blurEffectView = UIVisualEffectView(effect: blurEffect)
                let vibrancyEffect = UIVibrancyEffect(forBlurEffect: blurEffect)
                let vibrancyEffectView = UIVisualEffectView(effect: vibrancyEffect)
                
                
                // remove layout constraints for content view
                
                editorVC.contentViewContraints = nil
                vibrancyEffectView.contentView.addSubview(contentView)
                blurEffectView.contentView.addSubview(vibrancyEffectView)
                
                self.presentedView().insertSubview(blurEffectView, atIndex: 0)
                
                contentView.setTranslatesAutoresizingMaskIntoConstraints(false)
                blurEffectView.setTranslatesAutoresizingMaskIntoConstraints(false)
                vibrancyEffectView.setTranslatesAutoresizingMaskIntoConstraints(false)
                
                applyEqualSizeConstraints(vibrancyEffectView.contentView, v2: contentView, includeTop: false)
                applyEqualSizeConstraints(blurEffectView.contentView, v2: vibrancyEffectView, includeTop: false)
                applyEqualSizeConstraints(self.presentedView(), v2: blurEffectView, includeTop: false)
            }
        }
    }
    
    private func applyEqualSizeConstraints(v1: UIView, v2: UIView, includeTop: Bool) {
        v1.addConstraint(NSLayoutConstraint(item: v1, attribute: .Left,
        relatedBy: .Equal, toItem: v2, attribute: .Left,
        multiplier: 1, constant: 0))
        v1.addConstraint(NSLayoutConstraint(item: v1, attribute: .Right,
        relatedBy: .Equal, toItem: v2, attribute: .Right,
        multiplier: 1, constant: 0))
        v1.addConstraint(NSLayoutConstraint(item: v1, attribute: .Bottom,
        relatedBy: .Equal, toItem: v2, attribute: .Bottom,
        multiplier: 1, constant: 0))
        v1.addConstraint(NSLayoutConstraint(item: v1, attribute: .Top,
        relatedBy: .Equal, toItem: v2, attribute: .Top,
        multiplier: 1, constant: 0))
    }
    
    
     // MARK: The dismissal phase
     //... involves moving the new view controller off screen through a series of transition animations.
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
//    override func containerViewWillLayoutSubviews() {
//        super.containerViewWillLayoutSubviews()
//        println("EditorPresentationController - containerViewWillLayoutSubviews")
//    }
//    
//    override func containerViewDidLayoutSubviews() {
//        super.containerViewDidLayoutSubviews()
//        println("EditorPresentationController - containerViewDidLayoutSubviews")
//    }
    
//    override func willTransitionToTraitCollection(newCollection: UITraitCollection, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
//        super.willTransitionToTraitCollection(newCollection, withTransitionCoordinator: coordinator)
//        println("\nEditorPresentationController - willTransitionToTraitCollection(newCollection: \(newCollection) coordinator: \(coordinator)")
//    }
//    
//    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
//        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
//        println("EditorPresentationController - viewWillTransitionToSize(size:\(size) coordinator:\(coordinator))")
//    }
    
    // MARK: Adjusting the Size and Layout of the Presentation
//    override func frameOfPresentedViewInContainerView() -> CGRect {
//        return containerView.bounds.rectByInsetting(dx: 30, dy: 30) // Doesn't work!!
//    }
}
