import 'package:flutter/material.dart';
import 'package:wuzzuf_pwd/constants/Constants.dart';

class DetailItem extends StatelessWidget {
  final String data;

  const DetailItem(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kSpacingUnit * 2),
      child: Text(
        data,
        style: kCaptionTextStyle.copyWith(
          color: kPrimaryTextColor,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
