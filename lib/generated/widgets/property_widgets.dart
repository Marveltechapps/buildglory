import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../api_exports.dart';
import '../providers/api_providers.dart';
import '../providers/property_state_notifier.dart';
import 'async_value_widget.dart';

/// =============================================================================
/// PROPERTY LIST WIDGET
/// =============================================================================

/// Property list widget using Riverpod
class PropertyListWidget extends ConsumerWidget {
  final String? filterType;
  final void Function(Property)? onPropertyTap;

  const PropertyListWidget({
    super.key,
    this.filterType,
    this.onPropertyTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final propertiesAsync = filterType != null
        ? ref.watch(homepagePropertiesProvider(filterType))
        : ref.watch(allPropertiesProvider);

    return AsyncValueWidget<List<Property>>(
      value: propertiesAsync,
      data: (properties) {
        if (properties.isEmpty) {
          return const EmptyState(
            message: 'No properties found',
            icon: Icons.home_outlined,
          );
        }

        return RefreshIndicator(
          onRefresh: () => ref.refresh(allPropertiesProvider.future),
          child: ListView.builder(
            itemCount: properties.length,
            itemBuilder: (context, index) {
              final property = properties[index];
              return PropertyCardWidget(
                property: property,
                onTap: onPropertyTap != null
                    ? () => onPropertyTap!(property)
                    : null,
              );
            },
          ),
        );
      },
    );
  }
}

/// =============================================================================
/// PROPERTY CARD WIDGET
/// =============================================================================

/// Property card widget (Builder.io mappable component)
class PropertyCardWidget extends ConsumerWidget {
  final Property property;
  final VoidCallback? onTap;
  final bool showSaveButton;

  const PropertyCardWidget({
    super.key,
    required this.property,
    this.onTap,
    this.showSaveButton = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Property Image
            if (property.image != null)
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                child: CachedNetworkImage(
                  imageUrl: property.image!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    height: 200,
                    color: Colors.grey.shade200,
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                  errorWidget: (context, url, error) => Container(
                    height: 200,
                    color: Colors.grey.shade300,
                    child: const Icon(Icons.home, size: 64, color: Colors.grey),
                  ),
                ),
              ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Save Button
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          property.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      if (showSaveButton)
                        IconButton(
                          icon: const Icon(Icons.favorite_border),
                          onPressed: () async {
                            if (property.id != null) {
                              final notifier = ref.read(propertyStateProvider.notifier);
                              final success = await notifier.saveProperty(property.id!);
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      success ? 'Property saved!' : 'Failed to save',
                                    ),
                                  ),
                                );
                              }
                            }
                          },
                        ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Price
                  Text(
                    '₹${_formatPrice(property.price)}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade700,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Location
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          '${property.location.locality}, ${property.location.city}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Property Details
                  Row(
                    children: [
                      // Type
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          property.type.value,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blue.shade700,
                          ),
                        ),
                      ),

                      const SizedBox(width: 8),

                      // Layout
                      if (property.layout != null) ...[
                        _DetailChip(
                          icon: Icons.bed,
                          label: '${property.layout!.bedrooms} BHK',
                        ),
                        const SizedBox(width: 8),
                        _DetailChip(
                          icon: Icons.bathtub,
                          label: '${property.layout!.bathrooms} Bath',
                        ),
                      ],

                      // Area
                      if (property.sqft != null) ...[
                        const SizedBox(width: 8),
                        _DetailChip(
                          icon: Icons.square_foot,
                          label: '${property.sqft!.toInt()} sqft',
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatPrice(double price) {
    if (price >= 10000000) {
      return '${(price / 10000000).toStringAsFixed(2)} Cr';
    } else if (price >= 100000) {
      return '${(price / 100000).toStringAsFixed(2)} Lac';
    } else {
      return price.toStringAsFixed(0);
    }
  }
}

class _DetailChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _DetailChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: Colors.grey),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}

/// =============================================================================
/// PROPERTY DETAILS WIDGET
/// =============================================================================

class PropertyDetailsWidget extends ConsumerWidget {
  final String propertyId;

  const PropertyDetailsWidget({
    super.key,
    required this.propertyId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final propertyAsync = ref.watch(propertyByIdProvider(propertyId));

    return AsyncValueWidget<Property?>(
      value: propertyAsync,
      data: (property) {
        if (property == null) {
          return const EmptyState(message: 'Property not found');
        }

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Gallery
              if (property.image != null)
                CachedNetworkImage(
                  imageUrl: property.image!,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      property.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Price
                    Text(
                      '₹${property.price.toStringAsFixed(0)}',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade700,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Location
                    _InfoRow(
                      icon: Icons.location_on,
                      title: 'Location',
                      value: property.location.fullAddress,
                    ),

                    const SizedBox(height: 16),

                    // Layout
                    if (property.layout != null) ...[
                      Row(
                        children: [
                          Expanded(
                            child: _InfoCard(
                              icon: Icons.bed,
                              title: 'Bedrooms',
                              value: '${property.layout!.bedrooms}',
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _InfoCard(
                              icon: Icons.bathtub,
                              title: 'Bathrooms',
                              value: '${property.layout!.bathrooms}',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],

                    // Area
                    if (property.sqft != null)
                      _InfoCard(
                        icon: Icons.square_foot,
                        title: 'Area',
                        value: '${property.sqft!.toInt()} sqft',
                      ),

                    const SizedBox(height: 24),

                    // About
                    if (property.about != null) ...[
                      const Text(
                        'About',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(property.about!),
                      const SizedBox(height: 24),
                    ],

                    // Amenities
                    if (property.amenities != null && property.amenities!.isNotEmpty) ...[
                      const Text(
                        'Amenities',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: property.amenities!
                            .map((amenity) => Chip(label: Text(amenity)))
                            .toList(),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoCard({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, size: 32, color: Colors.blue),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

