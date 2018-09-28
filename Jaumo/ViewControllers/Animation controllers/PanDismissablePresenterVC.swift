//
//  PanDismissablePresenterVC.swift
//  Jaumo
//
//  Created by Lefteris Haritou on 28/09/2018.
//  Copyright © 2018 Lefteris Haritou. All rights reserved.
//

import UIKit

class PanDismissablePresenterVC: UIViewController, UIViewControllerTransitioningDelegate {
    let interactor = Interactor()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? PanDismissableVC {
            destinationViewController.transitioningDelegate = self
            destinationViewController.interactor = interactor
        }
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SwipeAnimator()
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactor.hasStarted ? interactor : nil
    }
}
