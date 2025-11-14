import 'dart:convert';

import 'package:buildglory/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

import 'filter_dropdown.dart';
import 'property_card.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _propertyTypes = [
    'All types',
    'Apartment',
    'Villa',
    'Plot',
    'Commercial',
  ];

  final List<_PriceRange> _priceRanges = [
    const _PriceRange(label: 'All Prices'),
    const _PriceRange(label: '₹5L - ₹50L', min: 500000, max: 5000000),
    const _PriceRange(label: '₹50L - ₹1.5Cr', min: 5000000, max: 15000000),
    const _PriceRange(label: '₹1.5Cr - ₹3Cr', min: 15000000, max: 30000000),
    const _PriceRange(label: '₹3Cr - ₹5Cr', min: 30000000, max: 50000000),
  ];

  String _selectedType = 'All types';
  _PriceRange _selectedPriceRange = const _PriceRange(label: 'All Prices');
  bool _isLoading = false;
  String? _errorMessage;
  List<Map<String, dynamic>> _properties = [];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _fetchProperties();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          // constraints: const BoxConstraints(maxWidth: 377),
          child: Column(
            children: [
              // Header Section
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(color: Color(0xFFF3F4F6), width: 1),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(16, 16, 12, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    SizedBox(
                      width: double.infinity,
                      child: const Text(
                        'Explore Properties',
                        style: TextStyle(
                          fontSize: 21,
                          color: Color(0xFF1A1A1A),
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.42,
                          height: 1,
                          fontFamily: 'Arial',
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Search Bar
                    Container(
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0xFFE5E7EB),
                          width: 1,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            searchgreyIcon,
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: Text(
                              'Search by location or address...',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF1A1A1A),
                                fontFamily: 'Arial',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Filter Buttons
                    Row(
                      children: [
                        FilterDropdown(
                          label: _selectedType,
                          onTap: _showTypeSelector,
                        ),
                        const SizedBox(width: 14),
                        FilterDropdown(
                          label: _selectedPriceRange.label,
                          onTap: _showPriceSelector,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Content Section
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(14, 14, 14, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Results Count
                      Text(
                        'Found ${_properties.length} properties',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF4A5565),
                          fontFamily: 'Arial',
                          height: 1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: _isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : _errorMessage != null
                                ? _buildErrorState()
                                : _properties.isEmpty
                                    ? _buildEmptyState()
                                    : SingleChildScrollView(
                                        child: Column(
                                          children: _properties
                                              .map(
                                                (property) => PropertyCard(
                                                  imageUrl:
                                                      _extractImage(property),
                                                  price: _formatPrice(
                                                      property['price']),
                                                  title: _stringVal(
                                                        property['title'],
                                                      ) ??
                                                      _stringVal(
                                                        property['name'],
                                                      ) ??
                                                      '—',
                                                  location: _extractLocation(
                                                      property),
                                                  bedrooms: _formatBedroomText(
                                                      property),
                                                  bathrooms:
                                                      _formatBathroomText(
                                                          property),
                                                  area:
                                                      _formatAreaText(property),
                                                  propertyType: _stringVal(
                                                        property['type'],
                                                      ) ??
                                                      'Property',
                                                  amenities: _extractAmenities(
                                                      property),
                                                  isForSale: _boolVal(
                                                    property['isForSale'],
                                                    defaultValue: true,
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                        ),
                                      ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildErrorState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: Colors.redAccent, size: 32),
          const SizedBox(height: 8),
          Text(
            _errorMessage ?? 'Something went wrong',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF4A5565),
              fontFamily: 'Arial',
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: _fetchProperties,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF155DFC),
            ),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Text(
        'No properties found for the selected filters.',
        style: TextStyle(
          fontSize: 14,
          color: Color(0xFF4A5565),
          fontFamily: 'Arial',
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  void _showTypeSelector() {
    showModalBottomSheet(
      context: context,
      builder: (_) => _buildSelectionSheet(
        title: 'Select Property Type',
        options: _propertyTypes,
        selectedValue: _selectedType,
        onSelected: (value) {
          Navigator.pop(context);
          setState(() {
            _selectedType = value;
          });
          _fetchProperties();
        },
      ),
    );
  }

  void _showPriceSelector() {
    showModalBottomSheet(
      context: context,
      builder: (_) => _buildSelectionSheet(
        title: 'Select Price Range',
        options: _priceRanges.map((e) => e.label).toList(),
        selectedValue: _selectedPriceRange.label,
        onSelected: (value) {
          Navigator.pop(context);
          setState(() {
            _selectedPriceRange =
                _priceRanges.firstWhere((element) => element.label == value);
          });
          _fetchProperties();
        },
      ),
    );
  }

  Widget _buildSelectionSheet({
    required String title,
    required List<String> options,
    required String selectedValue,
    required ValueChanged<String> onSelected,
  }) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'Arial',
            ),
          ),
          const SizedBox(height: 12),
          ...options.map((option) {
            final isSelected = option == selectedValue;
            return ListTile(
              title: Text(option),
              trailing: isSelected
                  ? const Icon(Icons.check, color: Color(0xFF155DFC))
                  : null,
              onTap: () => onSelected(option),
            );
          }).toList(),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Future<void> _fetchProperties() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final queryParams = <String, String>{};
      if (_selectedType != 'All types') {
        queryParams['type'] = _selectedType;
      }
      if (_selectedPriceRange.min != null) {
        queryParams['minPrice'] = _selectedPriceRange.min.toString();
      }
      if (_selectedPriceRange.max != null) {
        queryParams['maxPrice'] = _selectedPriceRange.max.toString();
      }

      final uri = Uri.parse('${baseUrl}api/explore').replace(
        queryParameters: queryParams.isEmpty ? null : queryParams,
      );
      final response = await http.get(
        uri,
        headers: const {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data is Map<String, dynamic> && data['properties'] is List) {
          setState(() {
            _properties = (data['properties'] as List)
                .whereType<Map<String, dynamic>>()
                .toList();
          });
        } else if (data is List) {
          setState(() {
            _properties = data.whereType<Map<String, dynamic>>().toList();
          });
        } else {
          throw Exception('Unexpected response format');
        }
      } else {
        throw Exception('Failed to load properties');
      }
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  String _formatPrice(dynamic price) {
    if (price == null) return '₹ —';
    double value;
    if (price is int) {
      value = price.toDouble();
    } else if (price is double) {
      value = price;
    } else if (price is String) {
      value = double.tryParse(price) ?? 0;
    } else {
      value = 0;
    }

    if (value >= 10000000) {
      return '₹ ${(value / 10000000).toStringAsFixed(2)} Cr';
    } else if (value >= 100000) {
      return '₹ ${(value / 100000).toStringAsFixed(2)} L';
    }
    return '₹ ${value.toStringAsFixed(0)}';
  }

  String _extractLocation(Map<String, dynamic> property) {
    final location = property['location'];
    if (location is Map<String, dynamic>) {
      final locality = location['locality'] ?? location['address'] ?? '';
      final city = location['city'] ?? '';
      if (locality.toString().isNotEmpty && city.toString().isNotEmpty) {
        return '$locality, $city';
      }
      return locality.toString().isNotEmpty ? locality : city.toString();
    }
    if (location is String) return location;
    return '—';
  }

  String _formatBedroomText(Map<String, dynamic> property) {
    final layout = property['layout'];
    final bedrooms = layout is Map<String, dynamic> ? layout['bedrooms'] : null;
    if (bedrooms == null) return '—';
    return '$bedrooms Bed';
  }

  String _formatBathroomText(Map<String, dynamic> property) {
    final layout = property['layout'];
    final bathrooms =
        layout is Map<String, dynamic> ? layout['bathrooms'] : null;
    if (bathrooms == null) return '—';
    return '$bathrooms Bath';
  }

  String _formatAreaText(Map<String, dynamic> property) {
    final sqft = property['sqft'];
    if (sqft == null) return '—';
    return '$sqft sqft';
  }

  List<String> _extractAmenities(Map<String, dynamic> property) {
    final amenities = property['amenities'];
    if (amenities is List) {
      final list = amenities.map((e) => e.toString()).toList();
      return list.isEmpty ? ['Amenities info'] : list;
    }
    return ['Amenities info'];
  }

  bool _boolVal(dynamic value, {bool defaultValue = false}) {
    if (value is bool) return value;
    if (value is String) return value.toLowerCase() == 'true';
    return defaultValue;
  }

  String? _stringVal(dynamic value) {
    if (value == null) return null;
    return value.toString();
  }

  String _extractImage(Map<String, dynamic> property) {
    final imageUrl = property['image'] ??
        property['imageUrl'] ??
        (property['imageURLs'] is List && property['imageURLs'].isNotEmpty
            ? property['imageURLs'][0]
            : null);
    return imageUrl?.toString() ??
        'https://images.unsplash.com/photo-1505691938895-1758d7feb511?auto=format&fit=crop&w=800&q=60';
  }
}

class _PriceRange {
  final String label;
  final int? min;
  final int? max;

  const _PriceRange({
    required this.label,
    this.min,
    this.max,
  });
}
