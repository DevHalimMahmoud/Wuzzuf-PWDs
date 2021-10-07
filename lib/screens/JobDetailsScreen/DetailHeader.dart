import 'package:flutter/material.dart';
import 'package:wuzzuf_pwd/constants/Constants.dart';
import 'package:wuzzuf_pwd/models/apiJop.dart';

class DetailHeader extends StatelessWidget {
  const DetailHeader(
    @required this.data,
  );

  final JobsResult data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back_ios_rounded)),
            Text(
              data.companyName,
              style: kSubTitleTextStyle.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 30),
          ],
        ),
      ),
    );
  }
}
