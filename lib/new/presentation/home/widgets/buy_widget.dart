import 'package:buildglory/constant/constant.dart';
import 'package:flutter/material.dart';

class BuyWidget extends StatelessWidget {
  const BuyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 30,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: TextFormField(
            style: const TextStyle(color: Color(0xFF6B6B6B), fontSize: 18),
            maxLength: 10,
            decoration: const InputDecoration(
              counterText: "",
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search),
              hintText: 'Search properties, locations, nighbourhoods...',
              hintStyle: TextStyle(color: Color(0xFF6B6B6B), fontSize: 16),
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(buyImage),
              fit: BoxFit.cover,
            ),

            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  "Prime Land Investments",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  "High ROI . DTCP Approved . Ready To Build",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, bottom: 20),
                child: Row(
                  spacing: 18,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Starting form",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "75 Lakhs",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                    Text(
                      "|",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Size",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "1800+ sqft",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 18, bottom: 20),
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 10,
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  color: Color(0xFFFF6900),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Explore Plots",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        Column(
          spacing: 16,
          children: [
            Row(
              children: [
                Text(
                  "Quick Explore",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFFBEDBFF),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blueAccent.shade400),
              ),
              child: Row(
                spacing: 20,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12), // set your radius
                    child: Image.asset(apartmentsImage, fit: BoxFit.cover),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Apartments",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "1,200+ listings available",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Modern residential complexes",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Explore",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.blueAccent.shade700,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFFB9F8CF),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.greenAccent.shade400),
              ),
              child: Row(
                spacing: 20,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12), // set your radius
                    child: Image.asset(apartmentsImage, fit: BoxFit.cover),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Villas",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "800+ listings available",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Luxury indipendent houses",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Explore",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.greenAccent.shade700,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFFE9D4FF),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.purple.shade400),
              ),
              child: Row(
                spacing: 20,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12), // set your radius
                    child: Image.asset(apartmentsImage, fit: BoxFit.cover),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Commercial",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "3+ listings available",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Office spaces & retails",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Explore",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.purpleAccent.shade700,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFFFFD6A7),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.orange.shade400),
              ),
              child: Row(
                spacing: 20,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12), // set your radius
                    child: Image.asset(apartmentsImage, fit: BoxFit.cover),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Plots",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "4 listings available",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Residential & Commerical lands",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Explore",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.orange.shade700,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          spacing: 16,
          children: [
            Row(
              children: [
                Text(
                  "Recommened for You",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
        Column(
          spacing: 16,
          children: [
            Row(
              children: [
                Text(
                  "Organic Homes",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
        Column(
          spacing: 16,
          children: [
            Row(
              children: [
                Text(
                  "Latest Real Estates News & Updates",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: Row(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Icon(Icons.arrow_upward, color: blueColor),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Property Prices Rise 8% in Chennai",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Market analysis shows steady growth in residential sector...",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "2 hours ago",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade700,
                              ),
                            ),
                            Text(
                              "Read More",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: blueColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: Row(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Icon(Icons.badge, color: Colors.green),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "New Metro Line Boosts Property Values",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "OMR corridor sees 15% appreciation after metro announcement...",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "1 day ago",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade700,
                              ),
                            ),
                            Text(
                              "Read More",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: blueColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: blueColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            spacing: 18,
            children: [
              Text(
                "Need Help?",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Text(
                "Our expects are here to assist you",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.shade400,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  spacing: 12,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.message_outlined, color: Colors.white),
                    Text(
                      "Chat",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
