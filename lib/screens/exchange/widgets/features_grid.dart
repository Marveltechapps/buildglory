import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeaturesGrid extends StatelessWidget {
  const FeaturesGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Why List With Us?',
          style: TextStyle(
            color: const Color(0xFF0A0A0A),
            fontSize: MediaQuery.of(context).size.width <= 640 ? 14 : 16,
            fontWeight: FontWeight.w400,
            height: 24.5/16,
            fontFamily: 'Arial',
          ),
        ),
        const SizedBox(height: 14),
        MediaQuery.of(context).size.width <= 640
            ? Column(
                children: [
                  _buildFeatureCard(
                    icon: _buildCheckIcon(),
                    title: 'Free Listing',
                    description: 'No charges for listing',
                    context: context,
                  ),
                  const SizedBox(height: 12),
                  _buildFeatureCard(
                    icon: _buildUserIcon(),
                    title: 'Expert Support',
                    description: 'Dedicated assistance',
                    context: context,
                  ),
                  const SizedBox(height: 12),
                  _buildFeatureCard(
                    icon: _buildCameraIcon(),
                    title: 'Photo Quality',
                    description: 'Professional photos',
                    context: context,
                  ),
                  const SizedBox(height: 12),
                  _buildFeatureCard(
                    icon: _buildClockIcon(),
                    title: 'Quick Process',
                    description: 'Fast approval',
                    context: context,
                  ),
                ],
              )
            : GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 1.2,
                children: [
                  _buildFeatureCard(
                    icon: _buildCheckIcon(),
                    title: 'Free Listing',
                    description: 'No charges for listing',
                    context: context,
                  ),
                  _buildFeatureCard(
                    icon: _buildUserIcon(),
                    title: 'Expert Support',
                    description: 'Dedicated assistance',
                    context: context,
                  ),
                  _buildFeatureCard(
                    icon: _buildCameraIcon(),
                    title: 'Photo Quality',
                    description: 'Professional photos',
                    context: context,
                  ),
                  _buildFeatureCard(
                    icon: _buildClockIcon(),
                    title: 'Quick Process',
                    description: 'Fast approval',
                    context: context,
                  ),
                ],
              ),
      ],
    );
  }

  Widget _buildFeatureCard({
    required Widget icon,
    required String title,
    required String description,
    required BuildContext context,
  }) {
    return Container(
      height: MediaQuery.of(context).size.width <= 640 ? 120 : null,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.75),
        border: Border.all(
          color: Colors.black.withOpacity(0.10),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(height: 28),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF0A0A0A),
              fontSize: 12,
              fontWeight: FontWeight.w400,
              height: 17.5/12,
              fontFamily: 'Arial',
            ),
          ),
          const SizedBox(height: 24),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF4A5565),
              fontSize: 11,
              fontWeight: FontWeight.w400,
              height: 14/11,
              fontFamily: 'Arial',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckIcon() {
    return SvgPicture.string(
      '''<svg width="28" height="28" viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M25.4345 11.6664C25.9673 14.2813 25.5876 16.9997 24.3587 19.3685C23.1297 21.7373 21.1259 23.6131 18.6813 24.6833C16.2367 25.7534 13.4991 25.9532 10.925 25.2492C8.35096 24.5452 6.09605 22.98 4.53632 20.8147C2.97658 18.6494 2.2063 16.0149 2.35394 13.3504C2.50157 10.6859 3.55819 8.15252 5.34759 6.17278C7.13699 4.19304 9.55101 2.88658 12.1871 2.47127C14.8231 2.05597 17.5219 2.55691 19.8333 3.89058" stroke="#00A63E" stroke-width="2.33333" stroke-linecap="round" stroke-linejoin="round"/>
        <path d="M10.5 12.8337L14 16.3337L25.6667 4.66699" stroke="#00A63E" stroke-width="2.33333" stroke-linecap="round" stroke-linejoin="round"/>
      </svg>''',
      width: 28,
      height: 28,
    );
  }

  Widget _buildUserIcon() {
    return SvgPicture.string(
      '''<svg width="28" height="28" viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M22.1666 24.5V22.1667C22.1666 20.929 21.675 19.742 20.7998 18.8668C19.9246 17.9917 18.7377 17.5 17.5 17.5H10.5C9.2623 17.5 8.07532 17.9917 7.20015 18.8668C6.32498 19.742 5.83331 20.929 5.83331 22.1667V24.5" stroke="#155DFC" stroke-width="2.33333" stroke-linecap="round" stroke-linejoin="round"/>
        <path d="M14 12.8333C16.5773 12.8333 18.6666 10.744 18.6666 8.16667C18.6666 5.58934 16.5773 3.5 14 3.5C11.4227 3.5 9.33331 5.58934 9.33331 8.16667C9.33331 10.744 11.4227 12.8333 14 12.8333Z" stroke="#155DFC" stroke-width="2.33333" stroke-linecap="round" stroke-linejoin="round"/>
      </svg>''',
      width: 28,
      height: 28,
    );
  }

  Widget _buildCameraIcon() {
    return SvgPicture.string(
      '''<svg width="28" height="28" viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M16.3299 4.66699C16.7508 4.66699 17.1639 4.78084 17.5254 4.9965C17.8869 5.21216 18.1833 5.52158 18.3832 5.89199L18.9502 6.94199C19.1501 7.3124 19.4466 7.62183 19.808 7.83748C20.1695 8.05314 20.5826 8.167 21.0035 8.16699H23.3334C23.9522 8.16699 24.5457 8.41282 24.9833 8.85041C25.4209 9.28799 25.6667 9.88149 25.6667 10.5003V21.0003C25.6667 21.6192 25.4209 22.2127 24.9833 22.6502C24.5457 23.0878 23.9522 23.3337 23.3334 23.3337H4.66671C4.04787 23.3337 3.45438 23.0878 3.01679 22.6502C2.57921 22.2127 2.33337 21.6192 2.33337 21.0003V10.5003C2.33337 9.88149 2.57921 9.28799 3.01679 8.85041C3.45438 8.41282 4.04787 8.16699 4.66671 8.16699H6.99654C7.41703 8.16702 7.82972 8.05341 8.19095 7.83819C8.55219 7.62296 8.84855 7.31412 9.04871 6.94433L9.61921 5.88966C9.81936 5.51986 10.1157 5.21102 10.477 4.9958C10.8382 4.78058 11.2509 4.66697 11.6714 4.66699H16.3299Z" stroke="#9810FA" stroke-width="2.33333" stroke-linecap="round" stroke-linejoin="round"/>
        <path d="M14 18.667C15.933 18.667 17.5 17.1 17.5 15.167C17.5 13.234 15.933 11.667 14 11.667C12.067 11.667 10.5 13.234 10.5 15.167C10.5 17.1 12.067 18.667 14 18.667Z" stroke="#9810FA" stroke-width="2.33333" stroke-linecap="round" stroke-linejoin="round"/>
      </svg>''',
      width: 28,
      height: 28,
    );
  }

  Widget _buildClockIcon() {
    return SvgPicture.string(
      '''<svg width="28" height="28" viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M14 7V14L18.6667 16.3333" stroke="#F54900" stroke-width="2.33333" stroke-linecap="round" stroke-linejoin="round"/>
        <path d="M14 25.6663C20.4433 25.6663 25.6666 20.443 25.6666 13.9997C25.6666 7.55635 20.4433 2.33301 14 2.33301C7.55666 2.33301 2.33331 7.55635 2.33331 13.9997C2.33331 20.443 7.55666 25.6663 14 25.6663Z" stroke="#F54900" stroke-width="2.33333" stroke-linecap="round" stroke-linejoin="round"/>
      </svg>''',
      width: 28,
      height: 28,
    );
  }
}
