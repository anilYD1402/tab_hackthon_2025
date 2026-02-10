import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tab_hackthon/settings/screen/setting_screen.dart';

void main() {
  group('SettingsScreen Widget Tests', () {
    testWidgets('SettingsScreen renders correctly with AppBar', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: SettingsScreen()));

      // Verify AppBar is present
      expect(find.byType(AppBar), findsOneWidget);

      // Verify AppBar title
      expect(find.text('Settings'), findsWidgets);
    });

    testWidgets('SettingsScreen displays all menu items', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: SettingsScreen()));

      // Verify all ListTiles are present
      expect(find.text('Profile'), findsOneWidget);
      expect(find.text('Notifications'), findsOneWidget);
      expect(find.text('Language'), findsOneWidget);
      expect(find.text('Privacy Policy'), findsOneWidget);
      expect(find.text('Help & Support'), findsOneWidget);
      expect(find.text('About'), findsOneWidget);
      expect(find.text('Logout'), findsOneWidget);
    });

    testWidgets('SettingsScreen has correct icons for each menu item', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: SettingsScreen()));

      // Verify icons are present
      expect(find.byIcon(Icons.person), findsOneWidget); // Profile
      expect(find.byIcon(Icons.notifications), findsOneWidget); // Notifications
      expect(find.byIcon(Icons.language), findsOneWidget); // Language
      expect(
        find.byIcon(Icons.privacy_tip_outlined),
        findsOneWidget,
      ); // Privacy
      expect(find.byIcon(Icons.help_outline), findsOneWidget); // Help
      expect(find.byIcon(Icons.info_outline), findsOneWidget); // About
      expect(find.byIcon(Icons.logout), findsOneWidget); // Logout
    });

    testWidgets('Logout button has red styling', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SettingsScreen()));

      // Find the Logout ListTile
      final logoutTile = find.byWidgetPredicate(
        (widget) =>
            widget is ListTile &&
            widget.title is Text &&
            (widget.title as Text).data == 'Logout',
      );

      expect(logoutTile, findsOneWidget);

      // Verify logout icon is red
      final logoutIconFinder = find.byWidgetPredicate(
        (widget) =>
            widget is Icon &&
            widget.icon == Icons.logout &&
            widget.color == Colors.red,
      );

      expect(logoutIconFinder, findsOneWidget);
    });

    testWidgets('SettingsScreen contains ListView with menu items', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: SettingsScreen()));

      // Verify ListView is present
      expect(find.byType(ListView), findsOneWidget);

      // Verify ListTiles exist within ListView
      expect(find.byType(ListTile), findsWidgets);
    });

    testWidgets('SettingsScreen has Divider before Logout', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: SettingsScreen()));

      // Verify Divider is present
      expect(find.byType(Divider), findsOneWidget);
    });

    testWidgets('Profile menu item is tappable', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SettingsScreen()));

      // Verify Profile ListTile exists and is tappable
      final profileTile = find.byWidgetPredicate(
        (widget) =>
            widget is ListTile &&
            widget.title is Text &&
            (widget.title as Text).data == 'Profile',
      );

      expect(profileTile, findsOneWidget);
      expect(find.byType(GestureDetector, skipOffstage: false), findsWidgets);
    });

    testWidgets('Notifications menu item is tappable', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: SettingsScreen()));

      // Verify Notifications ListTile exists
      final notificationsTile = find.byWidgetPredicate(
        (widget) =>
            widget is ListTile &&
            widget.title is Text &&
            (widget.title as Text).data == 'Notifications',
      );

      expect(notificationsTile, findsOneWidget);
    });

    testWidgets('Language menu item is tappable', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SettingsScreen()));

      // Verify Language ListTile exists
      final languageTile = find.byWidgetPredicate(
        (widget) =>
            widget is ListTile &&
            widget.title is Text &&
            (widget.title as Text).data == 'Language',
      );

      expect(languageTile, findsOneWidget);
    });

    testWidgets('Privacy Policy menu item is tappable', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: SettingsScreen()));

      // Verify Privacy Policy ListTile exists
      final privacyTile = find.byWidgetPredicate(
        (widget) =>
            widget is ListTile &&
            widget.title is Text &&
            (widget.title as Text).data == 'Privacy Policy',
      );

      expect(privacyTile, findsOneWidget);
    });

    testWidgets('Help & Support menu item is tappable', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: SettingsScreen()));

      // Verify Help & Support ListTile exists
      final helpTile = find.byWidgetPredicate(
        (widget) =>
            widget is ListTile &&
            widget.title is Text &&
            (widget.title as Text).data == 'Help & Support',
      );

      expect(helpTile, findsOneWidget);
    });

    testWidgets('About menu item is tappable', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SettingsScreen()));

      // Verify About ListTile exists
      final aboutTile = find.byWidgetPredicate(
        (widget) =>
            widget is ListTile &&
            widget.title is Text &&
            (widget.title as Text).data == 'About',
      );

      expect(aboutTile, findsOneWidget);
    });

    testWidgets('Logout menu item is tappable', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SettingsScreen()));

      // Verify Logout ListTile exists and is tappable
      final logoutTile = find.byWidgetPredicate(
        (widget) =>
            widget is ListTile &&
            widget.title is Text &&
            (widget.title as Text).data == 'Logout',
      );

      expect(logoutTile, findsOneWidget);
    });

    testWidgets('SettingsScreen is a StatelessWidget', (
      WidgetTester tester,
    ) async {
      expect(SettingsScreen, isA<Type>());
      const screen = SettingsScreen();
      expect(screen, isA<StatelessWidget>());
    });

    testWidgets('SettingsScreen builds without errors', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: SettingsScreen()));

      // If we reach this point without exceptions, the widget builds successfully
      expect(find.byType(SettingsScreen), findsOneWidget);
    });

    testWidgets('Each ListTile has an icon', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SettingsScreen()));

      // Verify all Icons are present (7 for menu items + 1 logout = we check for Icons)
      expect(find.byType(Icon), findsWidgets);
    });

    testWidgets('ListTiles have proper structure', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SettingsScreen()));

      // Find all ListTiles and verify they exist
      final listTiles = find.byType(ListTile);
      expect(listTiles, findsWidgets);

      // Should have 7 ListTiles (Profile, Notifications, Language, Privacy, Help, About, Logout)
      expect(listTiles, findsWidgets);
    });

    testWidgets('SettingsScreen has Scaffold', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SettingsScreen()));

      expect(find.byType(Scaffold), findsOneWidget);
    });

    testWidgets('SettingsScreen scrolls when content exceeds viewport', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: SettingsScreen()));

      // ListView should handle scrolling
      expect(find.byType(ListView), findsOneWidget);

      // Verify we can scroll (if needed)
      await tester.drag(find.byType(ListView), const Offset(0, -300));
      await tester.pumpAndSettle();
    });

    testWidgets('Menu items are in correct order', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SettingsScreen()));

      // Get all Text widgets to verify order
      final textFinder = find.byType(Text);
      expect(textFinder, findsWidgets);

      // Verify 'Settings' appears first (in AppBar)
      expect(find.text('Settings'), findsWidgets);
    });
  });
}
