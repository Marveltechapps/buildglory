import 'package:flutter/material.dart';

class BottomNavigationSection extends StatefulWidget {
  const BottomNavigationSection({Key? key}) : super(key: key);

  @override
  State<BottomNavigationSection> createState() => _BottomNavigationSectionState();
}

class _BottomNavigationSectionState extends State<BottomNavigationSection> {
  int selectedIndex = 0; // Home is selected by default

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Color(0xFFE5E7EB)),
        ),
      ),
      child: Container(
        height: 55.5,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
              index: 0,
              icon: Icons.home_outlined,
              label: 'Home',
              isSelected: true,
            ),
            _buildNavItem(
              index: 1,
              icon: Icons.search,
              label: 'Explore',
            ),
            _buildNavItem(
              index: 2,
              icon: Icons.favorite_outline,
              label: 'My Wish',
            ),
            _buildNavItem(
              index: 3,
              icon: Icons.person_outline,
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required String label,
    bool isSelected = false,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        width: 50,
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 10.5, vertical: 7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Color(0xFF6A7282),
                fontSize: 11,
                fontWeight: FontWeight.w400,
                height: 1.27,
              ),
            ),
            const SizedBox(height: 3.5),
            SizedBox(
              width: 24,
              height: 24,
              child: Icon(
                icon,
                size: 24,
                color: isSelected ? const Color(0xFF155DFC) : const Color(0xFF6A7282),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
