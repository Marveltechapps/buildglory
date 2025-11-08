import 'package:buildglory/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrganicHomesScreen extends StatelessWidget {
  const OrganicHomesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Column(
            children: [
              _buildHeader(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 12, 16),
                    child: Column(
                      children: [
                        _buildStatisticsCard(),
                        const SizedBox(height: 16),
                        _buildSearchSection(),
                        const SizedBox(height: 16),
                        _buildPropertyCard(),
                        const SizedBox(height: 16),
                        _buildBenefitsCard(),
                      ],
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

  Widget _buildHeader(context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFECFDF5),
        border: Border(bottom: BorderSide(color: Color(0xFFF3F4F6), width: 1)),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Organic Homes',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A1A),
                    letterSpacing: -0.35,
                    height: 1.4,
                  ),
                ),
                const Text(
                  'Sustainable Living Solutions',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF6A7282),
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatisticsCard() {
    return Container(
      width: double.infinity,
      //constraints: const BoxConstraints(maxWidth: 349),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFF009966),
        border: Border.all(color: const Color(0x1A000000)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: const Color(0x33FFFFFF),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    leafgreenIcon,
                    width: 21,
                    height: 21,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sustainable Living',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        letterSpacing: -0.16,
                        height: 2,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Eco-friendly homes for a better tomorrow',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFD0FAE5),
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatItem('3', 'Eco Homes'),
                  _buildStatItem('90%', 'Energy Savings'),
                  _buildStatItem('100%', 'Certified Green'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w400,
            color: Colors.white,
            height: 1,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w400,
            color: Color(0xFFD0FAE5),
            height: 1,
          ),
        ),
      ],
    );
  }

  Widget _buildSearchSection() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFFE5E7EB)),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      searchgreyIcon,
                      width: 14,
                      height: 14,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Search sustainable homes...',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 34,
              height: 28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                border: Border.all(color: const Color(0x1A000000)),
              ),
              child: Center(
                child: SvgPicture.asset(
                  filterblackIcon,
                  width: 14,
                  height: 14,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 11),
        SingleChildScrollView(
          child: Row(
            children: [
              _buildFilterButton('All Homes (3)', false),
              const SizedBox(width: 8),
              _buildFilterButton('Solar Powered (2)', false),
              const SizedBox(width: 8),
              _buildFilterButton('Smart Homes', true),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFilterButton(String text, bool isSelected) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isSelected ? const Color(0xFF009966) : Colors.white,
        border: Border.all(color: const Color(0x1A000000)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 4),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: isSelected ? Colors.white : const Color(0xFF1A1A1A),
        ),
      ),
    );
  }

  Widget _buildPropertyCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 1),
            blurRadius: 3,
          ),
        ],
        border: Border.all(color: const Color(0x1A000000)),
      ),
      child: Column(
        children: [
          Container(
            height: 168,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              image: const DecorationImage(
                image: NetworkImage(
                  'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/56734a3ea12872664c29209566a6f9b1b04e8a39?placeholderIfAbsent=true',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(11),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _buildBadge(
                        'Green Score: 95',
                        const Color(0xFF009966),
                        true,
                      ),
                      const SizedBox(width: 8),
                      _buildBadge('A+ Energy', const Color(0xFF00C950), false),
                    ],
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xE6FFFFFF),
                      ),
                      child: Center(
                        child: Image.network(
                          'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/e6766077cf06b197a5f8299eee706a9a9f2de4e7?placeholderIfAbsent=true',
                          width: 14,
                          height: 14,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
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
                          const Text(
                            'EcoVilla Green Paradise',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF101828),
                              height: 2,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              SvgPicture.asset(
                                locationgreyIcon,
                                width: 14,
                                height: 14,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(width: 4),
                              const Text(
                                'ECR, Chennai',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF4A5565),
                                  height: 1,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            '₹1.8 Crores',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF009966),
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: const Color(0x1A000000)),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 3,
                      ),
                      child: const Text(
                        'Eco Villa',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF1A1A1A),
                          height: 1,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 13),
                Row(
                  children: [
                    Expanded(
                      child: _buildPropertyDetail('4 BR', homeblackIcon),
                    ),
                    Expanded(
                      child: _buildPropertyDetail('3 BA', apartmentblackIcon),
                    ),
                    Expanded(
                      child: _buildPropertyDetail('3,200 sqft', scaleIcon),
                    ),
                  ],
                ),
                const SizedBox(height: 13),
                Row(
                  children: [
                    SvgPicture.asset(
                      treeIcon,
                      width: 14,
                      height: 14,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Eco Features:',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF364153),
                        height: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 7),
                Row(
                  children: [
                    _buildEcoFeatureBadge('Solar Power'),
                    const SizedBox(width: 8),
                    _buildEcoFeatureBadge('Organic Materials'),
                  ],
                ),
                const SizedBox(height: 13),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          recyclegreenIcon,
                          width: 14,
                          height: 14,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Carbon Impact:',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF364153),
                            height: 1,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Net Zero',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF009966),
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          stargoldIcon,
                          width: 14,
                          height: 14,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          'Certified',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF4A5565),
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 13),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: const Color(0xFFA4F4CF)),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        singletickIcon,
                        width: 11,
                        height: 11,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'IGBC Platinum',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF007A55),
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 13),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xFF009966),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 7,
                  ),
                  child: const Center(
                    child: Text(
                      'View Details',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
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

  Widget _buildBadge(String text, Color backgroundColor, bool hasIcon) {
    return Container(
      height: 22,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: backgroundColor,
        border: Border.all(color: Colors.transparent),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (hasIcon) ...[
            SvgPicture.asset(
              leafgreenIcon,
              width: 11,
              height: 11,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 7),
          ],
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.white,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPropertyDetail(String text, String iconUrl) {
    return Row(
      children: [
        SvgPicture.asset(iconUrl, width: 14, height: 14, fit: BoxFit.contain),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xFF4A5565),
            height: 1,
          ),
        ),
      ],
    );
  }

  Widget _buildEcoFeatureBadge(String text) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: const Color(0xFFECFDF5),
        border: Border.all(color: Colors.transparent),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Color(0xFF007A55),
          height: 1,
        ),
      ),
    );
  }

  Widget _buildBenefitsCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFFF0FDF4),
        border: Border.all(color: const Color(0xFFB9F8CF)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text(
            'Why Choose Organic Homes?',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFF101828),
              height: 2,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 7),
          const Text(
            'Building a sustainable future, one home at a time',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFF4A5565),
              height: 1,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: _buildBenefitItem(
                      'Energy Efficient',
                      'Up to 90% savings',
                      sungreenIcon,
                      const Color(0xFFD0FAE5),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildBenefitItem(
                      'Water Conservation',
                      'Smart recycling',
                      dropblueIcon,
                      const Color(0xFFDBEAFE),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildBenefitItem(
                      'Clean Air',
                      'Natural ventilation',
                      airgreenIcon,
                      const Color(0xFFDCFCE7),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildBenefitItem(
                      'Self-Sustaining',
                      'Off-grid capable',
                      batteryIcon,
                      const Color(0xFFF3E8FF),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBenefitItem(
    String title,
    String subtitle,
    String iconUrl,
    Color backgroundColor,
  ) {
    return Row(
      children: [
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: backgroundColor,
          ),
          child: Center(
            child: SvgPicture.asset(
              iconUrl,
              width: 17,
              height: 17,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF101828),
                  height: 1,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF4A5565),
                  height: 1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
