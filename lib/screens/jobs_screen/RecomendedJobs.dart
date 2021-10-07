import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wuzzuf_pwd/models/apiJop.dart';

import 'JobCard.dart';

class RecomendedJobs extends StatefulWidget {
  List<JobsResult> data;
  int fireListSize;
  Map<String, bool> Applied;
  Map<String, bool> fireApi;
  final String UserId;
  RecomendedJobs(
      this.data, this.fireListSize, this.Applied, this.fireApi, this.UserId);
  @override
  _RecomendedJobsState createState() => _RecomendedJobsState();
}

class _RecomendedJobsState extends State<RecomendedJobs> {
  int _cardIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        child: CarouselSlider.builder(
          options: CarouselOptions(
            height: 200,
            viewportFraction: 0.8,
            initialPage: _cardIndex,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _cardIndex = index;
              });
            },
          ),
          itemCount: widget.data.length,
          itemBuilder: (BuildContext context, int index) => Container(
            width: double.infinity,
            child: JobCard(widget.data[index], index, widget.fireListSize,
                widget.Applied, widget.fireApi, widget.UserId),
          ),
        ),
      ),
    );
  }
}
