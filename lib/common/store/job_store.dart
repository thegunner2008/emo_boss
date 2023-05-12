import 'package:emo_boss/common/di/injector.dart';

import '../entities/entities.dart';
import '../remote/remote.dart';

abstract class JobStore {
  static JobStore get to => AppInjector.injector<JobStore>();

  Future<ResponseList<Job>> getJobs({
    int pageSize,
    int page,
    String sort,
    String order,
  });

  Future createJob({
    required Job job,
  });

  Future editJob({
    required Job job,
  });

  Future deleteJob({
    required Job job,
  });
}

class JobStoreImpl implements JobStore {
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

  @override
  Future createJob({
    required Job job,
  }) {
    final request = job.toJson();
    return ApiService.create().createJobs(
      request: request,
    );
  }

  @override
  Future editJob({
    required Job job,
  }) {
    final request = {
      'total': job.total,
      'time': job.time,
      'money': job.money,
    };
    return ApiService.create().editJobs(
      id: job.id,
      request: request,
    );
  }

  @override
  Future deleteJob({
    required Job job,
  }) {
    return ApiService.create().deleteJobs(
      id: job.id,
    );
  }
}
