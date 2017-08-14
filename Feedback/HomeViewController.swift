//
//  HomeViewController.swift
//  Feedback
//
//  Created by Gugulethu Mhlanga on 2016/07/31.
//  Copyright © 2017 Fonk. All rights reserved.
//

import UIKit

final internal class HomeViewController: UIViewController {
	
	internal lazy var feedback: FeedbackView = {
		let feedback = FeedbackView()
		return feedback
	}()
	
	override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
		perform(#selector(showFeedback), with: self, afterDelay: 2.0)
    }

	@objc private func showFeedback() {
		if let window = UIApplication.shared.keyWindow {
			self.feedback.showFeedback(backgroundColor: UIColor(red: 248.0/255.0, green:  231.0/255.0 ,blue: 28.0/255.0, alpha: 1.0), feedbackLabel: "Hello there", feedbackLabelColor: UIColor(red: 106.0/255.0, green:  99.0/255.0 ,blue: 13.0/255.0, alpha: 1.0), feedbackIconImage: #imageLiteral(resourceName: "haha"), feedbackIconImageTint: UIColor(red: 106.0/255.0, green:  99.0/255.0 ,blue: 13.0/255.0, alpha: 1.0), durationOnScreen: 3.8, currentView: window, showsBackgroundGradient: true, isAboveTabBar: false)
		}
	}
}

