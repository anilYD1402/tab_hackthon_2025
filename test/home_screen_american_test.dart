import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tab_hackthon/screens/home_screen.dart';

void main() {
  testWidgets('HomeScreen includes American cuisine in filter chips', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
    await tester.pumpAndSettle();

    expect(find.text('American'), findsWidgets);
    expect(find.byType(FilterChip), findsWidgets);
  });

  testWidgets('HomeScreen filters restaurants by American cuisine', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
    await tester.pumpAndSettle();

    final americanFilter = find.widgetWithText(FilterChip, 'American');
    expect(americanFilter, findsOneWidget);

    await tester.tap(americanFilter);
    await tester.pumpAndSettle();

    expect(find.text('Burger Haven'), findsOneWidget);
    expect(find.text('Chicken Wings Co'), findsOneWidget);
    expect(find.text('Pizza Palace'), findsNothing);
  });
}
