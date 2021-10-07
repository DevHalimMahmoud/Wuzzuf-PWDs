import 'package:flutter/material.dart';
import 'package:wuzzuf_pwd/constants/Constants.dart';
import 'package:wuzzuf_pwd/models/apiJop.dart';

import 'DetailItem.dart';

class DetailContent extends StatelessWidget {
  const DetailContent(
    @required this.data,
  );

  final JobsResult data;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: kSpacingUnit * 4,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(kSpacingUnit * 5),
            topRight: Radius.circular(kSpacingUnit * 5),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: kSpacingUnit * 5),
              Center(
                child: Column(
                  children: [
                    Image.network(
                      data.thumbnail == null
                          ? "https://th.bing.com/th/id/R.301257298931ca32d333bcde5d523c85?rik=z9n1A0HDB1r8Vw&pid=ImgRaw&r=0"
                          : data.thumbnail,
                      height: 50,
                      width: 50,
                    ),
                    SizedBox(height: kSpacingUnit * 2),
                    Text(
                      data.title,
                      style: kTitleTextStyle,
                    ),
                    SizedBox(height: kSpacingUnit),
                    Text(
                      data.location,
                      style: kCaptionTextStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(height: kSpacingUnit * 5),
              Text(
                'Description',
                style: kSubTitleTextStyle,
              ),
              SizedBox(height: kSpacingUnit * 2),
              DetailItem(data.description),
              SizedBox(height: kSpacingUnit * 15),
            ],
          ),
        ),
      ),
    );
  }
}
