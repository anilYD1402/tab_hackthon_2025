import 'package:flutter/material.dart';
import 'package:tab_hackthon/widgets/single_selection_chip_set.dart';

class SingleSelectionChipSetDemo extends StatefulWidget {
  const SingleSelectionChipSetDemo({super.key});

  @override
  State<SingleSelectionChipSetDemo> createState() => _SingleSelectionChipSetDemoState();
}

class _SingleSelectionChipSetDemoState extends State<SingleSelectionChipSetDemo> {
  String selectedOption = 'Matchup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Single Selection Chip Set Demo'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Demo with Lineups, Matchup, Ladder options
            SingleSelectionChipSet(
              options: const ['Lineups', 'Matchup', 'Ladder'],
              initialSelected: 'Matchup',
              onSelectionChanged: (selected) {
                setState(() {
                  selectedOption = selected;
                });
                print('Selected: $selected');
              },
            ),
            const SizedBox(height: 32),
            Text(
              'Currently selected: $selectedOption',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            // Demo with other options
            SingleSelectionChipSet(
              options: const ['All', 'Italian', 'American', 'Japanese', 'Mexican'],
              initialSelected: 'All',
              onSelectionChanged: (selected) {
                print('Cuisine selected: $selected');
              },
              showDivider: true,
            ),
          ],
        ),
      ),
    );
  }
}
