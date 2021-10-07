import 'package:flutter/material.dart';
import 'package:wuzzuf_pwd/constants/Constants.dart';
import 'package:wuzzuf_pwd/models/apiJop.dart';
import 'package:wuzzuf_pwd/screens/JobDetailsScreen/DetailContent.dart';
import 'package:wuzzuf_pwd/screens/JobDetailsScreen/DetailFooter.dart';
import 'package:wuzzuf_pwd/screens/JobDetailsScreen/DetailHeader.dart';

class DetailScreen extends StatelessWidget {
  final JobsResult data;
  final int index;
  final int fireListSize;
  final Map<String, bool> Applied;
  final Map<String, bool> fireApi;
  final String UserId;
  const DetailScreen(this.data, this.index, this.fireListSize, this.Applied,
      this.fireApi, this.UserId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSilverColor,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                DetailHeader(data),
                DetailContent(data),
              ],
            ),
            DetailFooter(data, index, fireListSize, Applied, fireApi, UserId),
          ],
        ),
      ),
    );
  }
}
