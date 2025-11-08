import 'package:flutter/material.dart';

class DownloadCtaCard extends StatelessWidget {
  const DownloadCtaCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        gradient: const LinearGradient(
          colors: [Color(0xFF155DFC), Color(0xFF1447E6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Image.network(
            'https://api.builder.io/api/v1/image/assets/TEMP/5a7907960abe1f502cb8ec771ab08026c0bffb3d?placeholderIfAbsent=true&apiKey=06096b941d4746ae854b71463e363371',
            width: 42,
            height: 42,
          ),
          const SizedBox(height: 12),
          const Text(
            'Complete Market Report',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.white,
              fontFamily: 'Arial',
              height: 2,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 13),
            child: Text(
              'Get the full 25-page detailed analysis with charts, data tables, and investment recommendations.',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.white,
                fontFamily: 'Arial',
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Colors.white,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(
                  'https://api.builder.io/api/v1/image/assets/TEMP/892ee0f64ba29e47aff0d7c4a946679298c90b1d?placeholderIfAbsent=true&apiKey=06096b941d4746ae854b71463e363371',
                  width: 14,
                  height: 14,
                ),
                const SizedBox(width: 14),
                const Text(
                  'Download Full Report (PDF)',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF155DFC),
                    fontFamily: 'Arial',
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
}
