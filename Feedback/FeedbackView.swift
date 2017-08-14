//
//  FeedbackView.swift
//  Feedback
//
//  Created by Gugulethu Mhlanga on 2017/08/14.
//  Copyright © 2016 Feedback. All rights reserved.
//

import UIKit

final internal class FeedbackView: NSObject {
    
    //  Gradient Background View
    internal let gradientBackground: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.layer.masksToBounds = true
        return view
    }()
    
    //  PopUpView
    internal let roundedView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 58.0 * 0.5
        view.layer.masksToBounds = true
        return view
    }()
	
	//	Feedback Icon
	internal let feedbackIcon: UIImageView = {
		let image = UIImageView()
		image.contentMode = .scaleAspectFit
		image.clipsToBounds = true
		return image
	}()
    
    //  Information Label
    internal let informationLabel: UILabel = {
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
	internal func showFeedback(backgroundColor: UIColor, feedbackLabel: String, feedbackLabelColor: UIColor, feedbackIconImage: UIImage, feedbackIconImageTint: UIColor, durationOnScreen: Double, currentView: UIView, showsBackgroundGradient: Bool, isAboveTabBar: Bool) {
		
		if let window = UIApplication.shared.keyWindow {
            //  Gradient Background
			gradientBackground.backgroundColor = UIColor.clear
            gradientBackground.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: 120)
		
            //  Show Gradient if true
            if showsBackgroundGradient == true {
                self.backgroundGradientLayer(view: gradientBackground, overLayView: currentView)
            }
            
            gradientBackground.layer.masksToBounds = true
            window.addSubview(gradientBackground)
			
            //  Download Popup
            gradientBackground.addSubview(roundedView)
            roundedView.frame = CGRect(x: 16, y: 38, width: UIScreen.main.bounds.width - 32.0, height: 58.0)
            roundedView.backgroundColor = backgroundColor
			
            //  Information Icon
            roundedView.addSubview(feedbackIcon)
			feedbackIcon.image = feedbackIconImage.withRenderingMode(.alwaysTemplate)
			feedbackIcon.tintColor = feedbackIconImageTint
            feedbackIcon.frame = CGRect(x: 24, y: 17, width: 24, height: 24)
			
			//	Information Label
			roundedView.addSubview(informationLabel)
			informationLabel.frame = CGRect(x: 72, y: 17, width: UIScreen.main.bounds.width - 128, height: 24)
			informationLabel.text = feedbackLabel
			informationLabel.textColor = feedbackLabelColor
			informationLabel.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)
			
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
    
    //  Dismiss View
	@objc private func dismissConfimationPopup() {
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 10.0, initialSpringVelocity: 1, options: .curveLinear, animations: {
			if let window = UIApplication.shared.keyWindow {
                self.gradientBackground.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: 110)
            }
		}, completion: nil)
    }

    //  Gradient 
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
