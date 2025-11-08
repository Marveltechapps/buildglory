// import 'package:flutter/material.dart';

// class NotificationScreen extends StatelessWidget {
//   const NotificationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Notification")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           spacing: 16,
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 border: Border.all(color: Colors.grey),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   spacing: 8,
//                   children: [
//                     Icon(Icons.home),
//                     Expanded(
//                       child: Column(
//                         spacing: 8,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("Enquiry Updates"),
//                               Text("29/06/2025 @2:27pm"),
//                             ],
//                           ),
//                           Text(
//                             "Agent John has responded to your enquiry for the 2BHK Villa in Sholinganallur.",
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 border: Border.all(color: Colors.grey),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   spacing: 8,
//                   children: [
//                     Icon(Icons.home),
//                     Expanded(
//                       child: Column(
//                         spacing: 8,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("Property Alerts"),
//                               Text("29/06/2025 @2:27pm"),
//                             ],
//                           ),
//                           Text(
//                             "A new 3BHK apartment in OMR, Chennai matches your saved search",
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 border: Border.all(color: Colors.grey),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   spacing: 8,
//                   children: [
//                     Icon(Icons.home),
//                     Expanded(
//                       child: Column(
//                         spacing: 8,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("Enquiry Updates"),
//                               Text("29/06/2025 @2:27pm"),
//                             ],
//                           ),
//                           Text(
//                             "Agent John has responded to your enquiry for the 2BHK Villa in Sholinganallur.",
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 border: Border.all(color: Colors.grey),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   spacing: 8,
//                   children: [
//                     Icon(Icons.home),
//                     Expanded(
//                       child: Column(
//                         spacing: 8,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("Enquiry Updates"),
//                               Text("29/06/2025 @2:27pm"),
//                             ],
//                           ),
//                           Text(
//                             "Agent John has responded to your enquiry for the 2BHK Villa in Sholinganallur.",
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 480),
          width: double.infinity,
          child: Column(
            children: [
              // Header Container
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  border: Border(
                    bottom: BorderSide(color: Color(0xFFF3F4F6), width: 1),
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Container(
                  constraints: const BoxConstraints(minHeight: 32),
                  child: Row(
                    children: [
                      // Back Button
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Image.network(
                            'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/869a3e77f72a8d6c8d9803a59200b52a512ceccc?placeholderIfAbsent=true',
                            width: 14,
                            height: 14,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Title
                      Expanded(
                        child: Container(
                          constraints: const BoxConstraints(minWidth: 240),
                          child: const Text(
                            'Notification',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF101828),
                              letterSpacing: -0.31,
                              height: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Content Container
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0x1A000000),
                        width: 1,
                      ),
                    ),
                    padding: const EdgeInsets.fromLTRB(16, 16, 13, 16),
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 319),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Notification Icon
                          Container(
                            width: 18,
                            height: 18,
                            child: Image.network(
                              'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/af7d196f190988bd7c90fadfb3633b04c7110a7e?placeholderIfAbsent=true',
                              width: 18,
                              height: 18,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(width: 8),
                          // Content
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Header Row with Title and Timestamp
                                Container(
                                  constraints: const BoxConstraints(
                                    minHeight: 18,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Title
                                      Expanded(
                                        child: Container(
                                          height: 18,
                                          child: const Text(
                                            'Enquiry Updates',
                                            style: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFF101828),
                                              height: 1,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                      // Timestamp
                                      Container(
                                        width: 101,
                                        constraints: const BoxConstraints(
                                          minHeight: 14,
                                        ),
                                        child: const Text(
                                          '29/06/2025 @2:27pm',
                                          style: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF6A7282),
                                            height: 1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                // Description
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 1,
                                  ),
                                  child: const Text(
                                    'Agent John has responded to your enquiry for the 2BHK Villa in Sholinganallur.',
                                    style: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF4A5565),
                                      height: 20 / 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
