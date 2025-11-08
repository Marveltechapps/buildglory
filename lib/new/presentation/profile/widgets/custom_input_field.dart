import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/final/sell/bloc/sell_property_bloc.dart';
import 'package:buildglory/final/sell/bloc/sell_property_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final String placeholder;
  final TextEditingController controller;
  final bool? readonly;
  final bool? prefixIcon;
  final bool? showsymbol;
  final Widget? prefix;
  final SellPropertyBloc? sellPropertyBloc;
  const CustomInputField({
    super.key,
    required this.label,
    required this.placeholder,
    required this.controller,
    this.readonly,
    this.prefixIcon,
    this.showsymbol,
    this.prefix,
    this.sellPropertyBloc,
  });

  static List<String> bhktype = ['1 BHK', '2 BHK', '3 BHK', '4 BHK'];

  static List<String> city = [
    'Chennai',
    'Kanchipuram',
    'Chengalpattu',
    'Vellor',
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: readonly == true
          ? () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // Wrap content
                      children: [
                        Container(
                          height: 4,
                          width: 40,
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const Text(
                          "Choose an Option",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: label == "BHK Type *"
                              ? bhktype.length
                              : city.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              // leading: const Icon(Icons.share),
                              title: Text(
                                label == "BHK Type *"
                                    ? bhktype[index]
                                    : city[index],
                              ),
                              onTap: () {
                                sellPropertyBloc?.add(
                                  SelectOptionsEvent(
                                    title: label,
                                    selectedValue: label == "BHK Type *"
                                        ? bhktype[index]
                                        : city[index],
                                  ),
                                );
                                Navigator.pop(context);
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label
          SizedBox(
            width: double.infinity,
            height: 18,
            child: Text(
              label,
              style: const TextStyle(
                color: Color(0xFF101828),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 1,
                fontFamily: 'Arial',
              ),
            ),
          ),
          const SizedBox(height: 7),
          // Input Field
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: const Color(0xFFF3F3F5),
              border: Border.all(color: Colors.transparent, width: 1),
            ),
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                showsymbol == true ? Text("₹ ") : SizedBox(),
                prefix != null
                    ? Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: prefix ?? SizedBox(),
                      )
                    : SizedBox(),
                Expanded(
                  child: IgnorePointer(
                    ignoring: readonly == true ? true : false,
                    child: TextField(
                      readOnly: readonly ?? false,
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: placeholder,
                        hintStyle: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Arial',
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                        isDense: true,
                      ),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Arial',
                      ),
                    ),
                  ),
                ),
                readonly == true ? SvgPicture.asset(dropdownIcon) : SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
