# 🍔 FoodDelivery App — TAB Hackathon 2025

A cross-platform food delivery application built with **Flutter**, developed for the TAB Hackathon 2025. The app enables users to browse restaurants, manage their cart, place orders, and handle their account — all through a clean, Material Design 3 interface.

---

## 📱 Platforms Supported

- Android
- iOS
- Web
- macOS
- Linux
- Windows

---

## 🏗️ Project Architecture

The project follows a **feature-based folder structure** within the `lib/` directory, keeping screens, models, and feature modules clearly separated.

```
tab_hackthon_2025/
├── lib/
│   ├── main.dart                        # App entry point, MaterialApp setup
│   ├── gemini_test.dart                 # Gemini AI integration test file
│   ├── testing.dart                     # General testing utilities
│   │
│   ├── models/                          # Data models
│   │   └── restaurant_model.dart        # Restaurant & menu item data structures
│   │
│   ├── screens/                         # Core application screens
│   │   ├── login_screen.dart            # User login / authentication
│   │   ├── signup_screen.dart           # New user registration
│   │   ├── bottom_nav_bar_screen.dart   # Root scaffold with bottom navigation
│   │   ├── home_screen.dart             # Restaurant listing & search
│   │   ├── restaurant_detail_screen.dart# Restaurant menu & item details
│   │   ├── cart_screen.dart             # Shopping cart & order summary
│   │   ├── orders_screen.dart           # Order history & tracking
│   │   ├── favorites_screen.dart        # Saved/favourite restaurants
│   │   └── account_screen.dart          # User profile & settings
│   │
│   ├── home/
│   │   └── screen/
│   │       └── home_screen.dart         # Alternate/modular home screen
│   │
│   └── settings/
│       └── screen/                      # Settings module (in progress)
│
├── android/                             # Android native configuration
├── ios/                                 # iOS native configuration
├── web/                                 # Web entry & configuration
├── macos/                               # macOS native configuration
├── linux/                               # Linux native configuration
├── windows/                             # Windows native configuration
├── scripts/                             # Build / utility scripts
├── test/                                # Unit & widget tests
├── pubspec.yaml                         # Dart/Flutter dependencies
└── analysis_options.yaml               # Linting rules
```

---

## 🧭 App Navigation Flow

```
LoginScreen
    └──> SignupScreen (new users)
    └──> BottomNavBarScreen (authenticated users)
              ├── HomeScreen          — Browse & search restaurants
              │       └── RestaurantDetailScreen  — View menu, add to cart
              ├── CartScreen          — Review cart, proceed to checkout
              ├── OrdersScreen        — View past & active orders
              ├── FavoritesScreen     — Saved restaurants
              └── AccountScreen       — Profile, preferences, logout
```

---

## 🗂️ Key Modules

### `main.dart`
The entry point of the application. Bootstraps `MaterialApp` with an orange-seeded `ColorScheme` (Material Design 3) and sets `LoginScreen` as the initial route.

### `models/restaurant_model.dart`
Defines the data structures used across the app — restaurants, menu categories, and individual menu items.

### `screens/`
Contains all primary UI screens. Each screen is self-contained and communicates with others via Navigator routing and shared model objects.

| Screen | Responsibility |
|--------|---------------|
| `login_screen.dart` | Email/password login flow |
| `signup_screen.dart` | New account registration |
| `bottom_nav_bar_screen.dart` | Persistent bottom nav, hosts main tabs |
| `home_screen.dart` | Restaurant list, categories, search |
| `restaurant_detail_screen.dart` | Menu display, item selection, cart addition |
| `cart_screen.dart` | Cart management, quantity control, order total |
| `orders_screen.dart` | Order history with status tracking |
| `favorites_screen.dart` | User's saved restaurants |
| `account_screen.dart` | Profile info, preferences, account actions |

### `gemini_test.dart`
Proof-of-concept integration with the **Google Gemini AI API**, intended for features like smart search, recommendations, or AI-driven chat support.

---

## 🧩 Dependencies

| Package | Purpose |
|---------|---------|
| `flutter` | UI framework |
| `cupertino_icons` | iOS-style icon set |
| `flutter_lints` | Recommended Dart lint rules |

> The project is intentionally kept lightweight for the hackathon. Additional packages (state management, networking, Firebase, etc.) can be added incrementally.

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK `^3.7.2`
- Dart SDK `^3.7.2`
- An IDE: VS Code or Android Studio

### Installation

```bash
# Clone the repository
git clone https://github.com/anilYD1402/tab_hackthon_2025.git
cd tab_hackthon_2025

# Install dependencies
flutter pub get

# Run on a connected device or emulator
flutter run
```

### Build for specific platforms

```bash
# Android APK
flutter build apk

# iOS
flutter build ios

# Web
flutter build web
```

---

## 🧪 Running Tests

```bash
flutter test
```

---

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/your-feature`)
3. Commit your changes (`git commit -m 'feat: add your feature'`)
4. Push to the branch (`git push origin feature/your-feature`)
5. Open a Pull Request

---

## 📄 License

This project was created for the **TAB Hackathon 2025** and is intended for demonstration purposes.
