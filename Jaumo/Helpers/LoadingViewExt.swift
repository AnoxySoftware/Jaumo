//
//  LoadingViewExt.swift
//  Jaumo
//
//  Created by Lefteris Haritou on 28/09/2018.
//  Copyright © 2018 Lefteris Haritou. All rights reserved.
//

import UIKit
import JGProgressHUD

let hudTag = 197400

public protocol LoadingViewPresentable {
    func showLoadingView()
    func hideLoadingView(delay: TimeInterval)
    func showError(_ error:Error?, _ message:String?)
}

public extension LoadingViewPresentable where Self: UIViewController {
    
    func showError(_ error:Error?, _ message:String?) {
        let errorMessage = error?.localizedDescription ?? message ?? ""
        let alert = UIAlertController(title: NSLocalizedString("Error", comment: ""), message: String(format:"%@\n\n%@",NSLocalizedString("An error occured:", comment: ""),errorMessage), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: nil))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }

    func showLoadingView() {
        var hud : JGProgressHUD!
        
        if let hudView = self.view.viewWithTag(hudTag) as? JGProgressHUD {
            hud = hudView
        }
        else {
            hud = JGProgressHUD(style: .light)
            hud.tag = hudTag
            hud.textLabel.text = NSLocalizedString("Loading", comment: "loading string")
            hud.vibrancyEnabled = true
            hud.shadow = JGProgressHUDShadow(color: .black, offset: .zero, radius: 5.0, opacity: 0.2)
        }
        
        hud.show(in:self.view, animated: true)
    }

    func hideLoadingView(delay: TimeInterval = 0.1) {
        if let hudView = self.view.viewWithTag(hudTag) as? JGProgressHUD, hudView.isVisible {
            hudView.dismiss(afterDelay: delay, animated: true)
        }
    }
}
