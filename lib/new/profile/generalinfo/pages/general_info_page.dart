import 'package:buildglory/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/page_header.dart';
import '../widgets/info_card.dart';
import '../widgets/contact_row.dart';

class GeneralInfoPage extends StatelessWidget {
  const GeneralInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Column(
            children: [
              const PageHeader(
                title: "General Info",
                subtitle: "Updated August 08, 2024",
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),
                  child: Column(
                    children: [
                      InfoCard(
                        title: "Construction",
                        content:
                            "All structures including the Houses, Terms of Use (\"Terms\") govern your use of the Built Glory web site. By accessing or using the Built Glory web site (the \"Site\"), you agree to be bound by these Terms. If you do not agree with these Terms, you may not use the Site.",
                      ),
                      const SizedBox(height: 20),
                      InfoCard(
                        title: "Resident Information",
                        content:
                            "As you use certain features of the app, you may need to create an account. Registration may allow you to access and use of certain products and services that may not otherwise be available to unregistered users.",
                        children: [
                          const SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Amenities",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF101828),
                                  height: 1,
                                  fontFamily: 'Arial',
                                ),
                              ),
                              const SizedBox(height: 12),
                              const Text(
                                "Mention the name of your app property or anything you promised to deliver may apply. We do not guarantee the accuracy of the information received from unregistered sources.",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF4A5565),
                                  height: 1.67,
                                  fontFamily: 'Arial',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      InfoCard(
                        title: "Area of the map",
                        content: "",
                        icon: SvgPicture.asset(
                          locationblueIcon,
                          width: 14,
                          height: 14,
                        ),
                        children: [
                          SizedBox(
                            //  height: 97,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 18,
                                  child: const Text(
                                    "• Playground area",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF4A5565),
                                      height: 1,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 7),
                                const Text(
                                  "• Our Store is at the top level for family provisions with a mix of general needs and essential",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF4A5565),
                                    height: 1.42,
                                    fontFamily: 'Arial',
                                  ),
                                ),
                                const SizedBox(height: 7),
                                const Text(
                                  "• Swimming pool, spa and gym for registered Built Glory Residents families",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF4A5565),
                                    height: 1.42,
                                    fontFamily: 'Arial',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      InfoCard(
                        title: "Copyright",
                        content:
                            "The Built Glory web site and all content, material and features contained on it including, but not limited to, text, graphics, logos, images and other content (\"Content\") is owned by the app without any prior written consent.",
                        icon: SvgPicture.asset(
                          locationblueIcon,
                          width: 14,
                          height: 14,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.black.withOpacity(0.1),
                      ),
                      const SizedBox(height: 20),
                      InfoCard(
                        title: "Emergency Contacts",
                        content: "",
                        icon: SvgPicture.asset(
                          locationblueIcon,
                          width: 14,
                          height: 14,
                        ),
                        children: [
                          SizedBox(
                            height: 117,
                            child: Column(
                              children: [
                                const ContactRow(
                                  label: "Fire Department Contact",
                                  value: "101",
                                ),
                                const SizedBox(height: 11),
                                const ContactRow(
                                  label: "Police Department",
                                  value: "100",
                                ),
                                const SizedBox(height: 11),
                                const ContactRow(
                                  label: "Medical Emergency",
                                  value: "108",
                                ),
                                const SizedBox(height: 11),
                                const ContactRow(
                                  label: "Built Glory Residence Contact",
                                  value: "+91 98765 43210",
                                  valueColor: Color(0xFF155DFC),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      InfoCard(
                        title: "Sharing and Selling",
                        content:
                            "New departments, listed, certified through our any companies, for legality of products, pricing, Users are responsible for verifying the details of properties, Terms and conditions apply.",
                      ),
                      const SizedBox(height: 20),
                      InfoCard(
                        title: "Smart Technology",
                        content:
                            "All residences have included smart technology throughout including integrated and handle all aspects of the transaction, including login and user accounts.",
                      ),
                      const SizedBox(height: 20),
                      InfoCard(
                        title: "Terms and Conditions",
                        content:
                            "These Terms may be updated or modified by the app from time to time and such changes will take effect on the date specified in the revised Terms. Your continued use of the app after such date shall constitute your acceptance of the new Terms.",
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: const Offset(0, 1),
                              blurRadius: 3,
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Intellectual Property",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF101828),
                                height: 2,
                                fontFamily: 'Arial',
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              "All content of this application is and remains the exclusive rights, logos, and patents are owned by Building our business Solutions any copying shall be an breach/violation of the intellectual property policy/our trust and all copyright goes to the residential authority to make any changes.",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF4A5565),
                                height: 1.67,
                                fontFamily: 'Arial',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      InfoCard(
                        title: "Disclaimers",
                        content:
                            "Terms and conditions policy doesn't limit or exclude any guarantee, warranty, representation or condition which cannot be excluded or limited by law, including the Australian Consumer Law. Built Glory may be unable damage to any future service provided by law. Buildings and/or may be liable to distribute any physical, emotional, special, incidental damages.",
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.black.withOpacity(0.1),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: const Offset(0, 1),
                              blurRadius: 3,
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  locationblueIcon,
                                  width: 14,
                                  height: 14,
                                ),
                                const SizedBox(width: 7),
                                const Expanded(
                                  child: Text(
                                    "Contact US",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF101828),
                                      height: 2,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              "If you have any questions or concerns about our Privacy and Cookies Policy, please get in touch with us.",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF4A5565),
                                height: 1.67,
                                fontFamily: 'Arial',
                              ),
                            ),
                            const SizedBox(height: 12),
                            Column(
                              children: [
                                ContactInfoRow(
                                  icon: SvgPicture.asset(
                                    locationblueIcon,
                                    width: 14,
                                    height: 14,
                                  ),
                                  title: "Phone Number",
                                  value: "+91 98765 43210",
                                ),
                                const SizedBox(height: 12),
                                ContactInfoRow(
                                  icon: SvgPicture.asset(
                                    locationblueIcon,
                                    width: 14,
                                    height: 14,
                                  ),
                                  title: "Email Address",
                                  value: "info@buildglory.com",
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 11,
                                      height: 12,
                                      child: SvgPicture.asset(
                                        locationblueIcon,
                                        width: 11,
                                        height: 12,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 18,
                                            child: const Text(
                                              "Office Address",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFF101828),
                                                height: 1,
                                                fontFamily: 'Arial',
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 1,
                                            ),
                                            child: const Text(
                                              "Built Glory Residences, Anna Nagar, Chennai, Tamil Nadu 600040",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFF4A5565),
                                                height: 1.5,
                                                fontFamily: 'Arial',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 14,
                                      height: 14,
                                      child: SvgPicture.asset(
                                        locationblueIcon,
                                        width: 14,
                                        height: 14,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 18,
                                            child: const Text(
                                              "Office Hours",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFF101828),
                                                height: 1,
                                                fontFamily: 'Arial',
                                              ),
                                            ),
                                          ),
                                          const Text(
                                            "Monday - Saturday: 9:00 AM - 6:00 PM",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFF4A5565),
                                              height: 1,
                                              fontFamily: 'Arial',
                                            ),
                                          ),
                                          SizedBox(
                                            height: 18,
                                            child: const Text(
                                              "Sunday: 10:00 AM - 4:00 PM",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFF4A5565),
                                                height: 1,
                                                fontFamily: 'Arial',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
