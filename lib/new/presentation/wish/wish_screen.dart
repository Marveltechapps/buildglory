import 'dart:convert';

import 'package:buildglory/constant/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:buildglory/new/presentation/home/bloc/home_bloc.dart';
import 'package:buildglory/new/presentation/home/bloc/home_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class WishScreen extends StatefulWidget {
  const WishScreen({super.key});

  @override
  State<WishScreen> createState() => _WishScreenState();
}

class _WishScreenState extends State<WishScreen> {
  bool _isLoading = false;
  String? _errorMessage;
  List<Map<String, dynamic>> _savedProperties = [];
  String? _token;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _token = prefs.getString('token') ?? token;
    });
    await _fetchSavedProperties();
  }

  Widget _buildFeatureRow({required String icon, required String label}) {
    return Row(
      children: [
        SvgPicture.asset(icon, width: 16, height: 16),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF4A5565),
          ),
        ),
      ],
    );
  }

  String _formatIndianAmount(num amount) {
    if (amount >= 10000000) {
      return '₹ ${(amount / 10000000).toStringAsFixed(2)} Cr';
    } else if (amount >= 100000) {
      return '₹ ${(amount / 100000).toStringAsFixed(2)} Lakh';
    } else if (amount >= 1000) {
      return '₹ ${(amount / 1000).toStringAsFixed(2)} K';
    }
    return '₹ ${amount.toStringAsFixed(0)}';
  }

  List<String> _extractAmenities(Map<String, dynamic> property) {
    final amenities = property['amenities'];
    if (amenities is List && amenities.isNotEmpty) {
      return amenities.map((e) => e.toString()).take(4).toList();
    }
    return ['Amenities info'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Container(
          color: const Color(0xFFFFFFFF),
          constraints: const BoxConstraints(maxWidth: 480),
          width: double.infinity,
          child: Column(
            children: [
              // Header Container
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xFFE5E7EB), width: 1),
                  ),
                ),
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: Container(
                  constraints: const BoxConstraints(minHeight: 28),
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'My Wishlist',
                    style: TextStyle(
                      color: Color(0xFF1A1A1A),
                      fontSize: 21,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Arial',
                      letterSpacing: -0.42,
                      height: 1,
                    ),
                  ),
                ),
              ),
              // Main Content Container
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  child: _buildContent(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_errorMessage != null) {
      return _buildErrorState();
    }

    if (_savedProperties.isEmpty) {
      return _buildEmptyState(context);
    }

    return ListView.builder(
      itemCount: _savedProperties.length,
      itemBuilder: (_, index) {
        final property = _savedProperties[index];
        return _buildPropertyTile(property);
      },
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
              color: Color(0xFF6A7282),
              fontSize: 14,
              fontFamily: 'Arial',
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: _fetchSavedProperties,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: const BoxDecoration(
            color: Color(0xFFF3F4F6),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset(
              filtergreyIcon,
              width: 28,
              height: 28,
            ),
          ),
        ),
        const SizedBox(height: 14),
        const Text(
          'No Saved Properties',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF102840),
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: 'Arial',
            letterSpacing: -0.16,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Save properties you\'re interested in to compare them and contact agents later.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF6A7282),
            fontSize: 12,
            fontFamily: 'Arial',
            height: 1.4,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              context.read<HomeBloc>().add(
                    NavigateEvent(selectedIndex: 0),
                  );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF030213),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10),
            ),
            child: const Text('Browse Properties'),
          ),
        ),
      ],
    );
  }

  Widget _buildPropertyTile(Map<String, dynamic> property) {
    final propertyId =
        property['_id']?.toString() ?? property['id']?.toString();
    final title = property['title'] ?? property['name'] ?? 'Property';
    final imageUrl = property['image'] ??
        'https://images.unsplash.com/photo-1505691938895-1758d7feb511?auto=format&fit=crop&w=800&q=60';
    final type = property['type'] ?? 'Property';
    final price = property['price'];
    final sqft = property['sqft'];
    final bedrooms =
        property['layout'] is Map ? property['layout']['bedrooms'] : null;
    final bathrooms =
        property['layout'] is Map ? property['layout']['bathrooms'] : null;
    final amenities = _extractAmenities(property);
    final location = _formatLocation(property['location']);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    cacheKey: propertyId ?? imageUrl,
                    placeholder: (context, url) => Container(
                      color: Colors.grey.shade200,
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: Colors.grey.shade300,
                      child: const Icon(Icons.broken_image_outlined),
                    ),
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 12,
                  left: 12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFF155DFC),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        child: const Text(
                          'For Sale',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Arial',
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(0.9),
                        ),
                        child: Center(
                            child:
                                Icon(Icons.favorite, color: Colors.redAccent)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
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
                            price != null
                                ? _formatIndianAmount(
                                    price is num
                                        ? price
                                        : num.tryParse('$price') ?? 0,
                                  )
                                : '₹ —',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF4A5565),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: const Color(0xFFE5E7EB)),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 3,
                      ),
                      child: Text(
                        type,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF4A5565),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    SvgPicture.asset(locationgreyIcon, width: 18, height: 18),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        location,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF6A7282),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _buildFeatureRow(
                        icon: bedIcon,
                        label: bedrooms != null ? '$bedrooms Bed' : '—',
                      ),
                    ),
                    Expanded(
                      child: _buildFeatureRow(
                        icon: bathIcon,
                        label: bathrooms != null ? '$bathrooms Bath' : '—',
                      ),
                    ),
                    Expanded(
                      child: _buildFeatureRow(
                        icon: squarefeetIcon,
                        label: sqft != null ? '$sqft sqft' : '—',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: amenities
                      .map(
                        (amenity) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF3F3F5),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            amenity,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF0A0A0A),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'By BuildGlory',
                        style: const TextStyle(
                          fontSize: 11,
                          color: Color(0xFF6A7282),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline,
                          color: Colors.redAccent),
                      onPressed: () => _removeProperty(propertyId ?? ''),
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

  String _formatLocation(dynamic location) {
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

  Future<void> _fetchSavedProperties() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final uri = Uri.parse('${baseUrl}api/saved/');
      final authToken = _token ?? token;
      final response = await http.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $authToken',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List<String> ids = [];

        if (data is List) {
          ids = data.whereType<String>().toList();
        } else if (data is Map<String, dynamic> && data['properties'] is List) {
          ids = (data['properties'] as List)
              .map((entry) => entry is Map<String, dynamic>
                  ? entry['propertyId']?.toString()
                  : entry?.toString())
              .whereType<String>()
              .toList();
        }

        if (ids.isEmpty) {
          setState(() {
            _savedProperties = [];
          });
        } else {
          await _fetchPropertyDetails(ids);
        }
      } else {
        throw Exception('Failed to load wishlist');
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

  Future<void> _removeProperty(String propertyId) async {
    if (propertyId.isEmpty) return;
    setState(() => _isLoading = true);

    try {
      final uri = Uri.parse('${baseUrl}api/saved/remove');
      final authToken = _token ?? token;
      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $authToken',
        },
        body: jsonEncode({'propertyId': propertyId}),
      );

      if (response.statusCode == 200) {
        await _fetchSavedProperties();
      } else {
        throw Exception('Failed to remove property');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = e.toString();
      });
    }
  }

  Future<void> _fetchPropertyDetails(List<String> ids) async {
    try {
      final uri = Uri.parse('${baseUrl}api/properties');
      final response = await http.get(
        uri,
        headers: const {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        List<Map<String, dynamic>> catalogue;
        if (data is List) {
          catalogue = data.whereType<Map<String, dynamic>>().toList();
        } else if (data is Map<String, dynamic>) {
          final list = data['properties'] ??
              data['data'] ??
              data['results'] ??
              data['list'];
          if (list is List) {
            catalogue = list.whereType<Map<String, dynamic>>().toList();
          } else {
            throw Exception('Unexpected properties response');
          }
        } else {
          throw Exception('Unexpected properties response');
        }

        final filtered = catalogue.where((property) {
          final propertyId =
              property['_id']?.toString() ?? property['id']?.toString();
          return propertyId != null && ids.contains(propertyId);
        }).toList();

        setState(() {
          _savedProperties = filtered;
        });
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
}
