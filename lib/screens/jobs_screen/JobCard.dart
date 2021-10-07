import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:wuzzuf_pwd/constants/Constants.dart';
import 'package:wuzzuf_pwd/models/apiJop.dart';

class JobCard extends StatelessWidget {
  final JobsResult data;
  final int index;
  final int fireListSize;
  final Map<String, bool> Applied;
  final Map<String, bool> fireApi;
  final String UserId;
  const JobCard(this.data, this.index, this.fireListSize, this.Applied,
      this.fireApi, this.UserId);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [kCardShadow],
      ),
      child: OpenContainer(
        transitionType: ContainerTransitionType.fade,
        transitionDuration: const Duration(milliseconds: 500),
        openColor: kSilverColor,
        openElevation: 0,
        openBuilder: (context, action) {
          /* return DetailScreen(
              data, index, fireListSize, Applied, fireApi, UserId);*/
        },
        closedColor: Colors.transparent,
        closedElevation: 0,
        closedBuilder: (context, action) {
          return Container(
            padding: EdgeInsets.all(kSpacingUnit * 2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.circular(kSpacingUnit * 3),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.network(
                      data.thumbnail == null
                          ? "https://th.bing.com/th/id/R.301257298931ca32d333bcde5d523c85?rik=z9n1A0HDB1r8Vw&pid=ImgRaw&r=0"
                          : data.thumbnail,
                      height: 40,
                      width: 40,
                    ),
                    SizedBox(width: kSpacingUnit),
                    Expanded(
                      child: Text(
                        data.companyName,
                        style: kCardTitleTextStyle,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  data.title,
                  style: kSubTitleTextStyle,
                ),
                SizedBox(height: kSpacingUnit * 0.5),
                Text(
                  data.location,
                  style: kCaptionTextStyle,
                ),
                Text(data.detectedExtensions.postedAt, style: kCaptionTextStyle)
              ],
            ),
          );
        },
      ),
    );
  }
}
