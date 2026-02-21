import 'package:flutter/material.dart';

class SingleSelectionChipSet extends StatefulWidget {
  final List<String> options;
  final String initialSelected;
  final Function(String) onSelectionChanged;
  final bool showDivider;

  const SingleSelectionChipSet({
    super.key,
    required this.options,
    required this.initialSelected,
    required this.onSelectionChanged,
    this.showDivider = true,
  });

  @override
  State<SingleSelectionChipSet> createState() => _SingleSelectionChipSetState();
}

class _SingleSelectionChipSetState extends State<SingleSelectionChipSet> {
  late String selectedOption;

  @override
  void initState() {
    super.initState();
    selectedOption = widget.initialSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  widget.options.length,
                  (index) {
                    final option = widget.options[index];
                    final isSelected = selectedOption == option;

                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: _buildChip(option, isSelected),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        if (widget.showDivider)
          Container(
            height: 1,
            color: const Color(0xFF333333),
          ),
      ],
    );
  }

  Widget _buildChip(String label, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = label;
        });
        widget.onSelectionChanged(label);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF26E36B) : const Color(0xFFF2F2F2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF191919),
            height: 1.14,
          ),
        ),
      ),
    );
  }
}
