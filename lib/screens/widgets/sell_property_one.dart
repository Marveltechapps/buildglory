// import 'package:buildglory/constant/constant.dart';
// import 'package:buildglory/new/presentation/profile/widgets/custom_input_field.dart';
// import 'package:buildglory/screens/widgets/sell_property_two.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class SellPropertyOne extends StatefulWidget {
//   const SellPropertyOne({super.key});

//   @override
//   State<SellPropertyOne> createState() => _SellPropertyFormPageState();
// }

// class _SellPropertyFormPageState extends State<SellPropertyOne> {
//   String selectedAdvertisementType = 'Sale';
//   String selectedPropertyType = 'Apartment';
//   String selectedBhkType = '2 BHK';
//   String selectedCity = 'Chennai';
//   final TextEditingController builtUpAreaController = TextEditingController(
//     text: '1000',
//   );
//   final TextEditingController carpetAreaController = TextEditingController(
//     text: '1000',
//   );
//   final TextEditingController localityController = TextEditingController(
//     text: 'asda',
//   );
//   final TextEditingController projectController = TextEditingController(
//     text: 'asd',
//   );
//   TextEditingController cityController = TextEditingController();
//   TextEditingController bhktypeController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF9FAFB),
//       body: SafeArea(
//         child: Container(
//           constraints: const BoxConstraints(maxWidth: 480),
//           child: Column(
//             children: [
//               // Header Section
//               Container(
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   border: Border(
//                     bottom: BorderSide(color: Color(0xFFF3F4F6), width: 1),
//                   ),
//                 ),
//                 padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Header with back button and title
//                     SizedBox(
//                       height: 42,
//                       child: Row(
//                         children: [
//                           Container(
//                             width: 35,
//                             height: 35,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(33554400),
//                             ),
//                             child: Center(
//                               child: IconButton(
//                                 onPressed: () {
//                                   Navigator.pop(context);
//                                 },
//                                 icon: Icon(Icons.arrow_back),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 16),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 const Text(
//                                   'Property Details',
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w400,
//                                     color: Color(0xFF1A1A1A),
//                                     letterSpacing: -0.35,
//                                     height: 1.4,
//                                   ),
//                                 ),
//                                 const Text(
//                                   'Step 1 of 4',
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     color: Color(0xFF4A5565),
//                                     height: 1,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     // Progress bar
//                     Container(
//                       height: 7,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(33554400),
//                         color: const Color(0xFFE5E7EB),
//                       ),
//                       child: Row(
//                         children: [
//                           Expanded(
//                             flex: 1,
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(33554400),
//                                 color: const Color(0xFF155DFC),
//                               ),
//                             ),
//                           ),
//                           const Expanded(flex: 3, child: SizedBox()),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // Form Content
//               Expanded(
//                 child: SingleChildScrollView(
//                   padding: const EdgeInsets.all(16),
//                   child: Column(
//                     children: [
//                       // Property Advertisement Card
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(12),
//                           color: Colors.white,
//                           border: Border.all(
//                             color: const Color(0x1A000000),
//                             width: 1,
//                           ),
//                         ),
//                         padding: const EdgeInsets.fromLTRB(16, 15, 16, 15),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                               'Property Advertisem ent *',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 color: Color(0xFF1A1A1A),
//                                 height: 1.4,
//                               ),
//                             ),
//                             const SizedBox(height: 14),
//                             Row(
//                               children: [
//                                 Expanded(
//                                   child: GestureDetector(
//                                     onTap: () {
//                                       setState(() {
//                                         selectedAdvertisementType = 'Sale';
//                                       });
//                                     },
//                                     child: Container(
//                                       height: 40,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(8),
//                                         color:
//                                             selectedAdvertisementType == 'Sale'
//                                             ? const Color(0xFF030213)
//                                             : Colors.white,
//                                         border:
//                                             selectedAdvertisementType != 'Sale'
//                                             ? Border.all(
//                                                 color: const Color(0x1A000000),
//                                                 width: 1,
//                                               )
//                                             : null,
//                                       ),
//                                       child: Center(
//                                         child: Text(
//                                           'Sale',
//                                           style: TextStyle(
//                                             fontSize: 14,
//                                             color:
//                                                 selectedAdvertisementType ==
//                                                     'Sale'
//                                                 ? Colors.white
//                                                 : const Color(0xFF1A1A1A),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(width: 12),
//                                 Expanded(
//                                   child: GestureDetector(
//                                     onTap: () {
//                                       setState(() {
//                                         selectedAdvertisementType =
//                                             'Rent/Lease';
//                                       });
//                                     },
//                                     child: Container(
//                                       height: 40,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(8),
//                                         color:
//                                             selectedAdvertisementType ==
//                                                 'Rent/Lease'
//                                             ? const Color(0xFF030213)
//                                             : Colors.white,
//                                         border:
//                                             selectedAdvertisementType !=
//                                                 'Rent/Lease'
//                                             ? Border.all(
//                                                 color: const Color(0x1A000000),
//                                                 width: 1,
//                                               )
//                                             : null,
//                                       ),
//                                       child: Center(
//                                         child: Text(
//                                           'Rent/Lease',
//                                           style: TextStyle(
//                                             fontSize: 14,
//                                             color:
//                                                 selectedAdvertisementType ==
//                                                     'Rent/Lease'
//                                                 ? Colors.white
//                                                 : const Color(0xFF1A1A1A),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 21),
//                       // Property Type Card
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(12),
//                           color: Colors.white,
//                           border: Border.all(
//                             color: const Color(0x1A000000),
//                             width: 1,
//                           ),
//                         ),
//                         padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                               'Property Type *',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 color: Color(0xFF1A1A1A),
//                                 height: 1.4,
//                               ),
//                             ),
//                             const SizedBox(height: 14),
//                             Column(
//                               children: [
//                                 Row(
//                                   children: [
//                                     Expanded(
//                                       child: _buildPropertyTypeButton(
//                                         'Apartment',
//                                         apartmentwhiteIcon,
//                                         selectedPropertyType == 'Apartment',
//                                       ),
//                                     ),
//                                     const SizedBox(width: 12),
//                                     Expanded(
//                                       child: _buildPropertyTypeButton(
//                                         'Independent House',
//                                         homewhiteIcon,
//                                         selectedPropertyType ==
//                                             'Independent House',
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(height: 14),
//                                 Row(
//                                   children: [
//                                     Expanded(
//                                       child: _buildPropertyTypeButton(
//                                         'Villa',
//                                         homeblackIcon,
//                                         selectedPropertyType == 'Villa',
//                                       ),
//                                     ),
//                                     const SizedBox(width: 12),
//                                     Expanded(
//                                       child: _buildPropertyTypeButton(
//                                         'Plot/Land',
//                                         locationblackIcon,
//                                         selectedPropertyType == 'Plot/Land',
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 21),
//                       // Property Configuration Card
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(12),
//                           color: Colors.white,
//                           border: Border.all(
//                             color: const Color(0x1A000000),
//                             width: 1,
//                           ),
//                         ),
//                         padding: const EdgeInsets.all(16),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                               'Property Configuration',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 color: Color(0xFF1A1A1A),
//                                 height: 1.4,
//                               ),
//                             ),
//                             const SizedBox(height: 12),
//                             // BHK Type Dropdown
//                             CustomInputField(
//                               label: 'BHK Type *',
//                               placeholder: '- SELECT -',
//                               readonly: true,
//                               controller: bhktypeController,
//                             ),
//                             const SizedBox(height: 14),
//                             // Area inputs
//                             Row(
//                               children: [
//                                 Expanded(
//                                   child: CustomInputField(
//                                     label: 'Build Up Area',
//                                     placeholder: '1000 sq ft',
//                                     controller: builtUpAreaController,
//                                   ),
//                                 ),
//                                 const SizedBox(width: 12),
//                                 Expanded(
//                                   child: CustomInputField(
//                                     label: 'Carpet Area',
//                                     placeholder: '1000 sq ft',
//                                     controller: carpetAreaController,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 21),
//                       // Location Details Card
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(12),
//                           color: Colors.white,
//                           border: Border.all(
//                             color: const Color(0x1A000000),
//                             width: 1,
//                           ),
//                         ),
//                         padding: const EdgeInsets.all(16),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                               'Location Details *',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 color: Color(0xFF1A1A1A),
//                                 height: 1.4,
//                               ),
//                             ),
//                             const SizedBox(height: 12),
//                             // City Dropdown
//                             CustomInputField(
//                               label: 'City *',
//                               placeholder: '- SELECT -',
//                               readonly: true,
//                               controller: cityController,
//                             ),
//                             const SizedBox(height: 12),
//                             // Locality Input
//                             CustomInputField(
//                               label: 'Locality *',
//                               placeholder: '',
//                               controller: localityController,
//                             ),
//                             const SizedBox(height: 12),
//                             // Project/Society Name Input
//                             CustomInputField(
//                               label: 'Project / Society Name',
//                               placeholder: '',
//                               controller: projectController,
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       // Continue Button
//                       SizedBox(
//                         width: double.infinity,
//                         height: 42,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) {
//                                   return SellPropertyTwo();
//                                 },
//                               ),
//                             );
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xFF155DFC),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             elevation: 0,
//                           ),
//                           child: const Text(
//                             'Continue',
//                             style: TextStyle(fontSize: 14, color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildPropertyTypeButton(
//     String label,
//     String iconUrl,
//     bool isSelected,
//   ) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedPropertyType = label;
//         });
//       },
//       child: Container(
//         height: 60,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8),
//           color: isSelected ? const Color(0xFF030213) : Colors.white,
//           border: !isSelected
//               ? Border.all(color: const Color(0x1A000000), width: 1)
//               : null,
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SvgPicture.asset(
//               iconUrl,
//               width: 14,
//               height: 14,
//               fit: BoxFit.contain,

//               color: isSelected ? Colors.white : const Color(0xFF1A1A1A),
//             ),
//             const SizedBox(height: 4),
//             Text(
//               label,
//               style: TextStyle(
//                 fontSize: 11,
//                 color: isSelected ? Colors.white : const Color(0xFF1A1A1A),
//                 height: 1,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     builtUpAreaController.dispose();
//     carpetAreaController.dispose();
//     localityController.dispose();
//     projectController.dispose();
//     super.dispose();
//   }
// }
