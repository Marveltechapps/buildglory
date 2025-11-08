import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../api_exports.dart';
import '../bloc/bloc_exports.dart';

/// Property List Widget using BLoC
class PropertyListBlocWidget extends StatelessWidget {
  final String? filterType;
  final void Function(Property)? onPropertyTap;

  const PropertyListBlocWidget({
    super.key,
    this.filterType,
    this.onPropertyTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertyBloc, PropertyState>(
      builder: (context, state) {
        if (state is PropertyLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is PropertyError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 48, color: Colors.red),
                const SizedBox(height: 16),
                Text(
                  state.message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red),
                ),
                if (state.canRetry) ...[
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<PropertyBloc>().add(
                            LoadHomepagePropertiesEvent(type: filterType),
                          );
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ],
            ),
          );
        }

        if (state is PropertiesEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home_outlined, size: 64, color: Colors.grey.shade400),
                const SizedBox(height: 16),
                Text(
                  'No properties found',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          );
        }

        if (state is PropertiesLoaded) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<PropertyBloc>().add(
                    LoadHomepagePropertiesEvent(type: filterType),
                  );
            },
            child: ListView.builder(
              itemCount: state.properties.length,
              itemBuilder: (context, index) {
                final property = state.properties[index];
                return PropertyCardBlocWidget(
                  property: property,
                  onTap: onPropertyTap != null
                      ? () => onPropertyTap!(property)
                      : null,
                );
              },
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}

/// Property Card Widget using BLoC
class PropertyCardBlocWidget extends StatelessWidget {
  final Property property;
  final VoidCallback? onTap;
  final bool showSaveButton;

  const PropertyCardBlocWidget({
    super.key,
    required this.property,
    this.onTap,
    this.showSaveButton = true,
  });

  @override
  Widget build(BuildContext context) {
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
                        BlocListener<PropertyBloc, PropertyState>(
                          listener: (context, state) {
                            if (state is PropertySaved) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Property saved!'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                          },
                          child: IconButton(
                            icon: const Icon(Icons.favorite_border),
                            onPressed: () {
                              if (property.id != null) {
                                context.read<PropertyBloc>().add(
                                      SavePropertyEvent(property.id!),
                                    );
                              }
                            },
                          ),
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

