import 'package:flutter/material.dart';

class PlotDetailsScreen extends StatelessWidget {
  const PlotDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildHeroImage(),
                      _buildPropertyDetails(),
                      _buildAboutSection(),
                      _buildPlotDetailsSection(),
                      _buildLocationSection(),
                    ],
                  ),
                ),
              ),
              _buildContactButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFF3F4F6), width: 1)),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(33554400),
            ),
            child: Center(
              child: Image.network(
                'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/3038bb1ddf9beb650970c3ea01ddef873dcb2362?placeholderIfAbsent=true',
                width: 14,
                height: 14,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: const Text(
                'Plot',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A1A),
                  letterSpacing: -0.31,
                  fontFamily: 'Arial',
                ),
              ),
            ),
          ),
          Row(
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(33554400),
                ),
                child: Center(
                  child: Image.network(
                    'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/cf84477c361a6f5a0932211f2242c1ec5cc869df?placeholderIfAbsent=true',
                    width: 14,
                    height: 14,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(33554400),
                ),
                child: Center(
                  child: Image.network(
                    'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/c92e8c83c48baa501f64d5406622f7ddc50d645f?placeholderIfAbsent=true',
                    width: 14,
                    height: 14,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeroImage() {
    return Container(
      width: double.infinity,
      //aspectRatio: 1.683,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/aac34458b1a80032a608f7fb2cd096b04a17b139?placeholderIfAbsent=true',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 187,
            left: 14,
            right: 14,
            bottom: 14,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFDCFCE7),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.transparent),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  child: const Text(
                    'Available',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF016630),
                      fontFamily: 'Arial',
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  height: 21,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(
                        'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/b0feb2240cdee83f73975b9da6f7515640281181?placeholderIfAbsent=true',
                        width: 11,
                        height: 11,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        '1/1',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.white,
                          fontFamily: 'Arial',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPropertyDetails() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '₹1.2 Crores',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A1A),
                        height: 1.4,
                        fontFamily: 'Arial',
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Tech Park Office Complex',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF4A5565),
                        fontFamily: 'Arial',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFEFFFB2),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: const Color(0xFFC3FFBE)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                child: const Text(
                  'Plot',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF00A63E),
                    fontFamily: 'Arial',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Image.network(
                'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/5fcbf6070f2a519e4b82ff2215473053a5946634?placeholderIfAbsent=true',
                width: 18,
                height: 17,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 4),
              const Expanded(
                child: Text(
                  'Chennai Hills, Plot 45',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF6A7282),
                    fontFamily: 'Arial',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildMetricItem(
                'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/733c756cfb3ce7b49509f245a5a32f5e5a34b763?placeholderIfAbsent=true',
                '2,400 sqft',
                'Total Area',
              ),
              _buildMetricItem(
                'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/c677bb9572bdb507d914269cbc3c60bc11aa4f48?placeholderIfAbsent=true',
                'East',
                'Facing',
              ),
              _buildMetricItem(
                'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/5176ab59aabddff4c11606562577c969c31d5ced?placeholderIfAbsent=true',
                'Corner',
                'Plot Type',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetricItem(String iconUrl, String value, String label) {
    return Container(
      width: 101,
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        children: [
          Container(
            height: 18,
            child: Center(
              child: Image.network(
                iconUrl,
                width: 17,
                height: 17,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF1A1A1A),
              fontFamily: 'Arial',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              color: Color(0xFF6A7282),
              fontFamily: 'Arial',
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildAboutSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFF3F4F6), width: 1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          const Text(
            'About this plot',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1A1A1A),
              height: 1.4,
              fontFamily: 'Arial',
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Prime residential plot in IT corridor with excellent connectivity. Perfect for building your dream home near tech parks.',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF4A5565),
              height: 1.625,
              fontFamily: 'Arial',
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildPlotDetailsSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFF3F4F6), width: 1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Plot Details',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1A1A1A),
              height: 1.4,
              fontFamily: 'Arial',
            ),
          ),
          const SizedBox(height: 11),
          Column(
            children: [
              _buildDetailRow('Plot Type', 'Residential Plot'),
              const SizedBox(height: 11),
              _buildDetailRow('Dimensions', '40x60 ft'),
              const SizedBox(height: 11),
              _buildDetailRow('Total Area', '2,400 sqft'),
              const SizedBox(height: 11),
              _buildDetailRow('Facing', 'East facing'),
              const SizedBox(height: 11),
              _buildDetailRow('Plot Category', 'Corner'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF4A5565),
            fontFamily: 'Arial',
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF1A1A1A),
            fontFamily: 'Arial',
          ),
        ),
      ],
    );
  }

  Widget _buildLocationSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Location',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A1A),
                  height: 1.4,
                  fontFamily: 'Arial',
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black.withOpacity(0.1)),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                child: const Text(
                  'View on Map',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF1A1A1A),
                    fontFamily: 'Arial',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            height: 112,
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black.withOpacity(0.1)),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/d77f9e707a833b845e426445cbd1de6927e6e4ed?placeholderIfAbsent=true',
                    fit: BoxFit.cover,
                  ),
                ),
                const Positioned(
                  left: 122,
                  top: 18,
                  child: SizedBox(
                    width: 88,
                    height: 53,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Tap to view map',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF6A7282),
                            fontFamily: 'Arial',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
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

  Widget _buildContactButton() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFF3F4F6), width: 1)),
      ),
      padding: const EdgeInsets.all(16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFF00A63E),
          borderRadius: BorderRadius.circular(33554400),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 10),
              blurRadius: 15,
              spreadRadius: -3,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 119),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/253a639afd2244ba7ad0d02a43d16923e03a9bc5?placeholderIfAbsent=true',
              width: 14,
              height: 14,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 19),
            const Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontFamily: 'Arial',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
