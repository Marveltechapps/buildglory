import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/screens/exchange/exchange_matched_property_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExchangePropertyOneSuccfessPage extends StatelessWidget {
  final String propertyType;
  final String configuration;
  final String location;
  final String expectedPrice;
  final String ownerName;
  final String contactNumber;
  final String sellId;

  const ExchangePropertyOneSuccfessPage({
    super.key,
    required this.propertyType,
    required this.configuration,
    required this.location,
    required this.expectedPrice,
    required this.ownerName,
    required this.contactNumber,
    required this.sellId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 480),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Success Icon Container
                  Center(
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE9E8FF),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          tickblueIcon,
                          width: 42,
                          height: 42,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Main Heading
                  const Text(
                    'Just one more step!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF1A1A1A),
                      letterSpacing: -0.42,
                      fontFamily: 'Arial',
                      height: 1.0,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Description Paragraph
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 11),
                    child: const Text(
                      'Great news! Your property is now set for sale. Please start the exchange process.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF4A5565),
                        fontFamily: 'Arial',
                        height: 1.5,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Property Summary Card
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: const BorderSide(
                        color: Color(0x1A000000),
                        width: 1,
                      ),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Card Header
                          Row(
                            children: [
                              SvgPicture.asset(
                                homeblueIcon,
                                width: 18,
                                height: 18,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                'Property Summary',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF1A1A1A),
                                  fontFamily: 'Arial',
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 12),

                          // Property Details
                          Column(
                            children: [
                              _buildPropertyDetailRow(
                                'Property Type:',
                                _safeValue(propertyType),
                                isPrice: false,
                              ),
                              const SizedBox(height: 11),
                              _buildPropertyDetailRow(
                                'Configuration:',
                                _safeValue(configuration),
                                isPrice: false,
                                isUppercase: true,
                              ),
                              const SizedBox(height: 11),
                              _buildPropertyDetailRow(
                                'Location:',
                                _safeValue(location),
                                isPrice: false,
                                isFlexible: true,
                              ),
                              const SizedBox(height: 11),
                              _buildPropertyDetailRow(
                                'Expected Price:',
                                _formatPrice(expectedPrice),
                                isPrice: true,
                              ),
                              const SizedBox(height: 11),
                              _buildPropertyDetailRow(
                                'Owner:',
                                _safeValue(ownerName),
                                isPrice: false,
                              ),
                              const SizedBox(height: 11),
                              _buildPropertyDetailRow(
                                'Contact:',
                                _safeValue(contactNumber),
                                isPrice: false,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Start Exchange Process Button
                  ElevatedButton(
                    onPressed: () {
                      if (sellId.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Unable to start exchange: missing sell reference'),
                            backgroundColor: Colors.orange,
                          ),
                        );
                        return;
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ExchangeMatchedPropertyListScreen(
                              sellId: sellId,
                            );
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF155DFC),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 70,
                        vertical: 10,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          exchangeIcon,
                          color: Colors.white,
                          width: 14,
                          height: 14,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 12),
                        const Flexible(
                          child: Text(
                            'Start Exchange Process',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Arial',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Bottom Spacing
                  const SizedBox(height: 279),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPropertyDetailRow(
    String label,
    String value, {
    bool isPrice = false,
    bool isUppercase = false,
    bool isFlexible = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: isFlexible ? 1 : 0,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFF4A5565),
              fontFamily: 'Arial',
              height: 1.0,
            ),
          ),
        ),
        if (!isFlexible) const Spacer(),
        if (value.isNotEmpty)
          Container(
            alignment: isFlexible
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Text(
              isUppercase ? value.toUpperCase() : value,
              textAlign: isFlexible ? TextAlign.right : TextAlign.left,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: isPrice
                    ? const Color(0xFF00A63E)
                    : const Color(0xFF1A1A1A),
                fontFamily: 'Arial',
                height: 1.0,
              ),
            ),
          ),
      ],
    );
  }

  static String _safeValue(String value) {
    final trimmed = value.trim();
    return trimmed.isEmpty ? '—' : trimmed;
  }

  static String _formatPrice(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty || trimmed == '—') return '—';
    if (trimmed.startsWith('₹')) return trimmed;
    return '₹$trimmed';
  }
}
