# WhiteLabel for Swift

WhiteLabel is an interface for the [White Label API](http://whitelabel.noonpacific.com) written in the Swift programming language.

## Installation through CocoaPods

The recommended method of installation is through [CocoaPods](http://cocoapods.org). Note that both the [Alamofire](https://github.com/Alamofire/Alamofire) and [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON) libraries are included as dependencies for WhiteLabel. Add the following line to your Podfile, then run `pod install`.

```ruby
pod 'WhiteLabel', :git => 'https://github.com/NoonPacific/WhiteLabelSwift.git'
```

## Usage

WhiteLabel for Swift is used in conjunction with the [White Label API](http://whitelabel.noonpacific.com). First, in `AppDelegate.swift`, setup your app's White Label and SoundCloud credentials.

#### AppDelegate.swift

```swift
import WhiteLabel

...

func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

    WhiteLabel.appSlug = "your-app-slug"
    WhiteLabel.soundCloudToken = "your-soundcloud-token"

    return true
}
```

You can then send a GET request for all mixtapes in your app's collection. The network request is performed asynchronously and is processed within the completion block.

```swift
WhiteLabel.getMixtapes { mixtapes, error in
    // check for error, then render mixtapes
}
```

Use the following request to retrieve an array of tracks for a specific mixtape.

```swift
WhiteLabel.getTracksforMixtape(mixtape) { tracks, error in
    // check for error, then render tracks
}
```

To access the collection containing your mixtapes and tracks, use WhiteLabel's static `collection` variable.

```swift
if let mixtapes = WhiteLabel.collection.mixtapes {
    // process the unwrapped mixtapes optional
}
```

## Device support

WhiteLabel for Swift supports iOS 8.0+ and tvOS 9.0+.

## About

WhiteLabel for Swift is created and maintained by [Alex Givens](https://github.com/AlexGivens) for [Noon Pacific](http://noonpacific.com)'s [White Label API](http://whitelabel.noonpacific.com).

WhiteLabel for Swift is released under the MIT license. See LICENSE for details.
