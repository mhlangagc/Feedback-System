# PopUp
A simple way to implement a Pop up from the bottom informing the user of any changes within the app or some action they need to do. 

Platform iOS Swift 3.0, XCode 8(Beta) compatible  MIT

# PopUp
An easy to implement custom transitions.
<div align="center">
<img src="PopUpLauncher.mov" alt="demo"/>
</div>
---

##  Overview:

This library will help easily set up any pop ups that appear from the bottom of the screen to inform the user of any changes/ feedback for some action they just performed. 

Requirements :
Swift 3.0
XCode 8 (Beta)


---

##  How to Setup:

Drag and drop the PopUpLauncher file from the downloaded Project into you Swift 3 Project. Simple and Easy.

---

##  How to Use:

### Real easy implemenation:

Add these lines to your the view controller (Collection and Table View  Controller works) you want to show the pop in. This will initialise the PopUplauncher to get access to the necessary functions

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





