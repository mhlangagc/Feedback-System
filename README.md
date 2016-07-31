# PopUp

An easy to implement custom pop up similar to Pinterest's Pop ups. 
<div align="center">
<img src="Pinterest.png" alt="demo"/>
</div>
---

##  Overview:

This library will help easily set up any pop ups that appear from the bottom of the screen to inform the user of any changes in the app or give them feedback for some action they just performed. 

---

##  Requirements :

<p align="center">
<img src="https://img.shields.io/badge/platform-iOS-blue.svg?style=flat" alt="Platform iOS" />
<a href="https://developer.apple.com/swift"><img src="https://img.shields.io/badge/Swift_3.0-compatible-4BC51D.svg?style=flat" alt="Swift 3.0 compatible" /></a>
<a href="https://cocoapods.org"><img src='https://img.shields.io/cocoapods/v/TransEasy.svg' /></a>
<a href="http://mit-license.org"><img src="https://img.shields.io/badge/license-MIT-blue.svg?style=flat" alt="MIT" /></a>


---

##  How to Setup:

Drag and drop the PopUpLauncher.swift file from the downloaded Project into you Swift 3 Project. Simple and Easy.

---

##  How to Use:

### Real easy implemenation:

Add these lines to your the view controller (Collection and Table View  Controllers also work) you want to show the pop in. This will initialise the PopUplauncher to get access to the necessary function.

```swift
 lazy var gitPopLauncher: PopUpLauncher = {
    
        let launcher = PopUpLauncher()
        return launcher
    
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

The Pop up can be customised in the following ways. 

* You can change the background Color of the Pop Up using ####roundedViewBackgroundColor####. This simply takes a UIColor. 
* Customise the string you want show using - informationString. IMPORTANT : Keep this to about 5 words so it fits properly into the pop Up. 
* Customise the Information String Text Color using informationStringTextColor. This take a UIColor. 
* Change how Long you want THE PopUp on the screen using the durationOnScreen value. This takes a Double. 
* Current View should always be set to window so it appears above every other view on screen. 
* The pop up comes with a white background gradient to ensure the Popup shows up with better clarity. The pinterest pop up has something similar. If you don’t want it to show, set showsBackgroundGradient to false. 
* If your view has a Tab, set isAboveTabBar to true to show the Pop up above the Tab Bar. 



