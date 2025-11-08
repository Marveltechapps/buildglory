import 'package:flutter/material.dart';

class TabNavigation extends StatefulWidget {
  const TabNavigation({Key? key}) : super(key: key);

  @override
  State<TabNavigation> createState() => _TabNavigationState();
}

class _TabNavigationState extends State<TabNavigation> {
  int selectedIndex = 1; // Buy is selected by default

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.only(top: 3.5, left: 3.5, right: 3.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: const Color(0xFFF3F4F6),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildTabButton(
              index: 0,
              icon: Icons.home_outlined,
              label: 'Sell',
              color: const Color(0xFF6A7282),
            ),
          ),
          Expanded(
            child: _buildTabButton(
              index: 1,
              icon: Icons.business_outlined,
              label: 'Buy',
              color: const Color(0xFF00A63E),
            ),
          ),
          Expanded(
            child: _buildTabButton(
              index: 2,
              icon: Icons.swap_vert,
              label: 'Exchange',
              color: const Color(0xFF6A7282),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton({
    required int index,
    required IconData icon,
    required String label,
    required Color color,
  }) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        height: 49,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.75),
          color: isSelected ? Colors.white : Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 28,
              height: 17.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.75),
                color: const Color(0xFFF3F4F6),
              ),
              child: Icon(
                icon,
                size: 14,
                color: isSelected ? color : const Color(0xFF6A7282),
              ),
            ),
            const SizedBox(height: 3.5),
            Text(
              label,
              style: TextStyle(
                color: const Color(0xFF6A7282),
                fontSize: 11,
                fontWeight: FontWeight.w400,
                height: 1.27,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
