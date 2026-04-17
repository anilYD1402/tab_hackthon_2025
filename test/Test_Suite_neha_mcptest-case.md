# Test Suite for `neha/mcptest-case`

## Objective
Create a comprehensive test case suite for the TAB Hackathon 2025 food delivery app, covering core user flows and regression areas across all major screens.

## Scope
- Home / restaurant discovery
- Restaurant detail and cart interaction
- Orders history and order status
- Favorites management
- Account/profile navigation and actions
- Settings / preferences
- Authentication flow (login/signup)
- Bottom navigation behavior

## Areas to Test

### 1. App Launch and Navigation
- Verify the app launches successfully and displays the login screen.
- Verify `SignupScreen` navigation from `LoginScreen`.
- Verify successful navigation to `BottomNavBarScreen` after login.
- Verify bottom navigation has Home, Orders, Favorites, Account tabs.
- Verify tab switching updates displayed content.

### 2. Home Screen / Restaurant Discovery
- Verify the Home screen loads restaurant listings and filters.
- Verify cuisine filter chips render correctly.
- Verify selecting a cuisine filter updates the restaurant list.
- Verify search functionality returns matching restaurants.
- Verify tapping a restaurant navigates to `RestaurantDetailScreen`.

### 3. Restaurant Detail and Cart Flow
- Verify restaurant details and menu categories are displayed correctly.
- Verify menu items show name, price, and add-to-cart action.
- Verify adding items to cart updates cart count or summary.
- Verify cart screen receives items correctly.
- Verify quantity changes and item removal on `CartScreen`.
- Verify cart total is computed correctly.

### 4. Orders Screen
- Verify order history displays valid order cards.
- Verify order status badges appear correctly.
- Verify `View Details` and `Reorder` actions exist for each order.
- Verify filters or search on orders behave as expected.

### 5. Favorites Screen
- Verify the favorites screen renders saved restaurants.
- Verify favorite icons and cuisine info display properly.
- Verify tapping a favorite restaurant opens its detail page.
- Verify removing a restaurant from favorites updates the UI.

### 6. Account Screen
- Verify account/profile details display correctly.
- Verify quick action buttons for Orders, Favorites, Addresses, Payments.
- Verify contact information appears as expected.
- Verify logout button is visible and tappable.
- Verify settings section and account options render correctly.

### 7. Settings Screen
- Verify `SettingsScreen` renders AppBar and menu list.
- Verify each settings item is present and tappable.
- Verify `Logout`, `Help & Support`, `Privacy Policy`, and `About` items behave as expected.
- Verify settings list scrolls when content exceeds viewport.
- Verify icons appear next to each menu item.

### 8. Authentication Flow
- Verify login fields and validation messages.
- Verify signup fields and successful account creation flow.
- Verify invalid credentials show appropriate error feedback.

### 9. Smoke / Regression Tests
- Verify `MyApp` boots and builds without runtime exceptions.
- Verify bottom navigation and main screen lifecycle works.
- Verify existing widget tests continue passing after app changes.

## Recommended Test Files
- `test/home_screen_american_test.dart`
- `test/navigation_screens_test.dart`
- `test/settings_screen_test.dart`
- `test/widget_test.dart`

## Notes
- Focus on high-risk UI changes and navigation behavior.
- Add tests for the existing PR changes around cuisine filtering and home screen behavior.
- Keep tests isolated and maintainable.
