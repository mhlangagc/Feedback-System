//
//  HomeViewController.swift
//  Feedback
//
//  Created by Gugulethu Mhlanga on 2016/07/31.
//  Copyright © 2017 Fonk. All rights reserved.
//

import UIKit

final internal class HomeViewController: UIViewController {
	
	//	Initialisation
	internal lazy var feedback: FeedbackView = {
		let feedback = FeedbackView()
		return feedback
	}()
	
	override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
		self.showPopUp()
    }

	private func showPopUp() {
//		if let window = UIApplication.shared.keyWindow {
//			feedback.showFeedback(roundedViewBackgroundColor: UIColor.cyan, informationString: "Sroll to see more", durationOnScreen: 4.5, currentView: window, showsBackgroundGradient: true, isAboveTabBar: false)
//		}
	}
}

