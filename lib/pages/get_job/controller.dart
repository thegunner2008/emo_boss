import 'package:emo_boss/common/store/job_store.dart';
import 'package:get/get.dart';

import 'state.dart';

class GetJobController extends GetxController {
  static GetJobController get to => Get.find();

  final state = GetJobState();

  GetJobController();

  Future getJob() => JobStore.to.getCurrentJob().then(state.setCurrentJob);
}
