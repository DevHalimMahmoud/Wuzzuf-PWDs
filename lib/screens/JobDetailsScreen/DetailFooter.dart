import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wuzzuf_pwd/constants/Constants.dart';
import 'package:wuzzuf_pwd/models/apiJop.dart';
import 'package:wuzzuf_pwd/models/firebaseApplicationModel.dart';
import 'package:wuzzuf_pwd/service/FirebaseJobService.dart';
import 'package:wuzzuf_pwd/utils/Utils.dart';

class DetailFooter extends StatefulWidget {
  final JobsResult data;
  final int index;
  final int fireListSize;
  final Map<String, bool> Applied;
  final Map<String, bool> fireApi;
  final String UserId;
  DetailFooter(this.data, this.index, this.fireListSize, this.Applied,
      this.fireApi, this.UserId);
  @override
  _DetailFooterState createState() => _DetailFooterState();
}

class _DetailFooterState extends State<DetailFooter> {
  @override
  Widget build(BuildContext context) {
    String ApplyText;
    Color color;
    if (widget.Applied[widget.data.jobId] == false) {
      ApplyText = 'Apply Now';
      color = Colors.blue;
    } else {
      ApplyText = 'Applied';
      color = Colors.grey;
    }
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: EdgeInsets.all(kSpacingUnit * 2),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [kFooterShadow],
        ),
        child: Row(
          children: [
            Container(
              height: kSpacingUnit * 6,
              width: kSpacingUnit * 8,
              decoration: BoxDecoration(
                color: kSilverColor,
                borderRadius: BorderRadius.circular(kSpacingUnit * 3),
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/company.svg',
                  height: 20,
                  width: 20,
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(width: kSpacingUnit * 2),
            Expanded(
              child: InkWell(
                onTap: () {
                  if (widget.Applied[widget.data.jobId] == false) {
                    if (!widget.fireApi[widget.data.jobId]) {
                      FirebaseJobService().upLoad(
                          Utils().convertObjectApiToFirebase(widget.data));
                    }
                    firebaseApplicationModel model =
                        new firebaseApplicationModel(
                            cv_link: "CV_link.com",
                            job_id: widget.data.jobId,
                            status: "pending",
                            user_id: widget.UserId);
                    FirebaseJobService().upLoadApplication(model);
                    setState(() {
                      widget.Applied[widget.data.jobId] = true;
                    });
                  }
                },
                child: Container(
                  height: kSpacingUnit * 6,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(kSpacingUnit * 3),
                  ),
                  child: Center(
                    child: Text(
                      ApplyText,
                      style: kTitleTextStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
