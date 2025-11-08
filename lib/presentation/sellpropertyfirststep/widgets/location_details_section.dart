import 'package:flutter/material.dart';

class LocationDetailsSection extends StatelessWidget {
  final String selectedCity;
  final String locality;
  final String projectName;
  final Function(String) onCityChanged;
  final Function(String) onLocalityChanged;
  final Function(String) onProjectNameChanged;

  const LocationDetailsSection({
    Key? key,
    required this.selectedCity,
    required this.locality,
    required this.projectName,
    required this.onCityChanged,
    required this.onLocalityChanged,
    required this.onProjectNameChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Location Details *',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFF0A0A0A),
            ),
          ),
          const SizedBox(height: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'City *',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF0A0A0A),
                  height: 1.0,
                ),
              ),
              const SizedBox(height: 7),
              GestureDetector(
                onTap: () {
                  // Handle city selection
                },
                child: Container(
                  height: 32,
                  padding: const EdgeInsets.symmetric(horizontal: 11),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: const Color(0xFFF3F3F5),
                    border: Border.all(color: Colors.transparent),
                  ),
                  child: Row(
                    children: [
                      Text(
                        selectedCity,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF0A0A0A),
                          height: 1.0,
                        ),
                      ),
                      const Spacer(),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Locality *',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF0A0A0A),
                  height: 1.0,
                ),
              ),
              const SizedBox(height: 7),
              Container(
                height: 32,
                padding: const EdgeInsets.symmetric(
                  horizontal: 11,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: const Color(0xFFF3F3F5),
                  border: Border.all(color: Colors.transparent),
                ),
                child: TextFormField(
                  initialValue: locality,
                  onChanged: onLocalityChanged,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF0A0A0A),
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    isDense: true,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Project/Society Name',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF0A0A0A),
                  height: 1.0,
                ),
              ),
              const SizedBox(height: 7),
              Container(
                height: 32,
                padding: const EdgeInsets.symmetric(
                  horizontal: 11,
                  vertical: 9,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: const Color(0xFFF3F3F5),
                  border: Border.all(color: Colors.transparent),
                ),
                child: TextFormField(
                  initialValue: projectName.isEmpty ? null : projectName,
                  onChanged: onProjectNameChanged,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF0A0A0A),
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    isDense: true,
                    hintText: 'Enter project name (Optional)',
                    hintStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF717182),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
