import 'dart:convert';

import 'package:hacker/models/job.dart';
import 'package:hacker/models/story.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class WebService {
  static final WebService _webService = WebService._internal();
  factory WebService() {
    return _webService;
  }
  WebService._internal();

  static Future<Response> _getStory(int _id) {
    return http.get(Uri.parse("https://hacker-news.firebaseio.com/v0/item/" +
        _id.toString() +
        ".json"));
  }

  Future<List<Story>> getTopStories() async {
    final response = await http.get(Uri.parse(
        "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty"));
    if (response.statusCode == 200) {
      Iterable jobResponse = jsonDecode(response.body);
      List<Response> resp = await Future.wait(jobResponse.take(30).map((value) {
        return _getStory(value);
      }));
      final stories = resp.map((response) {
        final json = jsonDecode(response.body);
        return Story.fromJson(json);
      });
      return stories.toList();
    }
    return throw Exception('Something went wrong');
  }

  Future<List<Job>> getJobStories() async {
    final response = await http.get(Uri.parse(
        "https://hacker-news.firebaseio.com/v0/jobstories.json?print=pretty"));
    if (response.statusCode == 200) {
      Iterable jobResponse = jsonDecode(response.body);
      List<Response> resp = await Future.wait(jobResponse.take(30).map((value) {
        return _getStory(value);
      }));
      final jobs = resp.map((response) {
        final json = jsonDecode(response.body);
        return Job.fromJson(json);
      });
      return jobs.toList();
    }
    return throw Exception('Something went wrong');
  }
}
