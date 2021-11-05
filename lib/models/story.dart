class Story {
  String by = "";
  int descendants = 0;
  int id = 0;
  List<dynamic> kids = [];
  int score = 0;
  int time = 0;
  String title = "";
  String type = "";
  String url = "";

  Story(this.by, this.descendants, this.id, this.kids, this.score, this.time,
      this.title, this.type, this.url);
//
  Story.fromJson(Map<String, dynamic> json) {
    by = json['by'];
    descendants = json['descendants'] ?? 0;
    id = json['id'] ?? 0;
    kids = json['kids'] ?? <dynamic>[];
    score = json['score'] ?? "";
    time = json['time'] ?? "";
    title = json['title'] ?? "";
    type = json['type'] ?? "";
    url = json['url'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['by'] = by;
    data['descendants'] = descendants;
    data['id'] = id;
    data['kids'] = kids;
    data['score'] = score;
    data['time'] = time;
    data['title'] = title;
    data['type'] = type;
    data['url'] = url;
    return data;
  }
}
