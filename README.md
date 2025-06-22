# CriptoWallet
A sleek and intuitive iOS cryptocurrency wallet app built with SwiftUI and modern architecture. Track prices, convert between crypto and USD, and explore detailed coin info—all with a clean interface.

## CriptoWallet Preview
![Simulator Screen Recording - iPhone 16 Pro - 2025-06-22 at 13 45 18](https://github.com/user-attachments/assets/67e4cd58-ddd2-4c9d-a0d8-21c1e05c07c8)

### iPhone 16 pro
|LM|DM|
| - | - |
|![Simulator Screenshot - iPhone 16 Pro - 2025-06-22 at 13 37 14](https://github.com/user-attachments/assets/deac7572-ea0e-47a6-bd7b-655283892a1f) | ![Simulator Screenshot - iPhone 16 Pro - 2025-06-22 at 13 37 03](https://github.com/user-attachments/assets/06080e86-365d-40c6-90f6-54792f247089) | 
![Simulator Screenshot - iPhone 16 Pro - 2025-06-22 at 13 37 22](https://github.com/user-attachments/assets/13b99002-0dc8-448a-8cde-a76057662069) | ![Simulator Screenshot - iPhone 16 Pro - 2025-06-22 at 13 37 07](https://github.com/user-attachments/assets/185a63cf-1f21-46a3-97b4-ff834321ba2a) |

## Features
- Price Tracking: View real-time prices and 24h changes for major cryptocurrencies.
- Converter: Instantly convert between crypto and USD.
- Detailed Views: Charts, market cap, supply stats, and volume-to-market cap ratio.
- Modern SwiftUI Design: Built using MVVM, DI for testability, and responsive components.
- Clean Architecture: Service layer with protocols and mock support for unit testing; uses SwiftData and Firebase.
- Reusable Components: Custom card, number picker, choice picker, and more in a design system style.
- Dark mode support.
- Searching functionality.

## Tech Stack
- SwiftUI
- MVVM architecture with dependency injection
- Integration with the [CoinMarketCapAPI](https://coinmarketcap.com/api/)
- Unit tests with XCTest

## Resources
* [CoinMarketCapAPI](https://coinmarketcap.com/api/)

### External libraries
* [CoreNetworking](https://github.com/mdb1/CoreNetworking)
* [SwiftFormat](https://github.com/nicklockwood/SwiftFormat)
