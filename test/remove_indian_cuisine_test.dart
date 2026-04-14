import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tab_hackthon/screens/home_screen.dart';

void main() {
  group('Remove American and Indian cuisine filter tests', () {
    testWidgets('Does not render Indian or American filter chips on HomeScreen', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
      await tester.pumpAndSettle();

      expect(find.widgetWithText(FilterChip, 'Indian'), findsNothing);
      expect(find.widgetWithText(FilterChip, 'American'), findsNothing);
      expect(find.widgetWithText(FilterChip, 'Chinese'), findsOneWidget);
    });

    testWidgets('HomeScreen still renders remaining cuisine filters', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
      await tester.pumpAndSettle();

      expect(find.byType(FilterChip), findsWidgets);
      expect(find.widgetWithText(FilterChip, 'Italian'), findsOneWidget);
      expect(find.widgetWithText(FilterChip, 'Japanese'), findsOneWidget);
      expect(find.widgetWithText(FilterChip, 'Mexican'), findsOneWidget);
      expect(find.widgetWithText(FilterChip, 'Chinese'), findsOneWidget);
    });
  });
}
