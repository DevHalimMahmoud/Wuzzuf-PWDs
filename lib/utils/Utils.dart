import 'package:wuzzuf_pwd/models/apiJop.dart';
import 'package:wuzzuf_pwd/models/firebaseJobModel.dart';
import 'package:wuzzuf_pwd/service/FirebaseJobService.dart';

class Utils {
  List<JobsResult> convertLitsFireToApi(List<firebaseJobModel> fireList) {
    List<JobsResult> apiList = [];
    fireList.forEach((element) {
      apiList.add(new JobsResult(
          jobId: element.Id,
          title: element.title,
          companyName: element.organization,
          location: element.address,
          description: element.description,
          detectedExtensions: DetectedExtensions(postedAt: "1 day")));
    });
    return apiList;
  }

  firebaseJobModel convertObjectApiToFirebase(JobsResult jobsResult) {
    firebaseJobModel object = new firebaseJobModel(
        Id: jobsResult.jobId,
        address: jobsResult.location,
        department: jobsResult.title,
        description: jobsResult.description,
        disability: "Locomotor Disability",
        organization: jobsResult.companyName,
        title: jobsResult.title);
    return object;
  }
}
