//
//  ReadOnlyViewController.swift
//  UIPresentationController-01
//
//  Created by Daniel Wallace on 16/02/15.
//  Copyright (c) 2015 nz.co.danielw. All rights reserved.
//

import UIKit

class ReadOnlyViewController: UIViewController {

    let editorTransitioningDelegate =  EditorTransitioningDelegate()
    
    @IBAction func EditButtonPressed() {
        editorTransitioningDelegate.interactive = false
        presentEditor()
        editorTransitioningDelegate.interactive = true
    }
    
    func presentEditor() {
        let editorVC = self.storyboard?.instantiateViewControllerWithIdentifier("Editor") as UIViewController
        prepareEditorVC(editorVC)
        self.presentViewController(editorVC, animated: true, completion: nil)
    }
    
    private func prepareEditorVC(editorVC: UIViewController) {
        editorVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        editorVC.transitioningDelegate = editorTransitioningDelegate
        editorTransitioningDelegate.editorVC = editorVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        editorTransitioningDelegate.readOnlyVC = self
    }
}
