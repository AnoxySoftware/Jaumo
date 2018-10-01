# Jaumo

[![Platform](https://img.shields.io/badge/Platform-iOS-blue.svg)](http://developer.apple.com/iOS)&nbsp;

iOS Test Application is a coding sample `Swift 4` iOS Application using UINames to fetch images of People and show it in a GridView

> The application uses CocoaPods for dependency management

  - Uses `AutoLayout` for the entire UI
  - Uses extensions and subclasses for extra functionality on UI Elements
  - Has `Unit Tests`

### Tech

Explanation of the application design
```
 - Application design pattern is the MVVM pattern for easier testing of the ViewModels and code clarity
 - App uses JSON Data fetched by UINames.com
 - Uses Protocols for setting up the UI in the custom Cells
 - App requires iOS 10 or later to run
 - Uses the codeable protocol for parsing JSON data to models
 - Has a custom Swipe Down gesture recognizer to close the modally presented VC when you tap on any image
```

&copy; 2018 Lefteris Haritou
