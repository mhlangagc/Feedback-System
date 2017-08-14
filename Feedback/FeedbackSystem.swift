//
//  Feedback.swift
//  Feedback
//
//  Created by Gugulethu Mhlanga on 2017/08/14.
//  Copyright © 2016 Feedback. All rights reserved.
//

import UIKit

//  Implementation
//lazy var gitPopLauncher: GitHubPopupLauncher = {
//    
//    let launcher = GitHubPopupLauncher()
//    return launcher
//    
//}()
//
////  Show Popup
//func showPopUp() {
//    
//    if let window = UIApplication.shared().keyWindow {
//        
//        gitPopLauncher.showPopUp(roundedViewBackgroundColor: UIColor(red: 60.0/255.0, green:  80.0/255.0 ,blue: 82.0/255.0, alpha: 1.0), informationString: "Sroll to see more", durationOnScreen: 4.5, currentView: window, showsBackgroundGradient: true, isAboveTabBar: true)
//    }
//    
//    
//}

final internal class FeedbackView : NSObject {
    
    //  Gradient Background View
    internal let gradientBackground : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.layer.masksToBounds = true
        return view
    }()
    
    //  PopUpView
    internal let downloadedPopup : UIView = {
        let view = UIView()
        view.layer.cornerRadius = 26.0
        view.layer.masksToBounds = true
        return view
    }()
    
    //  Information Label
    internal let informationLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
		label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.semibold)
        return label
    }()
    
    
    //  Initialisation
    override init() {
        super.init()
        //  Setup the View and Background
    }
    
    // Show Pop Up
	internal func showFeedback(roundedViewBackgroundColor: UIColor, feedbackString : String, feedbackStringColor: UIColor, durationOnScreen: Double, currentView: UIView, showsBackgroundGradient: Bool, isAboveTabBar: Bool) {
		
		if let window = UIApplication.shared.keyWindow {
            //  Gradient Background
			gradientBackground.backgroundColor = UIColor.clear
            gradientBackground.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: 160)
		
            //  Show Gradient if true
            if showsBackgroundGradient == true {
                self.backgroundGradientLayer(view: gradientBackground, overLayView: currentView)
            }
            
            gradientBackground.layer.masksToBounds = true
            window.addSubview(gradientBackground)
			
            //  Download Popup
            gradientBackground.addSubview(downloadedPopup)
            downloadedPopup.frame = CGRect(x: 10, y: 54, width: 355, height: 52)
            downloadedPopup.backgroundColor = roundedViewBackgroundColor
			
            //  Information Label
            downloadedPopup.addSubview(informationLabel)
            informationLabel.frame = CGRect(x: 30, y: 16, width: 312, height: 20)
            informationLabel.text = feedbackString
			informationLabel.textColor = feedbackStringColor
			
            //  #### Timer to Hide it
            Timer.scheduledTimer(timeInterval: durationOnScreen, target: self, selector: #selector(dismissConfimationPopup), userInfo: nil, repeats: false)
			
            //  #### Animate Views In
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                if isAboveTabBar == true {
                    self.gradientBackground.frame = CGRect(x: 0, y: window.frame.height - 116 - 49, width: window.frame.width, height: 110)
                } else {
                    self.gradientBackground.frame = CGRect(x: 0, y: window.frame.height - 116, width: window.frame.width, height: 110)
                }
			}, completion: nil)
        }
    }
    
    //  Dismiss Views
	@objc private func dismissConfimationPopup() {
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 10.0, initialSpringVelocity: 1, options: .curveLinear, animations: {
			if let window = UIApplication.shared.keyWindow {
                self.gradientBackground.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: 110)
                //self.downloadedPopup.frame = CGRect(x: 10, y: window.frame.height, width: window.frame.width - 20, height: 90)
            }
		}, completion: nil)
    }

    //  Gradient Layer Setup
    private func backgroundGradientLayer(view: UIView, overLayView: UIView) {
        let gradient = CAGradientLayer()
        gradient.frame = overLayView.frame
        gradient.startPoint = CGPoint(x: 0.5, y: 0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1)
        let colors : [CGColor] = [UIColor(white: 1, alpha: 0.0).cgColor, UIColor(white: 1, alpha: 0.95).cgColor, UIColor(white: 1, alpha: 1.0).cgColor]
        let location = [0.0, 0.05, 1.0]
        gradient.colors = colors
        gradient.isOpaque = true
		gradient.locations = location as [NSNumber]
        view.layer.addSublayer(gradient)
    }
}
