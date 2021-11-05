import 'package:hacker/models/job.dart';
import 'package:hacker/webservice.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class JobCubit extends Cubit<List<Job>> {
  WebService service = WebService();

  JobCubit() : super([]);

  void getJobs() async => emit(await service.getJobStories());
}
