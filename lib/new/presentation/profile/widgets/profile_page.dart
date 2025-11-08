import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/new/presentation/profile/widgets/profile_edit_page.dart';
import 'package:buildglory/new/presentation/profile/widgets/profile_screen.dart';
import 'package:buildglory/new/profile/favourites/fav_screen.dart';
import 'package:buildglory/new/profile/generalinfo/pages/general_info_page.dart';
import 'package:buildglory/new/profile/help&feedback/help_feedback_screen.dart';
import 'package:buildglory/new/profile/setting/settings.dart';
import 'package:flutter/material.dart';
import 'user_profile_card.dart';
import 'menu_item_card.dart';
import '../models/menu_item.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  List<MenuItemModel> _getMenuItems(context) {
    return [
      MenuItemModel(
        iconUrl: historyIcon,
        title: 'History',
        description: 'View your activity history',
        onTap: () {
          // Handle history tap
        },
      ),
      MenuItemModel(
        iconUrl: offersIcon,
        title: 'Offers',
        description: 'Special deals and promotions',
        onTap: () {
          // Handle offers tap
        },
      ),
      MenuItemModel(
        iconUrl: favIcon,
        title: 'Favorites',
        description: 'Your saved properties',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FavouritesScreen();
              },
            ),
          );
        },
      ),
      MenuItemModel(
        iconUrl: infogreyIcon,
        title: 'General Info',
        description: 'App information and policies',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return GeneralInfoPage();
              },
            ),
          );
        },
      ),
      MenuItemModel(
        iconUrl: helpIcon,
        title: 'Help & Feedback',
        description: 'Get support and share feedback',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return HelpFeedbackPage();
              },
            ),
          );
        },
      ),
      MenuItemModel(
        iconUrl: settingsIcon,
        title: 'Settings',
        description: 'App preferences and configuration',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return Settings();
              },
            ),
          );
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9FAFB),
        leading: SizedBox(),
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF101828),
            letterSpacing: -0.31,
            height: 2,
            fontFamily: 'Arial',
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            UserProfileCard(
              phoneNumber: '+91 9629262611',
              name: 'john wick',
              avatarUrl:
                  'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/866190650fae56957bed18cc89e9532ff0d06b44?placeholderIfAbsent=true',
              onEditPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ProfileScreen();
                    },
                  ),
                );
              },
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                child: ListView(
                  children: _getMenuItems(
                    context,
                  ).map((item) => MenuItemCard(menuItem: item)).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
