import 'package:flutter/material.dart';

class FilterButtons extends StatelessWidget {
  final String selectedFilter;
  final Function(String) onFilterChanged;

  const FilterButtons({
    Key? key,
    required this.selectedFilter,
    required this.onFilterChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth <= 991;
    final isMobile = screenWidth <= 640;

    final filters = [
      'All Homes (3)',
      'Solar Powered (2)',
      'Smart Homes (1)',
    ];

    if (isMobile) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: filters.map((filter) => _buildFilterButton(filter, isTablet)).toList(),
        ),
      );
    }

    return Wrap(
      spacing: 7,
      runSpacing: 8,
      children: filters.map((filter) => _buildFilterButton(filter, isTablet)).toList(),
    );
  }

  Widget _buildFilterButton(String filter, bool isTablet) {
    final isSelected = filter == selectedFilter;

    return GestureDetector(
      onTap: () => onFilterChanged(filter),
      child: Container(
        height: 28,
        padding: EdgeInsets.symmetric(horizontal: isTablet ? 8 : 10.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.75),
          color: isSelected ? const Color(0xFF00BC7D) : Colors.transparent,
        ),
        child: Center(
          child: Text(
            filter,
            style: TextStyle(
              color: isSelected ? Colors.white : const Color(0xFF0A0A0A),
              fontSize: isTablet ? 11 : 12,
              fontWeight: FontWeight.w400,
              height: 1.46,
              fontFamily: 'Arial',
            ),
          ),
        ),
      ),
    );
  }
}
