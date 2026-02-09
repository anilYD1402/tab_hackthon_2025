import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tab_hackthon/screens/orders_screen.dart';
import 'package:tab_hackthon/screens/favorites_screen.dart';
import 'package:tab_hackthon/screens/account_screen.dart';
import 'package:tab_hackthon/screens/bottom_nav_bar_screen.dart';

void main() {
  group('OrdersScreen Tests', () {
    testWidgets('OrdersScreen displays orders', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: OrdersScreen()));

      expect(find.text('My Orders'), findsOneWidget);
      expect(find.text('All'), findsOneWidget);
      expect(find.text('Delivered'), findsOneWidget);
    });

    testWidgets('OrdersScreen has filter chips', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: OrdersScreen()));

      expect(find.byType(FilterChip), findsWidgets);
    });

    testWidgets('OrdersScreen displays order cards', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: OrdersScreen()));

      expect(find.byType(Card), findsWidgets);
      expect(find.text('Pizza Palace'), findsOneWidget);
    });

    testWidgets('OrdersScreen shows order IDs', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: OrdersScreen()));

      expect(find.text('Order #1001'), findsOneWidget);
      expect(find.text('Order #1002'), findsOneWidget);
    });

    testWidgets('OrdersScreen displays status badges', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: OrdersScreen()));

      expect(find.text('Delivered'), findsWidgets);
    });

    testWidgets('OrdersScreen has View Details button', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: OrdersScreen()));

      expect(find.text('View Details'), findsWidgets);
    });

    testWidgets('OrdersScreen has Reorder button', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: OrdersScreen()));

      expect(find.text('Reorder'), findsWidgets);
    });
  });

  group('FavoritesScreen Tests', () {
    testWidgets('FavoritesScreen displays title', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: FavoritesScreen()));

      expect(find.text('My Favorites'), findsOneWidget);
    });

    testWidgets('FavoritesScreen displays favorite restaurants', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: FavoritesScreen()));

      expect(find.text('Pizza Palace'), findsOneWidget);
      expect(find.text('Sushi Supreme'), findsOneWidget);
    });

    testWidgets('FavoritesScreen has favorite heart icon', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: FavoritesScreen()));

      expect(find.byIcon(Icons.favorite), findsWidgets);
    });

    testWidgets('FavoritesScreen displays rating', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: FavoritesScreen()));

      expect(find.text('4.8'), findsOneWidget);
      expect(find.text('4.9'), findsOneWidget);
    });

    testWidgets('FavoritesScreen displays cuisine info', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: FavoritesScreen()));

      expect(find.text('Italian'), findsOneWidget);
      expect(find.text('Japanese'), findsOneWidget);
    });

    testWidgets('FavoritesScreen has ListTile for each favorite', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: FavoritesScreen()));

      expect(find.byType(ListTile), findsWidgets);
    });
  });

  group('AccountScreen Tests', () {
    testWidgets('AccountScreen displays title', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: AccountScreen()));

      expect(find.text('Account'), findsOneWidget);
    });

    testWidgets('AccountScreen displays user profile', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: AccountScreen()));

      expect(find.text('John Doe'), findsOneWidget);
    });

    testWidgets('AccountScreen displays Quick Actions section', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: AccountScreen()));

      expect(find.text('Quick Actions'), findsOneWidget);
    });

    testWidgets('AccountScreen has Orders quick action', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: AccountScreen()));

      expect(find.text('Orders'), findsOneWidget);
    });

    testWidgets('AccountScreen has Favorites quick action', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: AccountScreen()));

      expect(find.text('Favorites'), findsOneWidget);
    });

    testWidgets('AccountScreen has Addresses option', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: AccountScreen()));

      expect(find.text('Addresses'), findsOneWidget);
    });

    testWidgets('AccountScreen has Payments option', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: AccountScreen()));

      expect(find.text('Payments'), findsOneWidget);
    });

    testWidgets('AccountScreen displays Contact Information', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: AccountScreen()));

      expect(find.text('Contact Information'), findsOneWidget);
    });

    testWidgets('AccountScreen displays Phone and Email', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: AccountScreen()));

      expect(find.text('Phone'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
    });

    testWidgets('AccountScreen has Logout button', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: AccountScreen()));

      expect(find.text('Logout'), findsOneWidget);
    });

    testWidgets('AccountScreen has Settings section', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: AccountScreen()));

      expect(find.text('Settings'), findsOneWidget);
    });

    testWidgets('AccountScreen has Notifications setting', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: AccountScreen()));

      expect(find.text('Notifications'), findsOneWidget);
    });

    testWidgets('AccountScreen has Privacy & Security setting', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: AccountScreen()));

      expect(find.text('Privacy & Security'), findsOneWidget);
    });

    testWidgets('AccountScreen has Help & Support setting', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: AccountScreen()));

      expect(find.text('Help & Support'), findsOneWidget);
    });
  });

  group('BottomNavBarScreen Tests', () {
    testWidgets('BottomNavBarScreen displays bottom navigation bar', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: BottomNavBarScreen()));

      expect(find.byType(BottomNavigationBar), findsOneWidget);
    });

    testWidgets('BottomNavBarScreen has 4 navigation items', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: BottomNavBarScreen()));

      expect(find.byType(BottomNavigationBarItem), findsWidgets);
    });

    testWidgets('BottomNavBarScreen shows Home tab label', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: BottomNavBarScreen()));

      expect(find.text('Home'), findsOneWidget);
    });

    testWidgets('BottomNavBarScreen shows Orders tab label', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: BottomNavBarScreen()));

      expect(find.text('Orders'), findsOneWidget);
    });

    testWidgets('BottomNavBarScreen shows Favorites tab label', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: BottomNavBarScreen()));

      expect(find.text('Favorites'), findsOneWidget);
    });

    testWidgets('BottomNavBarScreen shows Account tab label', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: BottomNavBarScreen()));

      expect(find.text('Account'), findsOneWidget);
    });

    testWidgets('BottomNavBarScreen can navigate to Orders tab', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: BottomNavBarScreen()));

      // Tap the Orders tab (index 1)
      await tester.tap(find.byIcon(Icons.shopping_bag_outlined));
      await tester.pumpAndSettle();

      // Verify Orders screen is displayed
      expect(find.text('My Orders'), findsOneWidget);
    });

    testWidgets('BottomNavBarScreen can navigate to Favorites tab', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: BottomNavBarScreen()));

      // Tap the Favorites tab (index 2)
      await tester.tap(find.byIcon(Icons.favorite_outline));
      await tester.pumpAndSettle();

      // Verify Favorites screen is displayed
      expect(find.text('My Favorites'), findsOneWidget);
    });

    testWidgets('BottomNavBarScreen can navigate to Account tab', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: BottomNavBarScreen()));

      // Tap the Account tab (index 3)
      await tester.tap(find.byIcon(Icons.person_outline));
      await tester.pumpAndSettle();

      // Verify Account screen is displayed
      expect(find.text('Account'), findsOneWidget);
    });

    testWidgets('BottomNavBarScreen starts with Home tab selected', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: BottomNavBarScreen()));

      expect(find.text('FoodDelivery App'), findsOneWidget);
    });
  });
}
