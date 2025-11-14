import 'dart:convert';

import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/final/home/pages/home_main_screen.dart';
import 'package:buildglory/screens/residential/detail/residential_detail_screen.dart';
import 'package:buildglory/screens/residential/models/property.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

class ExchangeMatchedPropertyListScreen extends StatefulWidget {
  final String sellId;

  const ExchangeMatchedPropertyListScreen({
    super.key,
    required this.sellId,
  });

  @override
  State<ExchangeMatchedPropertyListScreen> createState() =>
      _ExchangeMatchedPropertyListScreenState();
}

class _ExchangeMatchedPropertyListScreenState
    extends State<ExchangeMatchedPropertyListScreen> {
  bool _isLoading = true;
  String? _errorMessage;
  Map<String, dynamic>? sellerProperty;
  List<Map<String, dynamic>> matchedProperties = [];
  String? exchangeId;
  String selectedFilter = 'ALL';

  @override
  void initState() {
    super.initState();
    _createExchangeAndFetchMatches();
  }

  Future<void> _createExchangeAndFetchMatches() async {
    if (widget.sellId.isEmpty) {
      setState(() {
        _errorMessage =
            'Missing sell reference. Please try again from the start.';
        _isLoading = false;
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      if (token.isEmpty) {
        throw Exception('Please login again to continue.');
      }

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      // Step 1: Create exchange and receive exchangeId
      final createResponse = await http.post(
        Uri.parse('${baseUrl}api/exchange'),
        headers: headers,
        body: jsonEncode({'sellId': widget.sellId}),
      );

      if (createResponse.statusCode != 200 &&
          createResponse.statusCode != 201) {
        throw Exception(_extractErrorMessage(createResponse.body));
      }

      final createData = jsonDecode(createResponse.body);
      final createdExchangeId = createData['exchangeId'] ?? createData['_id'];

      if (createdExchangeId == null) {
        throw Exception('Exchange ID missing from the server response.');
      }

      // Step 2: Fetch populated exchange details
      final detailsResponse = await http.get(
        Uri.parse('${baseUrl}api/exchange/$createdExchangeId'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (detailsResponse.statusCode != 200) {
        throw Exception(_extractErrorMessage(detailsResponse.body));
      }

      final detailsData = jsonDecode(detailsResponse.body);
      final sellerData = detailsData['sellerProperty'];
      final matches = detailsData['matchedProperties'] ?? [];
      final List<Map<String, dynamic>> parsedMatches = [];
      if (matches is List) {
        for (final item in matches) {
          if (item is Map<String, dynamic>) {
            parsedMatches.add(item);
          }
        }
      }

      setState(() {
        exchangeId = createdExchangeId;
        sellerProperty = sellerData;
        matchedProperties = parsedMatches;
        _isLoading = false;
        selectedFilter = 'ALL';
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString().replaceFirst('Exception: ', '');
        _isLoading = false;
      });
    }
  }

  String _extractErrorMessage(String body) {
    try {
      final data = jsonDecode(body);
      if (data is Map<String, dynamic>) {
        return data['message'] ??
            data['error']?.toString() ??
            'Something went wrong. Please try again.';
      }
    } catch (_) {}
    return body.isNotEmpty ? body : 'Something went wrong. Please try again.';
  }

  void _retry() {
    _createExchangeAndFetchMatches();
  }

  @override
  Widget build(BuildContext context) {
    final subtitleText = _isLoading
        ? 'Fetching matched properties...'
        : '${matchedProperties.length} properties match your exchange';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: ListTile(
          title: Text(
            'Matched Properties',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1A1A1A),
              letterSpacing: -0.35,
              height: 1.4,
              fontFamily: 'Arial',
            ),
          ),
          subtitle: Text(
            subtitleText,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFF6A7282),
              height: 1,
              fontFamily: 'Arial',
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SvgPicture.asset(filterIcon),
          ),
        ],
      ),
      body: Container(
        //  constraints: const BoxConstraints(maxWidth: 377),
        decoration: const BoxDecoration(color: Color(0xFFF9FAFB)),
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_errorMessage != null) {
      return _buildErrorState();
    }

    if (matchedProperties.isEmpty) {
      return _buildEmptyState();
    }

    final properties = _filteredProperties;

    return Column(
      children: [
        _buildSmartMatchingSection(),
        _buildFilterButtons(),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(bottom: 16),
            itemCount: properties.length,
            itemBuilder: (context, index) {
              return _buildPropertyCard(properties[index]);
            },
          ),
        ),
        _buildBrowseMoreButton(),
      ],
    );
  }

  Widget _buildErrorState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 42, color: Colors.redAccent),
            const SizedBox(height: 12),
            Text(
              _errorMessage ?? 'Something went wrong',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF4A5565),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _retry,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF155DFC),
              ),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              filterIcon,
              width: 48,
              height: 48,
              colorFilter:
                  const ColorFilter.mode(Color(0xFF155DFC), BlendMode.srcIn),
            ),
            const SizedBox(height: 12),
            const Text(
              'No matched properties yet.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Once we find suitable matches for your property, they will appear here.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Color(0xFF4A5565),
                height: 1.4,
              ),
            ),
            const SizedBox(height: 16),
            _buildBrowseMoreButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFF3F4F6), width: 1)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildHeaderTop(),
          const SizedBox(height: 12),
          _buildFilterButtons(),
        ],
      ),
    );
  }

  Widget _buildHeaderTop() {
    return SizedBox(
      height: 42,
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: Image.network(
                'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/2494cda384088419a9f640a0e551bc284ef9c193?placeholderIfAbsent=true',
                width: 14,
                height: 14,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Matched Properties',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A1A),
                    letterSpacing: -0.35,
                    height: 1.4,
                    fontFamily: 'Arial',
                  ),
                ),
                const Text(
                  '15 properties match your exchange',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF6A7282),
                    height: 1,
                    fontFamily: 'Arial',
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: Image.network(
                'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/c7f18732e8ef7c6cd1d0afe3e449193582267be1?placeholderIfAbsent=true',
                width: 14,
                height: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButtons() {
    final typeCounts = _typeCounts;
    final filterKeys = ['ALL', ...typeCounts.keys];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: filterKeys
            .map(
              (key) => _buildFilterButton(
                key,
                key == 'ALL'
                    ? 'All (${matchedProperties.length})'
                    : '$key (${typeCounts[key] ?? 0})',
              ),
            )
            .toList(),
      ),
    );
  }

  Map<String, int> get _typeCounts {
    final Map<String, int> counts = {};
    for (final property in matchedProperties) {
      final type = (property['type'] ?? 'Others').toString();
      counts[type] = (counts[type] ?? 0) + 1;
    }
    return counts;
  }

  Widget _buildFilterButton(String key, String label) {
    final isSelected = selectedFilter == key;

    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedFilter = key;
          });
        },
        child: Container(
          height: 28,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isSelected ? const Color(0xFF030213) : Colors.white,
            border: isSelected
                ? null
                : Border.all(color: const Color(0x1A000000), width: 1),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 4),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: isSelected ? Colors.white : const Color(0xFF1A1A1A),
                fontFamily: 'Arial',
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSmartMatchingSection() {
    final propertyLabel = (sellerProperty?['bhkType'] ??
            sellerProperty?['propertyType'] ??
            'your property')
        .toString();
    final location = _sellerLocationText();
    final subtitle = matchedProperties.isEmpty
        ? 'We are preparing exchange matches for your $propertyLabel in $location.'
        : 'These properties are matched based on your $propertyLabel in $location. All owners are open to exchange.';

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: Color(0xFF276AFF)),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0x33FFFFFF),
            ),
            child: Center(
              child: SvgPicture.asset(tickwhiteIcon, width: 21, height: 21),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Smart Matching Active',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    height: 1.4,
                    fontFamily: 'Arial',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    height: 1.5,
                    fontFamily: 'Arial',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _sellerLocationText() {
    final location = sellerProperty?['location'];
    if (location is Map) {
      final locality = (location['locality'] ?? location['fullAddress'] ?? '')
          .toString()
          .trim();
      final city =
          (location['city'] ?? location['state'] ?? '').toString().trim();

      if (locality.isNotEmpty && city.isNotEmpty) {
        return '$locality, $city';
      } else if (locality.isNotEmpty) {
        return locality;
      } else if (city.isNotEmpty) {
        return city;
      }
    }
    return 'your area';
  }

  List<Map<String, dynamic>> get _filteredProperties {
    if (selectedFilter == 'ALL') {
      return matchedProperties;
    }
    return matchedProperties
        .where((property) =>
            (property['type'] ?? '').toString().toUpperCase() ==
            selectedFilter.toUpperCase())
        .toList();
  }

  Widget _buildPropertyCard(Map<String, dynamic> property) {
    final imageUrl = _getImageUrl(property);
    final status = (property['status'] ?? 'For Exchange').toString();
    final priceLabel = _formatPrice(property['price']);
    final title =
        (property['title'] ?? property['name'] ?? 'Property').toString();
    final type = (property['type'] ?? 'Property').toString();
    final location = _formatLocation(property['location']);
    final bedrooms = _toInt(property['layout']?['bedrooms']);
    final bathrooms = _toInt(property['layout']?['bathrooms']);
    final sqft = _toInt(property['sqft']);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, 1),
              blurRadius: 3,
            ),
          ],
        ),
        child: Column(
          children: [
            _buildPropertyImage(imageUrl, status),
            _buildPropertyDetailsSection(
              priceLabel: priceLabel,
              title: title,
              type: type,
              location: location,
              bedrooms: bedrooms,
              bathrooms: bathrooms,
              sqft: sqft,
              property: property,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPropertyImage(String imageUrl, String status) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.network(
              imageUrl,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                color: Colors.grey.shade200,
                child: const Icon(Icons.image_not_supported_outlined),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: const Color(0xFF155DFC),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      child: Text(
                        status,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontFamily: 'Arial',
                        ),
                      ),
                    ),
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: const Color(0xE6FFFFFF),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(0, 1),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          heartblackIcon,
                          width: 14,
                          height: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPropertyDetailsSection({
    required String priceLabel,
    required String title,
    required String type,
    required String location,
    required int bedrooms,
    required int bathrooms,
    required int sqft,
    required Map<String, dynamic> property,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      priceLabel,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A1A),
                        height: 1.4,
                        fontFamily: 'Arial',
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF4A5565),
                        height: 1,
                        fontFamily: 'Arial',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                child: Text(
                  type,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF4A5565),
                    height: 1,
                    fontFamily: 'Arial',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              SvgPicture.asset(locationgreyIcon, width: 18, height: 18),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  location,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF6A7282),
                    height: 1,
                    fontFamily: 'Arial',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildAmenityPill(
                icon: bedIcon,
                label: bedrooms > 0 ? '$bedrooms Bed' : 'N/A',
              ),
              _buildAmenityPill(
                icon: bathIcon,
                label: bathrooms > 0 ? '$bathrooms Bath' : 'N/A',
              ),
              _buildAmenityPill(
                icon: squarefeetIcon,
                label: sqft > 0 ? '$sqft sqft' : '—',
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Color(0xFFF3F4F6), width: 1),
              ),
            ),
            padding: const EdgeInsets.only(top: 12),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'By',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF6A7282),
                      height: 1,
                      fontFamily: 'Arial',
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => _openPropertyDetail(property),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: const Color(0xFF155DFC),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 6,
                    ),
                    child: const Text(
                      'View Details',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontFamily: 'Arial',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAmenityPill({required String icon, required String label}) {
    return Expanded(
      child: Row(
        children: [
          SvgPicture.asset(icon, width: 18, height: 17),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFF4A5565),
              height: 1,
              fontFamily: 'Arial',
            ),
          ),
        ],
      ),
    );
  }

  String _getImageUrl(Map<String, dynamic> property) {
    final image = property['image'] ?? property['imageUrl'];
    if (image is String && image.isNotEmpty) return image;

    final imageUrls = property['imageURLs'];
    if (imageUrls is List && imageUrls.isNotEmpty) {
      final first = imageUrls.first;
      if (first is String && first.isNotEmpty) return first;
    }
    return 'https://images.unsplash.com/photo-1505691938895-1758d7feb511?auto=format&fit=crop&w=800&q=60';
  }

  String _formatLocation(dynamic location) {
    if (location is Map) {
      final locality = (location['locality'] ?? location['fullAddress'] ?? '')
          .toString()
          .trim();
      final city =
          (location['city'] ?? location['state'] ?? '').toString().trim();

      if (locality.isNotEmpty && city.isNotEmpty) {
        return '$locality, $city';
      } else if (locality.isNotEmpty) {
        return locality;
      } else if (city.isNotEmpty) {
        return city;
      }
    } else if (location is String && location.isNotEmpty) {
      return location;
    }
    return '—';
  }

  String _formatPrice(dynamic value) {
    if (value == null) return '₹—';
    double amount;
    if (value is int) {
      amount = value.toDouble();
    } else if (value is double) {
      amount = value;
    } else if (value is String) {
      final sanitized = value.replaceAll(RegExp(r'[^0-9.]'), '');
      amount = double.tryParse(sanitized) ?? 0;
    } else {
      amount = 0;
    }

    if (amount >= 10000000) {
      return '₹${(amount / 10000000).toStringAsFixed(2)} Cr';
    } else if (amount >= 100000) {
      return '₹${(amount / 100000).toStringAsFixed(2)} L';
    }
    return '₹${amount.toStringAsFixed(0)}';
  }

  int _toInt(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    if (value is double) return value.round();
    if (value is String) return int.tryParse(value) ?? 0;
    return 0;
  }

  void _openPropertyDetail(Map<String, dynamic> property) {
    final imageUrl = _getImageUrl(property);
    final status = (property['status'] ?? 'For Exchange').toString();
    final price = _formatPrice(property['price']);
    final title =
        (property['title'] ?? property['name'] ?? 'Property').toString();
    final type = (property['type'] ?? 'Property').toString();
    final location = _formatLocation(property['location']);
    final bedrooms = _toInt(property['layout']?['bedrooms']);
    final bathrooms = _toInt(property['layout']?['bathrooms']);
    final sqft = _toInt(property['sqft']);
    final description =
        (property['about'] ?? 'No description provided.').toString();
    final builtYear = (property['builtYear'] ??
            property['createdAt']?.toString().split('T').first ??
            '—')
        .toString();
    final amenities = property['amenities'];

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return ResidentialDetailScreen(
            property: Property(
              id: property['_id']?.toString() ?? '',
              imageUrl: imageUrl,
              status: status,
              price: price,
              name: title,
              type: type,
              location: location,
              bedrooms: bedrooms,
              bathrooms: bathrooms,
              sqft: sqft,
              description: description,
              builtYear: builtYear,
              features: amenities is List
                  ? amenities.map((e) => e.toString()).toList()
                  : [],
            ),
            colorcode: "0xFF155DFC",
            properytype: "Exchange",
            title: "$type Details",
          );
        },
      ),
    );
  }

  Widget _buildBrowseMoreButton() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(20),
      child: ElevatedButton(
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
          backgroundColor: const Color(0xFF030213),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          elevation: 0,
        ),
        child: const Text(
          'Browse More Properties',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.white,
            height: 2,
            fontFamily: 'Arial',
          ),
        ),
      ),
    );
  }
}
