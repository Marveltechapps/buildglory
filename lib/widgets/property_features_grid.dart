import 'package:flutter/material.dart';
import 'property_feature_card.dart';

class PropertyFeaturesGrid extends StatelessWidget {
  final int bedrooms;
  final int bathrooms;
  final String squareFootage;
  final String acres;

  const PropertyFeaturesGrid({
    Key? key,
    this.bedrooms = 4,
    this.bathrooms = 3,
    this.squareFootage = '2,850',
    this.acres = '0.25',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount;
        double maxWidth;
        double spacing;

        if (constraints.maxWidth <= 640) {
          // Mobile: 1 column
          crossAxisCount = 1;
          maxWidth = 300;
          spacing = 12;
        } else if (constraints.maxWidth <= 991) {
          // Tablet: 2 columns
          crossAxisCount = 2;
          maxWidth = 500;
          spacing = 14;
        } else {
          // Desktop: 4 columns
          crossAxisCount = 4;
          maxWidth = 318;
          spacing = 14;
        }

        return Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: spacing,
              crossAxisSpacing: spacing,
              childAspectRatio: constraints.maxWidth <= 640 ? 250 / 126 : 76 / 126,
              children: [
                _buildBedroomCard(),
                _buildBathroomCard(),
                _buildSquareFootageCard(),
                _buildAcresCard(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBedroomCard() {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 640) {
          return Container(
            width: double.infinity,
            height: 126,
            constraints: const BoxConstraints(maxWidth: 250),
            margin: const EdgeInsets.symmetric(horizontal: 0),
            child: PropertyFeatureCard(
              iconSvg: 'bedroom',
              value: bedrooms.toString(),
              label: 'Bedrooms',
            ),
          );
        }
        return PropertyFeatureCard(
          iconSvg: 'bedroom',
          value: bedrooms.toString(),
          label: 'Bedrooms',
        );
      },
    );
  }

  Widget _buildBathroomCard() {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 640) {
          return Container(
            width: double.infinity,
            height: 126,
            constraints: const BoxConstraints(maxWidth: 250),
            margin: const EdgeInsets.symmetric(horizontal: 0),
            child: PropertyFeatureCard(
              iconSvg: 'bathroom',
              value: bathrooms.toString(),
              label: 'Bathrooms',
            ),
          );
        }
        return PropertyFeatureCard(
          iconSvg: 'bathroom',
          value: bathrooms.toString(),
          label: 'Bathrooms',
        );
      },
    );
  }

  Widget _buildSquareFootageCard() {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 640) {
          return Container(
            width: double.infinity,
            height: 126,
            constraints: const BoxConstraints(maxWidth: 250),
            margin: const EdgeInsets.symmetric(horizontal: 0),
            child: PropertyFeatureCard(
              iconSvg: 'square',
              value: squareFootage,
              label: 'Sq ft',
            ),
          );
        }
        return PropertyFeatureCard(
          iconSvg: 'square',
          value: squareFootage,
          label: 'Sq ft',
        );
      },
    );
  }

  Widget _buildAcresCard() {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 640) {
          return Container(
            width: double.infinity,
            height: 126,
            constraints: const BoxConstraints(maxWidth: 250),
            margin: const EdgeInsets.symmetric(horizontal: 0),
            child: PropertyFeatureCard(
              iconSvg: 'tree',
              value: '$acres\nacres',
              label: 'Acres',
            ),
          );
        }
        return PropertyFeatureCard(
          iconSvg: 'tree',
          value: '$acres\nacres',
          label: 'Acres',
        );
      },
    );
  }
}
