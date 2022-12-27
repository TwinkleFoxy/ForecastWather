
[![License][license-image]][license-url]
[![Swift Version][swift-image]][swift-url]
[![Platform](https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat)](https://www.apple.com)

# ForecastWather

An application for viewing the weather forecast in the city where the user is located. The determination of the user's location is carried out through the use of geolocation services. The Weather Now tab displays the current weather indicators: Min temp, Max temp, Wind speed, Pressure, Sunrise, Sunset, Clouds, Humidity. Clouds, Humidity are displayed using a custom View RingProgress. The Weekly Forecast tab displays a weekly forecast with a frequency of every three hours. The application is written using the MVVM pattern and generics.

![Gif][gif-url]

## Features

- [x] Entirely written in SwiftUI
- [x] Designed using the MVVM pattern
- [x] Used generics
- [x] Works with OpenWeatherMap service API
- [x] Use Grand Central Dispatch
- [x] Custom RingProgress is used to display Clouds, Humidity indicators
- [x] Uses location services to determine the user's location

## Requirements

- iOS 15.3+
- Xcode 13.4.1

## Installation

Open file CryptoTrackerV2.xcodeproj and run project

If API key is not worked please:
1. Register in openweathermap.org and resive your API key.
2. Insert your API key into NetworkService.swift file in let apiKey

## Meta

Distributed under the GPL-2.0 license. See ``LICENSE`` for more information.

[https://github.com/TwinkleFoxy/github-link](https://github.com/TwinkleFoxy/)

[swift-image]: https://img.shields.io/badge/swift-5.0-orange.svg
[swift-url]: https://swift.org/
[license-url]: https://github.com/TwinkleFoxy/ForecastWather/blob/main/LICENSE
[license-image]: https://img.shields.io/github/license/TwinkleFoxy/ForecastWather?color=brightgreen
[license-url]: https://github.com/TwinkleFoxy/ForecastWather/blob/main/LICENSE
[gif-url]: https://github.com/TwinkleFoxy/ForecastWather/blob/main/GIF/GIF.gif
