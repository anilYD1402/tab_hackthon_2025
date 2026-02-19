# 🍽️ Tab Hackathon 2025

A Flutter-based food ordering application built for the Tab Hackathon 2025. The app allows users to browse restaurants, view menus, manage a cart, track orders, and manage their account — all wrapped in a clean, Material Design UI.

---

## 📱 Platform Support

| Platform | Supported |
|----------|-----------|
| Android  | ✅ |
| iOS      | ✅ |
| Web      | ✅ |
| macOS    | ✅ |
| Linux    | ✅ |
| Windows  | ✅ |

---

## 🏗️ Architecture Overview

The project follows a **feature-based folder structure** within `lib/`, keeping screens, models, and experimental modules neatly separated.

```
tab_hackthon_2025/
├── lib/
│   ├── main.dart                   # App entry point
│   ├── gemini_test.dart            # Gemini AI integration test
│   ├── testing.dart                # General testing utilities
│   ├── models/
│   │   └── restaurant_model.dart   # Restaurant & menu item data models
│   ├── screens/
│   │   ├── login_screen.dart       # User login
│   │   ├── signup_screen.dart      # User registration
│   │   ├── bottom_nav_bar_screen.dart  # Root navigation shell
│   │   ├── home_screen.dart        # Restaurant listing & search
│   │   ├── restaurant_detail_screen.dart  # Menu & restaurant info
│   │   ├── cart_screen.dart        # Shopping cart & checkout
│   │   ├── favorites_screen.dart   # Saved/favourite restaurants
│   │   ├── orders_screen.dart      # Order history & tracking
│   │   └── account_screen.dart     # User profile & settings
│   ├── home/
│   │   └── screen/
│   │       └── home_screen.dart    # Alternate/experimental home screen
│   └── settings/                   # App settings module
├── android/                        # Android platform project
├── ios/                            # iOS platform project
├── web/                            # Web platform project
├── macos/                          # macOS platform project
├── linux/                          # Linux platform project
├── windows/                        # Windows platform project
├── test/                           # Unit & widget tests
├── scripts/                        # Utility/build scripts
├── pubspec.yaml                    # Dependencies & app metadata
└── analysis_options.yaml           # Dart linting rules
```

---

## 🧭 App Navigation

The app uses a **Bottom Navigation Bar** as the main navigation shell (`bottom_nav_bar_screen.dart`) with the following tabs:

1. **Home** – Browse and search restaurants
2. **Favourites** – Saved restaurants
3. **Cart** – Manage items and checkout
4. **Orders** – View past and current orders
5. **Account** – Profile and app settings

Authentication flow (Login / Signup) is handled before accessing the main navigation.

---

## 🗂️ Data Models

### `RestaurantModel` (`lib/models/restaurant_model.dart`)
Represents a restaurant entity, likely including:
- Restaurant name, image, rating, cuisine type
- Menu items with name, price, and description

---

## 🤖 AI Integration

The project includes a `gemini_test.dart` file, indicating **Google Gemini AI** integration — likely used for smart recommendations, search, or conversational features within the app.

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK `^3.7.2`
- Dart SDK `^3.7.2`

### Installation

```bash
# Clone the repository
git clone https://github.com/anilYD1402/tab_hackthon_2025.git
cd tab_hackthon_2025

# Install dependencies
flutter pub get

# Run the app
flutter run
```

### Running Tests

```bash
flutter test
```

---

## 📦 Dependencies

| Package | Purpose |
|--------|---------|
| `flutter` | Core UI framework |
| `cupertino_icons` | iOS-style icons |
| `flutter_lints` | Recommended Dart lint rules |

---

## 🛠️ Development

- **Language:** Dart
- **Framework:** Flutter
- **Design:** Material Design 3
- **State Management:** Flutter built-in (StatefulWidget)

---

## 👤 Author

**Anil** — [@anilYD1402](https://github.com/anilYD1402)

Built with ❤️ for Tab Hackathon 2025.
