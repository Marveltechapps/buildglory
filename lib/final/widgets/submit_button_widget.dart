import 'package:buildglory/constant/constant.dart';
import 'package:flutter/cupertino.dart';

class SubmitButtonWidget extends StatelessWidget {
  final Function() ontap;
  final String title;
  const SubmitButtonWidget({
    super.key,
    required this.ontap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(bottom: 20),
        child: GestureDetector(
          onTap: ontap,
          child: Container(
            height: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: blueColor,
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Arial',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
