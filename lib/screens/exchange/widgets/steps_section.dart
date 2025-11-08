import 'package:flutter/material.dart';

class StepsSection extends StatelessWidget {
  const StepsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(MediaQuery.of(context).size.width > 991 ? 12 : 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Getting Started in 3 Steps',
            style: TextStyle(
              color: const Color(0xFF0A0A0A),
              fontSize: MediaQuery.of(context).size.width <= 640 ? 14 : 16,
              fontWeight: FontWeight.w400,
              height: 24.5/16,
              fontFamily: 'Arial',
            ),
          ),
          const SizedBox(height: 14),
          Column(
            children: [
              _buildStepCard(
                stepNumber: '1',
                title: 'Property Information',
                description: 'Fill in basic details about your property including type, location, size, and specifications.',
                backgroundColor: const Color(0xFFDBEAFE),
                numberBackgroundColor: const Color(0xFF155DFC),
                context: context,
              ),
              const SizedBox(height: 14),
              _buildStepCard(
                stepNumber: '2',
                title: 'Property Photos',
                description: 'Upload high-quality photos of your property to attract potential buyers.',
                backgroundColor: const Color(0xFFDCFCE7),
                numberBackgroundColor: const Color(0xFF00A63E),
                context: context,
              ),
              const SizedBox(height: 14),
              _buildStepCard(
                stepNumber: '3',
                title: 'Review & Submit',
                description: 'Review all information, add contact details, and submit for approval.',
                backgroundColor: const Color(0xFFF3E8FF),
                numberBackgroundColor: const Color(0xFF9810FA),
                context: context,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStepCard({
    required String stepNumber,
    required String title,
    required String description,
    required Color backgroundColor,
    required Color numberBackgroundColor,
    required BuildContext context,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(MediaQuery.of(context).size.width <= 640 ? 12 : 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.75),
        border: Border.all(
          color: Colors.black.withOpacity(0.10),
          width: 1,
        ),
      ),
      child: MediaQuery.of(context).size.width <= 640
          ? Column(
              children: [
                _buildStepIcon(stepNumber, backgroundColor, numberBackgroundColor),
                const SizedBox(height: 12),
                _buildStepContent(title, description, context, true),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildStepIcon(stepNumber, backgroundColor, numberBackgroundColor),
                const SizedBox(width: 14),
                Expanded(
                  child: _buildStepContent(title, description, context, false),
                ),
              ],
            ),
    );
  }

  Widget _buildStepIcon(String stepNumber, Color backgroundColor, Color numberBackgroundColor) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Container(
          width: 21,
          height: 21,
          decoration: BoxDecoration(
            color: numberBackgroundColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text(
              stepNumber,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w400,
                height: 14/11,
                fontFamily: 'Arial',
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStepContent(String title, String description, BuildContext context, bool centered) {
    return Column(
      crossAxisAlignment: centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: centered ? TextAlign.center : TextAlign.start,
          style: const TextStyle(
            color: Color(0xFF0A0A0A),
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 21/14,
            fontFamily: 'Arial',
          ),
        ),
        const SizedBox(height: 7),
        Text(
          description,
          textAlign: centered ? TextAlign.center : TextAlign.start,
          style: const TextStyle(
            color: Color(0xFF4A5565),
            fontSize: 12,
            fontWeight: FontWeight.w400,
            height: 17.5/12,
            fontFamily: 'Arial',
          ),
        ),
      ],
    );
  }
}
