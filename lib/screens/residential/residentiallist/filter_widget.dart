import 'package:flutter/material.dart';

class PropertyFilterButtons extends StatefulWidget {
  final Function(String)? onFilterSelected;
  final String? initialSelection;

  const PropertyFilterButtons({
    super.key,
    this.onFilterSelected,
    this.initialSelection = 'All',
  });

  @override
  State<PropertyFilterButtons> createState() => _PropertyFilterButtonsState();
}

class _PropertyFilterButtonsState extends State<PropertyFilterButtons> {
  String selectedFilter = 'All';

  @override
  void initState() {
    super.initState();
    selectedFilter = widget.initialSelection ?? 'All';
  }

  void _onButtonTap(String filter) {
    setState(() {
      selectedFilter = filter;
    });
    if (widget.onFilterSelected != null) {
      widget.onFilterSelected!(filter);
    }
  }

  Widget _buildFilterButton({
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32,
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelected
              ? const Color.fromRGBO(3, 2, 19, 1)
              : const Color.fromRGBO(255, 255, 255, 1),
          border: isSelected
              ? null
              : Border.all(color: const Color.fromRGBO(0, 0, 0, 0.1), width: 1),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected
                  ? const Color.fromRGBO(255, 255, 255, 1)
                  : const Color.fromRGBO(26, 26, 26, 1),
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: 'Arial',
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //constraints: const BoxConstraints(maxWidth: 345),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildFilterButton(
            text: 'All',
            isSelected: selectedFilter == 'All',
            onTap: () => _onButtonTap('All'),
          ),
          const SizedBox(width: 8),
          _buildFilterButton(
            text: 'Villa',
            isSelected: selectedFilter == 'Villa',
            onTap: () => _onButtonTap('Villa'),
          ),
          const SizedBox(width: 8),
          _buildFilterButton(
            text: 'Apartment',
            isSelected: selectedFilter == 'Apartment',
            onTap: () => _onButtonTap('Apartment'),
          ),
          const SizedBox(width: 8),
          _buildFilterButton(
            text: 'House',
            isSelected: selectedFilter == 'House',
            onTap: () => _onButtonTap('House'),
          ),
          const SizedBox(width: 8),
          _buildFilterButton(
            text: 'Under ₹1Cr',
            isSelected: selectedFilter == 'Under ₹1Cr',
            onTap: () => _onButtonTap('Under ₹1Cr'),
          ),
        ],
      ),
    );
  }
}
