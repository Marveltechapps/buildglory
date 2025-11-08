// import 'package:buildglory/presentation/sellpropertysuceess/widgets/sell_property_success_page.dart';
// import 'package:flutter/material.dart';

// class SellPropertyFourthPage extends StatefulWidget {
//   const SellPropertyFourthPage({super.key});

//   @override
//   State<SellPropertyFourthPage> createState() => _SellPropertyFormPageState();
// }

// class _SellPropertyFormPageState extends State<SellPropertyFourthPage> {
//   final TextEditingController _fullNameController = TextEditingController();
//   bool _isAgreedToTerms = true;

//   @override
//   void dispose() {
//     _fullNameController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final isSmallScreen = screenWidth <= 640;
//     final isMediumScreen = screenWidth <= 991;

//     return Scaffold(
//       backgroundColor: const Color(0xFFF9FAFB),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Container(
//             width: isMediumScreen ? double.infinity : 377,
//             constraints: BoxConstraints(
//               maxWidth: isMediumScreen ? double.infinity : 377,
//             ),
//             child: Column(
//               children: [
//                 // Header Container
//                 Container(
//                   width: double.infinity,
//                   padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     border: Border(
//                       bottom: BorderSide(color: Color(0xFFF3F4F6), width: 1),
//                     ),
//                   ),
//                   child: Column(
//                     children: [
//                       // Header
//                       Row(
//                         children: [
//                           // Back Button
//                           Container(
//                             width: 35,
//                             height: 35,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(33554400),
//                             ),
//                             child: Center(
//                               child: SizedBox(
//                                 width: 14,
//                                 height: 14,
//                                 child: CustomPaint(painter: BackIconPainter()),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 8),
//                           // Header Content
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 // Title Container
//                                 SizedBox(
//                                   height: 24.5,
//                                   child: const Text(
//                                     'Property Details',
//                                     style: TextStyle(
//                                       color: Color(0xFF0A0A0A),
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w400,
//                                       height: 24.5 / 18,
//                                       fontFamily: 'Arial',
//                                     ),
//                                   ),
//                                 ),
//                                 // Subtitle Container
//                                 SizedBox(
//                                   height: 18,
//                                   child: const Text(
//                                     'Step 4 of 4',
//                                     style: TextStyle(
//                                       color: Color(0xFF4A5565),
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w400,
//                                       height: 17.5 / 12,
//                                       fontFamily: 'Arial',
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 14),
//                       // Progress Bar Container
//                       Container(
//                         height: 7,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(33554400),
//                           color: const Color(0xFFE5E7EB),
//                         ),
//                         child: Container(
//                           height: 7,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(33554400),
//                             color: const Color(0xFF155DFC),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 // Form Container
//                 Container(
//                   padding: EdgeInsets.symmetric(
//                     vertical: isSmallScreen ? 12 : 18,
//                   ),
//                   child: Column(
//                     children: [
//                       // Form Content
//                       Container(
//                         width: isMediumScreen ? double.infinity : 342,
//                         padding: EdgeInsets.symmetric(
//                           horizontal: isMediumScreen
//                               ? (isSmallScreen ? 12 : 16)
//                               : 0,
//                         ),
//                         child: Column(
//                           children: [
//                             // Owner Details Card
//                             Container(
//                               margin: EdgeInsets.only(
//                                 bottom: isSmallScreen ? 16 : 20,
//                               ),
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(12.75),
//                                 border: Border.all(
//                                   color: Colors.black12,
//                                   width: 1,
//                                 ),
//                               ),
//                               child: Container(
//                                 width: double.infinity,
//                                 padding: EdgeInsets.all(
//                                   isSmallScreen ? 12 : 16,
//                                 ),
//                                 child: Column(
//                                   children: [
//                                     // Section Header
//                                     Row(
//                                       children: [
//                                         SizedBox(
//                                           width: 17.5,
//                                           height: 17.5,
//                                           child: CustomPaint(
//                                             painter: UserIconPainter(),
//                                           ),
//                                         ),
//                                         const SizedBox(width: 8),
//                                         const Text(
//                                           'Owner Details *',
//                                           style: TextStyle(
//                                             color: Color(0xFF0A0A0A),
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.w400,
//                                             height: 24 / 16,
//                                             fontFamily: 'Arial',
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     const SizedBox(height: 16),
//                                     // Section Content
//                                     Column(
//                                       children: [
//                                         // Full Name Field
//                                         Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Container(
//                                               height: 17.5,
//                                               alignment: Alignment.centerLeft,
//                                               child: const Text(
//                                                 'Full Name *',
//                                                 style: TextStyle(
//                                                   color: Color(0xFF0A0A0A),
//                                                   fontSize: 12,
//                                                   fontWeight: FontWeight.w400,
//                                                   height: 17.5 / 12,
//                                                   fontFamily: 'Arial',
//                                                 ),
//                                               ),
//                                             ),
//                                             const SizedBox(height: 7),
//                                             Container(
//                                               height: 31.5,
//                                               padding:
//                                                   const EdgeInsets.symmetric(
//                                                     horizontal: 10.5,
//                                                     vertical: 3.5,
//                                                   ),
//                                               decoration: BoxDecoration(
//                                                 color: const Color(0xFFF3F3F5),
//                                                 borderRadius:
//                                                     BorderRadius.circular(6.75),
//                                                 border: Border.all(
//                                                   color: Colors.transparent,
//                                                   width: 1,
//                                                 ),
//                                               ),
//                                               child: TextFormField(
//                                                 controller: _fullNameController,
//                                                 decoration:
//                                                     const InputDecoration(
//                                                       border: InputBorder.none,
//                                                       hintText:
//                                                           'Enter your full name',
//                                                       hintStyle: TextStyle(
//                                                         color: Color(
//                                                           0xFF717182,
//                                                         ),
//                                                         fontSize: 12,
//                                                         fontWeight:
//                                                             FontWeight.w400,
//                                                         fontFamily: 'Arial',
//                                                       ),
//                                                       contentPadding:
//                                                           EdgeInsets.zero,
//                                                     ),
//                                                 style: const TextStyle(
//                                                   color: Color(0xFF0A0A0A),
//                                                   fontSize: 12,
//                                                   fontWeight: FontWeight.w400,
//                                                   fontFamily: 'Arial',
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         const SizedBox(height: 16),
//                                         // Mobile Number Field
//                                         Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Container(
//                                               height: 17.5,
//                                               alignment: Alignment.centerLeft,
//                                               child: const Text(
//                                                 'Mobile Number *',
//                                                 style: TextStyle(
//                                                   color: Color(0xFF0A0A0A),
//                                                   fontSize: 12,
//                                                   fontWeight: FontWeight.w400,
//                                                   height: 17.5 / 12,
//                                                   fontFamily: 'Arial',
//                                                 ),
//                                               ),
//                                             ),
//                                             const SizedBox(height: 7),
//                                             Container(
//                                               height: 31.5,
//                                               padding:
//                                                   const EdgeInsets.symmetric(
//                                                     horizontal: 10.5,
//                                                     vertical: 3.5,
//                                                   ),
//                                               decoration: BoxDecoration(
//                                                 color: const Color(0xFFF3F3F5),
//                                                 borderRadius:
//                                                     BorderRadius.circular(6.75),
//                                                 border: Border.all(
//                                                   color: Colors.transparent,
//                                                   width: 1,
//                                                 ),
//                                               ),
//                                               child: Row(
//                                                 children: [
//                                                   SizedBox(
//                                                     width: 14,
//                                                     height: 14,
//                                                     child: CustomPaint(
//                                                       painter:
//                                                           PhoneIconPainter(),
//                                                     ),
//                                                   ),
//                                                   const SizedBox(width: 4),
//                                                   const Text(
//                                                     '+91 98765 43210',
//                                                     style: TextStyle(
//                                                       color: Color(0xFF717182),
//                                                       fontSize: 12,
//                                                       fontWeight:
//                                                           FontWeight.w400,
//                                                       fontFamily: 'Arial',
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         const SizedBox(height: 16),
//                                         // Email Address Field
//                                         Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Container(
//                                               height: 17.5,
//                                               alignment: Alignment.centerLeft,
//                                               child: const Text(
//                                                 'Email Address *',
//                                                 style: TextStyle(
//                                                   color: Color(0xFF0A0A0A),
//                                                   fontSize: 12,
//                                                   fontWeight: FontWeight.w400,
//                                                   height: 17.5 / 12,
//                                                   fontFamily: 'Arial',
//                                                 ),
//                                               ),
//                                             ),
//                                             const SizedBox(height: 7),
//                                             Container(
//                                               height: 31.5,
//                                               padding:
//                                                   const EdgeInsets.symmetric(
//                                                     horizontal: 10.5,
//                                                     vertical: 3.5,
//                                                   ),
//                                               decoration: BoxDecoration(
//                                                 color: const Color(0xFFF3F3F5),
//                                                 borderRadius:
//                                                     BorderRadius.circular(6.75),
//                                                 border: Border.all(
//                                                   color: Colors.transparent,
//                                                   width: 1,
//                                                 ),
//                                               ),
//                                               child: Row(
//                                                 children: [
//                                                   SizedBox(
//                                                     width: 14,
//                                                     height: 14,
//                                                     child: CustomPaint(
//                                                       painter:
//                                                           EmailIconPainter(),
//                                                     ),
//                                                   ),
//                                                   const SizedBox(width: 4),
//                                                   const Text(
//                                                     'your.email@example.com',
//                                                     style: TextStyle(
//                                                       color: Color(0xFF717182),
//                                                       fontSize: 12,
//                                                       fontWeight:
//                                                           FontWeight.w400,
//                                                       fontFamily: 'Arial',
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             // Terms & Agreement Card
//                             Container(
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(12.75),
//                                 border: Border.all(
//                                   color: Colors.black12,
//                                   width: 1,
//                                 ),
//                               ),
//                               child: Container(
//                                 width: double.infinity,
//                                 padding: EdgeInsets.all(
//                                   isSmallScreen ? 12 : 16,
//                                 ),
//                                 child: Column(
//                                   children: [
//                                     // Section Header
//                                     Row(
//                                       children: [
//                                         const Text(
//                                           'Terms & Agreemen t',
//                                           style: TextStyle(
//                                             color: Color(0xFF0A0A0A),
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.w400,
//                                             height: 24 / 16,
//                                             fontFamily: 'Arial',
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     const SizedBox(height: 14),
//                                     // Section Content
//                                     Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         // Checkbox
//                                         GestureDetector(
//                                           onTap: () {
//                                             setState(() {
//                                               _isAgreedToTerms =
//                                                   !_isAgreedToTerms;
//                                             });
//                                           },
//                                           child: Container(
//                                             width: 14,
//                                             height: 14,
//                                             padding: const EdgeInsets.all(1),
//                                             decoration: BoxDecoration(
//                                               color: const Color(0xFF030213),
//                                               borderRadius:
//                                                   BorderRadius.circular(4),
//                                               border: Border.all(
//                                                 color: const Color(0xFF030213),
//                                                 width: 1,
//                                               ),
//                                               boxShadow: [
//                                                 BoxShadow(
//                                                   color: Colors.black12,
//                                                   offset: const Offset(0, 1),
//                                                   blurRadius: 2,
//                                                 ),
//                                               ],
//                                             ),
//                                             child: SizedBox(
//                                               height: 12,
//                                               child: Center(
//                                                 child: SizedBox(
//                                                   width: 12,
//                                                   height: 12,
//                                                   child: CustomPaint(
//                                                     painter: CheckIconPainter(),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         const SizedBox(width: 8),
//                                         // Label
//                                         Expanded(
//                                           child: SizedBox(
//                                             height: 60,
//                                             child: Stack(
//                                               children: [
//                                                 const Positioned(
//                                                   left: 0,
//                                                   top: -2,
//                                                   child: Text(
//                                                     'I agree to the',
//                                                     style: TextStyle(
//                                                       color: Color(0xFF364153),
//                                                       fontSize: 12,
//                                                       fontWeight:
//                                                           FontWeight.w400,
//                                                       height: 20 / 12,
//                                                       fontFamily: 'Arial',
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 const Positioned(
//                                                   left: 78,
//                                                   top: 1,
//                                                   child: Text(
//                                                     'Terms & Conditions',
//                                                     style: TextStyle(
//                                                       color: Color(0xFF155DFC),
//                                                       fontSize: 12,
//                                                       fontWeight:
//                                                           FontWeight.w400,
//                                                       height: 20 / 12,
//                                                       fontFamily: 'Arial',
//                                                       decoration: TextDecoration
//                                                           .underline,
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 const Positioned(
//                                                   left: -2,
//                                                   top: 17,
//                                                   child: SizedBox(
//                                                     width: 275,
//                                                     child: Text(
//                                                       'and confirm that all information provided is accurate. I am the rightful owner of this property. *',
//                                                       style: TextStyle(
//                                                         color: Color(
//                                                           0xFF364153,
//                                                         ),
//                                                         fontSize: 12,
//                                                         fontWeight:
//                                                             FontWeight.w400,
//                                                         height: 20 / 12,
//                                                         fontFamily: 'Arial',
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 18),
//                       // Footer Container
//                       Container(
//                         width: isMediumScreen ? double.infinity : 377,
//                         height: isSmallScreen ? null : 78,
//                         padding: EdgeInsets.only(
//                           left: isSmallScreen ? 12 : 17.5,
//                           right: isSmallScreen ? 12 : 17.5,
//                           top: isSmallScreen ? 12 : 18.5,
//                           bottom: isSmallScreen ? 12 : 0,
//                         ),
//                         decoration: const BoxDecoration(
//                           color: Colors.white,
//                           border: Border(
//                             top: BorderSide(color: Colors.black12, width: 1),
//                           ),
//                         ),
//                         child: isSmallScreen
//                             ? Column(
//                                 children: [
//                                   // Previous Button
//                                   SizedBox(
//                                     width: double.infinity,
//                                     height: 44,
//                                     child: ElevatedButton(
//                                       onPressed: () {
//                                         Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                             builder: (context) {
//                                               return SellPropertySuccessPage();
//                                             },
//                                           ),
//                                         );
//                                       },
//                                       style: ElevatedButton.styleFrom(
//                                         backgroundColor: Colors.white,
//                                         foregroundColor: const Color(
//                                           0xFF0A0A0A,
//                                         ),
//                                         elevation: 0,
//                                         side: BorderSide(
//                                           color: Colors.black12,
//                                           width: 1,
//                                         ),
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.circular(
//                                             6.75,
//                                           ),
//                                         ),
//                                         padding: const EdgeInsets.symmetric(
//                                           horizontal: 14,
//                                           vertical: 7,
//                                         ),
//                                       ),
//                                       child: const Text(
//                                         'Previous',
//                                         style: TextStyle(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w400,
//                                           height: 17.5 / 12,
//                                           fontFamily: 'Arial',
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   const SizedBox(height: 8),
//                                   // Submit Button
//                                   SizedBox(
//                                     width: double.infinity,
//                                     height: 44,
//                                     child: ElevatedButton(
//                                       onPressed: () {
//                                         Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                             builder: (context) {
//                                               return SellPropertySuccessPage();
//                                             },
//                                           ),
//                                         );
//                                       },
//                                       style: ElevatedButton.styleFrom(
//                                         backgroundColor: const Color(
//                                           0xFF00A63E,
//                                         ),
//                                         foregroundColor: Colors.white,
//                                         elevation: 0,
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.circular(
//                                             6.75,
//                                           ),
//                                         ),
//                                         padding: const EdgeInsets.symmetric(
//                                           horizontal: 14,
//                                           vertical: 7,
//                                         ),
//                                       ),
//                                       child: const Text(
//                                         'Submit Property',
//                                         style: TextStyle(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w400,
//                                           height: 17.5 / 12,
//                                           fontFamily: 'Arial',
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               )
//                             : Row(
//                                 children: [
//                                   // Previous Button
//                                   Expanded(
//                                     child: SizedBox(
//                                       height: 42,
//                                       child: ElevatedButton(
//                                         onPressed: () {},
//                                         style: ElevatedButton.styleFrom(
//                                           backgroundColor: Colors.white,
//                                           foregroundColor: const Color(
//                                             0xFF0A0A0A,
//                                           ),
//                                           elevation: 0,
//                                           side: BorderSide(
//                                             color: Colors.black12,
//                                             width: 1,
//                                           ),
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius: BorderRadius.circular(
//                                               6.75,
//                                             ),
//                                           ),
//                                           padding: const EdgeInsets.symmetric(
//                                             horizontal: 14,
//                                             vertical: 7,
//                                           ),
//                                         ),
//                                         child: const Text(
//                                           'Previous',
//                                           style: TextStyle(
//                                             fontSize: 12,
//                                             fontWeight: FontWeight.w400,
//                                             height: 17.5 / 12,
//                                             fontFamily: 'Arial',
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   const SizedBox(width: 10.5),
//                                   // Submit Button
//                                   Expanded(
//                                     child: SizedBox(
//                                       height: 42,
//                                       child: ElevatedButton(
//                                         onPressed: () {},
//                                         style: ElevatedButton.styleFrom(
//                                           backgroundColor: const Color(
//                                             0xFF00A63E,
//                                           ),
//                                           foregroundColor: Colors.white,
//                                           elevation: 0,
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius: BorderRadius.circular(
//                                               6.75,
//                                             ),
//                                           ),
//                                           padding: const EdgeInsets.symmetric(
//                                             horizontal: 14,
//                                             vertical: 7,
//                                           ),
//                                         ),
//                                         child: const Text(
//                                           'Submit Property',
//                                           style: TextStyle(
//                                             fontSize: 12,
//                                             fontWeight: FontWeight.w400,
//                                             height: 17.5 / 12,
//                                             fontFamily: 'Arial',
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Custom painters for icons
// class BackIconPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = const Color(0xFF0A0A0A)
//       ..strokeWidth = 1.16667
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round
//       ..strokeJoin = StrokeJoin.round;

//     final path1 = Path();
//     path1.moveTo(7.5, 11.0837);
//     path1.lineTo(3.41669, 7.00033);
//     path1.lineTo(7.5, 2.91699);

//     final path2 = Path();
//     path2.moveTo(11.5834, 7);
//     path2.lineTo(3.41669, 7);

//     canvas.drawPath(path1, paint);
//     canvas.drawPath(path2, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }

// class UserIconPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = const Color(0xFF155DFC)
//       ..strokeWidth = 1.45833
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round
//       ..strokeJoin = StrokeJoin.round;

//     final path1 = Path();
//     path1.moveTo(14.3541, 15.5625);
//     path1.lineTo(14.3541, 14.1042);
//     path1.cubicTo(14.3541, 13.3306, 14.0469, 12.5888, 13.4999, 12.0418);
//     path1.cubicTo(12.9529, 11.4948, 12.211, 11.1875, 11.4375, 11.1875);
//     path1.lineTo(7.06248, 11.1875);
//     path1.cubicTo(6.28893, 11.1875, 5.54707, 11.4948, 5.00008, 12.0418);
//     path1.cubicTo(4.4531, 12.5888, 4.14581, 13.3306, 4.14581, 14.1042);
//     path1.lineTo(4.14581, 15.5625);

//     final path2 = Path();
//     path2.addOval(
//       Rect.fromCircle(center: const Offset(9.25, 5.35417), radius: 2.91666),
//     );

//     canvas.drawPath(path1, paint);
//     canvas.drawPath(path2, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }

// class PhoneIconPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = const Color(0xFF99A1AF)
//       ..strokeWidth = 1.16667
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round
//       ..strokeJoin = StrokeJoin.round;

//     final path = Path();
//     path.moveTo(8.06869, 9.91499);
//     path.cubicTo(8.18916, 9.97032, 8.32489, 9.98296, 8.45351, 9.95083);
//     path.cubicTo(8.58213, 9.9187, 8.69597, 9.84372, 8.77627, 9.73824);
//     path.lineTo(8.98335, 9.46699);
//     path.cubicTo(9.09203, 9.3221, 9.23294, 9.20449, 9.39494, 9.12349);
//     path.cubicTo(9.55694, 9.0425, 9.73557, 9.00033, 9.91669, 9.00033);
//     path.lineTo(11.6667, 9.00033);
//     path.cubicTo(11.9761, 9.00033, 12.2729, 9.12324, 12.4916, 9.34204);
//     path.cubicTo(12.7104, 9.56083, 12.8334, 9.85757, 12.8334, 10.167);
//     path.lineTo(12.8334, 11.917);
//     path.cubicTo(12.8334, 12.2264, 12.7104, 12.5232, 12.4916, 12.742);
//     path.cubicTo(12.2729, 12.9607, 11.9761, 13.0837, 11.6667, 13.0837);
//     path.cubicTo(8.88191, 13.0837, 6.2112, 11.9774, 4.24207, 10.0083);
//     path.cubicTo(2.27293, 8.03915, 1.16669, 5.36843, 1.16669, 2.58366);
//     path.cubicTo(1.16669, 2.27424, 1.2896, 1.97749, 1.5084, 1.7587);
//     path.cubicTo(1.72719, 1.53991, 2.02393, 1.41699, 2.33335, 1.41699);
//     path.lineTo(4.08335, 1.41699);
//     path.cubicTo(4.39277, 1.41699, 4.68952, 1.53991, 4.90831, 1.7587);
//     path.cubicTo(5.1271, 1.97749, 5.25002, 2.27424, 5.25002, 2.58366);
//     path.lineTo(5.25002, 4.33366);
//     path.cubicTo(5.25002, 4.51478, 5.20785, 4.69341, 5.12685, 4.85541);
//     path.cubicTo(5.04585, 5.01741, 4.92825, 5.15832, 4.78335, 5.26699);
//     path.lineTo(4.51035, 5.47174);
//     path.cubicTo(4.40326, 5.55351, 4.32778, 5.66983, 4.29673, 5.80095);
//     path.cubicTo(4.26568, 5.93206, 4.28098, 6.06988, 4.34002, 6.19099);
//     path.cubicTo(5.13725, 7.81025, 6.44843, 9.11979, 8.06869, 9.91499);
//     path.close();

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }

// class EmailIconPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = const Color(0xFF99A1AF)
//       ..strokeWidth = 1.16667
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round
//       ..strokeJoin = StrokeJoin.round;

//     final path1 = Path();
//     path1.moveTo(12.8334, 4.33301);
//     path1.lineTo(7.5886, 7.67376);
//     path1.cubicTo(7.41063, 7.77713, 7.20847, 7.83158, 7.00265, 7.83158);
//     path1.cubicTo(6.79682, 7.83158, 6.59467, 7.77713, 6.41669, 7.67376);
//     path1.lineTo(1.16669, 4.33301);

//     final path2 = Path();
//     path2.addRRect(
//       RRect.fromRectAndRadius(
//         const Rect.fromLTWH(1.16669, 2.58301, 11.66661, 9.33329),
//         const Radius.circular(1.16667),
//       ),
//     );

//     canvas.drawPath(path1, paint);
//     canvas.drawPath(path2, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }

// class CheckIconPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.white
//       ..strokeWidth = 1.0
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round
//       ..strokeJoin = StrokeJoin.round;

//     final path = Path();
//     path.moveTo(10.5, 3.125);
//     path.lineTo(5, 8.625);
//     path.lineTo(2.5, 6.125);

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }
