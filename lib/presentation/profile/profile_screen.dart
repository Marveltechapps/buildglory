import 'package:buildglory/final/home/pages/home_main_screen.dart';
import 'package:buildglory/new/presentation/home/pages/home_main_screen.dart';
import 'package:buildglory/new/presentation/home/pages/home_screen.dart';
import 'package:buildglory/presentation/home/pages/home.dart';
import 'package:flutter/material.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({super.key});

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  final TextEditingController _nameController = TextEditingController(
    text: 'suman',
  );

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        title: Text("Profile Setup"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          spacing: 20,
          children: [
            SizedBox(
              width: 87,
              height: 102,
              child: Image.network(
                'https://api.builder.io/api/v1/image/assets/f9d3014b66ec4ab0b700dbedbaba9803/2cb3339677b256cdb8697591f690bab3345e9ff1?placeholderIfAbsent=true',
                fit: BoxFit.contain,
              ),
            ),
            Text(
              'Upload profile picture',
              style: TextStyle(
                color: Color(0xFF4A5565),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: 'Arial',
                height: 1,
              ),
              textAlign: TextAlign.center,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Label
                SizedBox(
                  height: 18,
                  child: Row(
                    children: [
                      const Text(
                        'Name',
                        style: TextStyle(
                          color: Color(0xFF364153),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Arial',
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                // Input field
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: const Color(0xFFF3F3F5),
                    border: Border.all(color: Colors.transparent, width: 1),
                  ),
                  child: TextField(
                    controller: _nameController,
                    style: const TextStyle(
                      color: Color(0xFF71717E),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Arial',
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(11, 14, 11, 14),
                      isDense: true,
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomeMainScreen();
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF155DFC),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
                padding: const EdgeInsets.fromLTRB(70, 12, 70, 12),
                elevation: 0,
              ),
              child: const Text(
                'Save',
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Arial',
                  height: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
