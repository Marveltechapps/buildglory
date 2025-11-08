import 'dart:ui';

class MenuItemModel {
  final String iconUrl;
  final String title;
  final String description;
  final VoidCallback? onTap;

  const MenuItemModel({
    required this.iconUrl,
    required this.title,
    required this.description,
    this.onTap,
  });
}
