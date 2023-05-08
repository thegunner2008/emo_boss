import 'package:emo_boss/common/di/injector.dart';

import '../entities/entities.dart';
import '../remote/remote.dart';

abstract class JobStore {
  static JobStore get to => AppInjector.injector<JobStore>();

  Future<CurrentJobResponse> getCurrentJob();

  Future<ResponseList<Job>> getJobs({
    int pageSize,
    int page,
    String sort,
    String order,
  });
}

class JobStoreImpl implements JobStore {
  @override
  Future<CurrentJobResponse> getCurrentJob() => ApiService.create().getCurrentJob();

  @override
  Future<ResponseList<Job>> getJobs({
    int pageSize = 20,
    int page = 1,
    String sort = "id",
    String order = "desc",
  }) =>
      ApiService.create().getJobs(
        pageSize: pageSize,
        page: page,
        sort: sort,
        order: order,
      );
}
