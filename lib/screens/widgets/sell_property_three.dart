// import 'package:buildglory/constant/constant.dart';
// import 'package:buildglory/screens/widgets/sell_property_four.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class SellPropertyThree extends StatefulWidget {
//   const SellPropertyThree({super.key});

//   @override
//   State<SellPropertyThree> createState() => _SellPropertyFormPageState();
// }

// class _SellPropertyFormPageState extends State<SellPropertyThree> {
//   final TextEditingController _descriptionController = TextEditingController();

//   @override
//   void dispose() {
//     _descriptionController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF9FAFB),
//       body: SafeArea(
//         child: Column(
//           children: [
//             _buildHeader(),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     children: [
//                       _buildPropertyDescriptionCard(),
//                       const SizedBox(height: 20),
//                       _buildPropertyPhotosCard(),
//                       const SizedBox(height: 20),
//                       _buildNavigationButtons(),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildHeader() {
//     return Container(
//       width: double.infinity,
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         border: Border(bottom: BorderSide(color: Color(0xFFF3F4F6), width: 1)),
//       ),
//       padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
//       child: Column(
//         children: [
//           SizedBox(
//             height: 42,
//             child: Row(
//               children: [
//                 Container(
//                   width: 35,
//                   height: 35,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(33554400),
//                   ),
//                   child: IconButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     icon: Icon(Icons.arrow_back),
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 Expanded(
//                   child: SizedBox(
//                     height: 42,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           height: 25,
//                           child: Text(
//                             'Property Details',
//                             style: TextStyle(
//                               fontFamily: 'Arial',
//                               fontSize: 18,
//                               fontWeight: FontWeight.w400,
//                               color: const Color(0xFF1A1A1A),
//                               letterSpacing: -0.35,
//                               height: 1.4,
//                             ),
//                           ),
//                         ),
//                         Text(
//                           'Step 3 of 4',
//                           style: TextStyle(
//                             fontFamily: 'Arial',
//                             fontSize: 12,
//                             fontWeight: FontWeight.w400,
//                             color: const Color(0xFF4A5565),
//                             height: 1.0,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 12),
//           Container(
//             height: 7,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(33554400),
//               color: const Color(0xFFE5E7EB),
//             ),
//             child: FractionallySizedBox(
//               alignment: Alignment.centerLeft,
//               widthFactor: 0.75, // 75% progress (3 of 4 steps)
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(33554400),
//                   color: const Color(0xFF155DFC),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPropertyDescriptionCard() {
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: Colors.white,
//         border: Border.all(color: const Color(0x1A000000), width: 1),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: 28,
//               child: Text(
//                 'Property Description *',
//                 style: TextStyle(
//                   fontFamily: 'Arial',
//                   fontSize: 20,
//                   fontWeight: FontWeight.w400,
//                   color: const Color(0xFF1A1A1A),
//                   height: 1.4,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 12),
//             Container(
//               width: double.infinity,
//               constraints: const BoxConstraints(minHeight: 79),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 color: const Color(0xFFF3F3F5),
//                 border: Border.all(color: Colors.transparent, width: 1),
//               ),
//               padding: const EdgeInsets.fromLTRB(14, 7, 14, 30),
//               child: TextField(
//                 controller: _descriptionController,
//                 maxLines: null,
//                 decoration: InputDecoration(
//                   border: InputBorder.none,
//                   hintText:
//                       'Describe your property - location advantages, nearby facilities, unique features, etc.',
//                   hintStyle: TextStyle(
//                     fontFamily: 'Arial',
//                     fontSize: 14,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.grey.shade500,
//                     height: 1.5,
//                   ),
//                 ),
//                 style: TextStyle(
//                   fontFamily: 'Arial',
//                   fontSize: 14,
//                   fontWeight: FontWeight.w400,
//                   color: Colors.black,
//                   height: 1.5,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 12),
//             Text(
//               'A detailed description helps attract more buyers',
//               style: TextStyle(
//                 fontFamily: 'Arial',
//                 fontSize: 11,
//                 fontWeight: FontWeight.w400,
//                 color: const Color(0xFF6A7282),
//                 height: 1.0,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildPropertyPhotosCard() {
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: Colors.white,
//         border: Border.all(color: const Color(0x1A000000), width: 1),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: 28,
//               child: Text(
//                 'Property Photos',
//                 style: TextStyle(
//                   fontFamily: 'Arial',
//                   fontSize: 20,
//                   fontWeight: FontWeight.w400,
//                   color: const Color(0xFF1A1A1A),
//                   height: 1.4,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 12),
//             Container(
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 border: Border.all(color: const Color(0xFFD1D5DC), width: 2),
//               ),
//               padding: const EdgeInsets.all(30),
//               child: Column(
//                 children: [
//                   SvgPicture.asset(
//                     camerablackIcon,
//                     width: 42,
//                     height: 42,
//                     fit: BoxFit.contain,
//                   ),
//                   const SizedBox(height: 12),
//                   SizedBox(
//                     height: 25,
//                     width: 245,
//                     child: Text(
//                       'Upload Property Phot os',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontFamily: 'Arial',
//                         fontSize: 18,
//                         fontWeight: FontWeight.w400,
//                         color: const Color(0xFF1A1A1A),
//                         height: 1.4,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 7),
//                     child: SizedBox(
//                       width: 230,
//                       child: Text(
//                         'Add high-quality photos to showcase your property',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontFamily: 'Arial',
//                           fontSize: 12,
//                           fontWeight: FontWeight.w400,
//                           color: const Color(0xFF4A5565),
//                           height: 1.5,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                       color: Colors.white,
//                       border: Border.all(
//                         color: const Color(0x1A000000),
//                         width: 1,
//                       ),
//                     ),
//                     padding: const EdgeInsets.fromLTRB(9, 3, 9, 3),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         SvgPicture.asset(
//                           cameragreyIcon,
//                           width: 14,
//                           height: 14,
//                           fit: BoxFit.contain,
//                         ),
//                         const SizedBox(width: 12),
//                         Text(
//                           'Choose Photos',
//                           style: TextStyle(
//                             fontFamily: 'Arial',
//                             fontSize: 14,
//                             fontWeight: FontWeight.w400,
//                             color: const Color(0xFF1A1A1A),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 12),
//             Text(
//               'You can add photos later if needed',
//               style: TextStyle(
//                 fontFamily: 'Arial',
//                 fontSize: 11,
//                 fontWeight: FontWeight.w400,
//                 color: const Color(0xFF6A7282),
//                 height: 1.0,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildNavigationButtons() {
//     return SizedBox(
//       height: 42,
//       child: Row(
//         children: [
//           Expanded(
//             child: InkWell(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: Container(
//                 height: 42,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: Colors.white,
//                   border: Border.all(color: const Color(0x1A000000), width: 1),
//                 ),
//                 child: Center(
//                   child: Text(
//                     'Previous',
//                     style: TextStyle(
//                       fontFamily: 'Arial',
//                       fontSize: 14,
//                       fontWeight: FontWeight.w400,
//                       color: const Color(0xFF1A1A1A),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: InkWell(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) {
//                       return SellPropertyFour();
//                     },
//                   ),
//                 );
//               },
//               child: Container(
//                 height: 42,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: const Color(0xFF155DFC),
//                 ),
//                 child: Center(
//                   child: Text(
//                     'Continue',
//                     style: TextStyle(
//                       fontFamily: 'Arial',
//                       fontSize: 14,
//                       fontWeight: FontWeight.w400,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
