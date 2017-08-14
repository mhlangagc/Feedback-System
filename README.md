# PopUp

An easy to implement custom pop up similar to Pinterest's Pop ups. 
<div align="center">
<img src="https://github.com/mhlangagc/PopUp/blob/master/InformationPopUp/Pinterest.png" alt="Pinterest"/>
</div>
---

##  Overview:

This library will help easily set up any Feedback System that appears from the bottom of the screen to inform the user of any actions/changes that could have taken place in the app.

---

##  Requirements :

- Swift 4.0
- XCode 9 (Beta)

<p align="center">
<img src="https://img.shields.io/badge/platform-iOS-blue.svg?style=flat" alt="Platform iOS" />
<a href="https://developer.apple.com/swift"><img src="https://img.shields.io/badge/Swift_3.0-compatible-4BC51D.svg?style=flat" alt="Swift 4.0 compatible" /></a>
<a href="http://mit-license.org"><img src="https://img.shields.io/badge/license-MIT-blue.svg?style=flat" alt="MIT" /></a>


---

##  How to Setup:

Drag and drop the FeedbackView.swift file from the downloaded Project into your Swift 4 Project. Simple and Easy.

---

##  How to Use:

### Real easy implemenation:

Add these lines to your the view controller (Collection and Table View  Controllers also work) you want to show the FeedbackView in. This will initialise the FeedbackView to get access to the necessary function.

```swift
internal lazy var feedback: FeedbackView = {
	let feedback = FeedbackView()
	return feedback
}()

```

### Showing the Pop up.
Just below the lines above or anywhere else withing your View Controller add the function below. 

```swift
  func showPopUp() {
    
        if let window = UIApplication.shared().keyWindow {
    
            gitPopLauncher.showPopUp(roundedViewBackgroundColor: UIColor(red: 60.0/255.0, green:  80.0/255.0 ,blue: 82.0/255.0, alpha: 1.0), informationString: "Oh Hi there.", informationStringTextColor: UIColor.white(), durationOnScreen: 4.5, currentView: window, showsBackgroundGradient: true, isAboveTabBar: false)
        }
        
        
    }

```

In this function we get access the the keyWindow  and use it’s frame to call the showPopUp function located in the PopUplauncher file.  


---

##  Customisation

```swift
- func showPopUp(roundedViewBackgroundColor: UIColor, informationString : String, informationStringTextColor: UIColor, durationOnScreen: Double, currentView: UIView, showsBackgroundGradient: Bool, isAboveTabBar: Bool)

```


In calling the showPopUp function you can change the following parameter values: 

* The Background Color of the Popup using the roundedViewBackgroundColor parameter. This simply takes a UIColor. 
* The String in the Popup using the informationString parameter. IMPORTANT : Keep this to about 5 words so it fits properly into the pop Up. 
* The Information String Text Color using the informationStringTextColor parameter. This take a UIColor. 
* How Long you the pop up is on the screen using the durationOnScreen parameter. This takes a Double. 
* The Current View parameter should ALWAYS be set to window so it appears above every other view on screen. 
* The pop up comes with a white background gradient to ensure the Popup shows up with better clarity over the views it appears over. The pinterest pop up has something similar if you take a closer look. If you don’t the gradient to appear, set showsBackgroundGradient parameter to false. 
* If your view has a Tab Bar, set the isAboveTabBar parameter to true to show the Pop up above the Tab Bar. Otherwise this will appear over the tab bar and may loow unpleasant.



