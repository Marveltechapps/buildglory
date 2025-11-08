import 'package:flutter/material.dart';

class ReportHeader extends StatelessWidget {
  const ReportHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFF3F4F6),
            width: 1,
          ),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
                    'https://api.builder.io/api/v1/image/assets/TEMP/93de1636f413b68d1b120a34df81a7e3b7651e03?placeholderIfAbsent=true&apiKey=06096b941d4746ae854b71463e363371',
                    width: 14,
                    height: 14,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              const Text(
                'Report',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF0A0A0A),
                  fontFamily: 'Arial',
                  height: 1.4,
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: const Color(0xFF155DFC),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: Row(
              children: [
                Image.network(
                  'https://api.builder.io/api/v1/image/assets/TEMP/b1881c674634349b80d0376d9d1f9c9720526c52?placeholderIfAbsent=true&apiKey=06096b941d4746ae854b71463e363371',
                  width: 14,
                  height: 14,
                ),
                const SizedBox(width: 13),
                const Text(
                  'Download',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
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
