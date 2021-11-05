import 'package:hacker/models/story.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../webservice.dart';

class StoriesCubit extends Cubit<List<Story>> {
  final _webService = WebService();

  StoriesCubit() : super([]);

  void getStories() async => emit(await _webService.getTopStories());
}
