import 'package:flutter/material.dart';
import 'package:wuzzuf_pwd/constants/Constants.dart';
import 'package:wuzzuf_pwd/models/apiJop.dart';
import 'package:wuzzuf_pwd/models/firebaseJobModel.dart';
import 'package:wuzzuf_pwd/screens/jobs_screen/RecomendedJobs.dart';
import 'package:wuzzuf_pwd/service/ApplicationsService.dart';
import 'package:wuzzuf_pwd/service/FirebaseJobService.dart';
import 'package:wuzzuf_pwd/service/JobService.dart';
import 'package:wuzzuf_pwd/utils/Utils.dart';

import 'JobCard.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<JobsResult> jobsList = [],
      jobsListForDisplay = [],
      RecomendedJobsList = [];
  Map<String, bool> Applied = new Map();
  Map<String, bool> fireApi = new Map();
  bool isLoading = true;
  int fireListSize;
  String Userid = "";
  ApplicationsService applicationsService = new ApplicationsService();
  getjobList() async {
    await applicationsService.getApplications();
    Userid = applicationsService.UserId;
    RecomendedJobsList = await JobService().getJobRecom();
    if (RecomendedJobsList != null)
      RecomendedJobsList = applicationsService.FilterList(RecomendedJobsList);
    List<firebaseJobModel> firelis =
        await FirebaseJobService(fireApi: fireApi).getData();
    if (firelis != null) {
      jobsList.addAll(applicationsService.FilterList(
          Utils().convertLitsFireToApi(firelis)));
      fireListSize = jobsList.length;
    }
    List<JobsResult> ApiJiobs = await JobService().getJob();
    if (ApiJiobs != null) {
      ApiJiobs = applicationsService.FilterList(ApiJiobs);
      for (int i = 0; i < ApiJiobs.length; i++) {
        if (fireApi[ApiJiobs[i].jobId] == null) jobsList.add(ApiJiobs[i]);
      }
    }
    if (RecomendedJobsList != null) {
      RecomendedJobsList = applicationsService.FilterList(RecomendedJobsList);
      for (int i = 0; i < RecomendedJobsList.length; i++) {
        if (fireApi[RecomendedJobsList[i].jobId] == null)
          jobsList.add(RecomendedJobsList[i]);
      }
    }
    for (int i = 0; i < jobsList.length; i++) {
      Applied[jobsList[i].jobId] = false;
      if (i < fireListSize)
        fireApi[jobsList[i].jobId] = true;
      else {
        fireApi[jobsList[i].jobId] = false;
      }
    }
    jobsListForDisplay = jobsList;
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getjobList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: kSpacingUnit * 3),
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        color: kSilverColor,
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
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: kSpacingUnit * 3),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                                kSpacingUnit * 3),
                                          ),
                                          margin: EdgeInsets.all(10.0),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              hintText: "Search Job",
                                              border: InputBorder.none,
                                              hintStyle:
                                                  kBodyTextStyle.copyWith(
                                                color: kSecondaryTextColor,
                                              ),
                                              prefixIcon: Icon(
                                                Icons.search,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            keyboardType: TextInputType.text,
                                            onChanged: (text) {
                                              text = text.toLowerCase();
                                              setState(() {
                                                jobsListForDisplay =
                                                    jobsList.where((element) {
                                                  var title = element.title
                                                      .toLowerCase();
                                                  return title.contains(text);
                                                }).toList();
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: kSpacingUnit * 2),
                                    ],
                                  ),
                                  SizedBox(height: kSpacingUnit * 2),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: kSpacingUnit * 4),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Recomended For You',
                                    style: kSubTitleTextStyle.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            RecomendedJobsList != null
                                ? RecomendedJobs(RecomendedJobsList,
                                    fireListSize, Applied, fireApi, Userid)
                                : Center(
                                    child: Text("Not Found"),
                                  ),
                            SizedBox(height: kSpacingUnit * 2),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: kSpacingUnit * 4),
                              child: Text(
                                '${jobsListForDisplay.length} Jop Found',
                                style: kSubTitleTextStyle.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: jobsListForDisplay
                                    .asMap()
                                    .entries
                                    .map(
                                      (item) => Container(
                                        margin: EdgeInsets.symmetric(
                                                horizontal: kSpacingUnit * 3)
                                            .copyWith(
                                          top: item.key == 0
                                              ? kSpacingUnit * 2
                                              : 0,
                                          bottom: kSpacingUnit * 2,
                                        ),
                                        child: JobCard(
                                            item.value,
                                            item.key,
                                            fireListSize,
                                            Applied,
                                            fireApi,
                                            Userid),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
