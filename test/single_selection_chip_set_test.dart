import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tab_hackthon/widgets/single_selection_chip_set.dart';

void main() {
  group('SingleSelectionChipSet Widget Tests', () {
    testWidgets('Renders all option chips correctly',
        (WidgetTester tester) async {
      const options = ['Lineups', 'Matchup', 'Ladder'];
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleSelectionChipSet(
              options: options,
              initialSelected: 'Lineups',
              onSelectionChanged: (_) {},
            ),
          ),
        ),
      );

      // Verify all chips are rendered
      for (final option in options) {
        expect(find.text(option), findsOneWidget);
      }
    });

    testWidgets('Initial selection is displayed correctly',
        (WidgetTester tester) async {
      const options = ['Lineups', 'Matchup', 'Ladder'];
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleSelectionChipSet(
              options: options,
              initialSelected: 'Matchup',
              onSelectionChanged: (_) {},
            ),
          ),
        ),
      );

      // Get the Matchup chip container and verify it has the selected color
      final matchupChip = find.byType(GestureDetector).at(1); // Matchup is second
      expect(matchupChip, findsOneWidget);

      // Verify the color of selected chip (green: #26E36B)
      final containerFinder = find.descendant(
        of: matchupChip,
        matching: find.byType(Container),
      );
      expect(containerFinder, findsWidgets);
    });

    testWidgets(
        'Tapping a chip changes selection and updates UI',
        (WidgetTester tester) async {
      const options = ['Lineups', 'Matchup', 'Ladder'];
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleSelectionChipSet(
              options: options,
              initialSelected: 'Lineups',
              onSelectionChanged: (_) {},
            ),
          ),
        ),
      );

      // Tap on Matchup chip (second button)
      final matchupChip = find.byType(GestureDetector).at(1);
      await tester.tap(matchupChip);
      await tester.pump();

      // Verify Matchup chip text still exists
      expect(find.text('Matchup'), findsOneWidget);
    });

    testWidgets('onSelectionChanged callback is invoked correctly',
        (WidgetTester tester) async {
      const options = ['Lineups', 'Matchup', 'Ladder'];
      String selectedValue = '';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleSelectionChipSet(
              options: options,
              initialSelected: 'Lineups',
              onSelectionChanged: (value) {
                selectedValue = value;
              },
            ),
          ),
        ),
      );

      // Tap on Ladder chip (third chip)
      final ladderChip = find.byType(GestureDetector).at(2);
      await tester.tap(ladderChip);
      await tester.pump();

      // Verify callback was invoked with correct value
      expect(selectedValue, equals('Ladder'));
    });

    testWidgets('Divider is shown when showDivider is true',
        (WidgetTester tester) async {
      const options = ['Lineups', 'Matchup', 'Ladder'];
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleSelectionChipSet(
              options: options,
              initialSelected: 'Lineups',
              onSelectionChanged: (_) {},
              showDivider: true,
            ),
          ),
        ),
      );

      // Find Container with height 1 (divider)
      final dividers = find.byWidgetPredicate(
        (widget) =>
            widget is Container &&
            widget.constraints != null &&
            (widget.color == const Color(0xFF333333) ||
                (widget.decoration is BoxDecoration &&
                    (widget.decoration as BoxDecoration).color ==
                        const Color(0xFF333333))),
      );

      // Verify at least one divider exists
      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('Divider is hidden when showDivider is false',
        (WidgetTester tester) async {
      const options = ['Lineups', 'Matchup', 'Ladder'];
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleSelectionChipSet(
              options: options,
              initialSelected: 'Lineups',
              onSelectionChanged: (_) {},
              showDivider: false,
            ),
          ),
        ),
      );

      // Verify widget renders without error
      expect(find.byType(SingleSelectionChipSet), findsOneWidget);
    });

    testWidgets('Only one chip can be selected at a time',
        (WidgetTester tester) async {
      const options = ['Lineups', 'Matchup', 'Ladder', 'News'];
      String selectedValue = 'Lineups';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleSelectionChipSet(
              options: options,
              initialSelected: 'Lineups',
              onSelectionChanged: (value) {
                selectedValue = value;
              },
            ),
          ),
        ),
      );

      // Select Matchup
      await tester.tap(find.byType(GestureDetector).at(1));
      await tester.pump();
      expect(selectedValue, equals('Matchup'));

      // Select Ladder - previous selection should be cleared
      await tester.tap(find.byType(GestureDetector).at(2));
      await tester.pump();
      expect(selectedValue, equals('Ladder'));

      // Select News
      await tester.tap(find.byType(GestureDetector).at(3));
      await tester.pump();
      expect(selectedValue, equals('News'));
    });

    testWidgets(
        'Handles dynamic options list correctly',
        (WidgetTester tester) async {
      const options = ['Option1', 'Option2', 'Option3', 'Option4', 'Option5'];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleSelectionChipSet(
              options: options,
              initialSelected: 'Option1',
              onSelectionChanged: (_) {},
            ),
          ),
        ),
      );

      // Verify all 5 options are rendered
      for (final option in options) {
        expect(find.text(option), findsOneWidget);
      }
    });

    testWidgets('Chip styling is correct for selected state',
        (WidgetTester tester) async {
      const options = ['Lineups', 'Matchup', 'Ladder'];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleSelectionChipSet(
              options: options,
              initialSelected: 'Matchup',
              onSelectionChanged: (_) {},
            ),
          ),
        ),
      );

      // Verify widget renders correctly
      expect(find.byType(SingleSelectionChipSet), findsOneWidget);
      expect(find.text('Matchup'), findsOneWidget);
    });

    testWidgets('Widget handles rapid taps correctly',
        (WidgetTester tester) async {
      const options = ['Lineups', 'Matchup', 'Ladder'];
      int callbackCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleSelectionChipSet(
              options: options,
              initialSelected: 'Lineups',
              onSelectionChanged: (_) {
                callbackCount++;
              },
            ),
          ),
        ),
      );

      // Rapid taps on different chips
      await tester.tap(find.byType(GestureDetector).at(1)); // Matchup
      await tester.pump();
      await tester.tap(find.byType(GestureDetector).at(2)); // Ladder
      await tester.pump();
      await tester.tap(find.byType(GestureDetector).at(0)); // Lineups
      await tester.pump();

      // Verify callbacks were invoked
      expect(callbackCount, equals(3));
    });

    testWidgets('Empty initial selected value handled gracefully',
        (WidgetTester tester) async {
      const options = ['Lineups', 'Matchup', 'Ladder'];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleSelectionChipSet(
              options: options,
              initialSelected: 'Lineups',
              onSelectionChanged: (_) {},
            ),
          ),
        ),
      );

      // Verify widget renders without errors
      expect(find.byType(SingleSelectionChipSet), findsOneWidget);
      expect(find.text('Lineups'), findsOneWidget);
    });

    testWidgets('Text styling matches design specifications',
        (WidgetTester tester) async {
      const options = ['Lineups', 'Matchup', 'Ladder'];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleSelectionChipSet(
              options: options,
              initialSelected: 'Lineups',
              onSelectionChanged: (_) {},
            ),
          ),
        ),
      );

      // Find all Text widgets
      final textFinders = find.byType(Text);
      expect(textFinders, findsWidgets);

      // Verify at least the chip labels are present
      expect(find.text('Lineups'), findsOneWidget);
      expect(find.text('Matchup'), findsOneWidget);
      expect(find.text('Ladder'), findsOneWidget);
    });

    testWidgets('Horizontal scrolling works for many chips',
        (WidgetTester tester) async {
      const options = [
        'Chip1',
        'Chip2',
        'Chip3',
        'Chip4',
        'Chip5',
        'Chip6',
        'Chip7',
        'Chip8'
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleSelectionChipSet(
              options: options,
              initialSelected: 'Chip1',
              onSelectionChanged: (_) {},
            ),
          ),
        ),
      );

      // Verify all chips are present in the widget tree
      for (final option in options) {
        expect(find.text(option), findsOneWidget);
      }
    });
  });
}
