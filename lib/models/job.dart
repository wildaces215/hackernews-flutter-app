class Job {
  String by = "";
  int id = 0;
  int score = 0;
  String text = "";
  int time = 0;
  String title = "";
  String type = "";
  String url = "";

  Job(this.by, this.id, this.score, this.text, this.time, this.title, this.type,
      this.url);

  Job.fromJson(Map<String, dynamic> json) {
    by = json['by'];
    id = json['id'] ?? 0;
    score = json['score'] ?? 0;
    text = json['text'] ?? "";
    time = json['time'] ?? 0;
    title = json['title'] ?? "";
    type = json['type'] ?? "";
    url = json['url'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['by'] = by;
    data['id'] = id;
    data['score'] = score;
    data['text'] = text;
    data['time'] = time;
    data['title'] = title;
    data['type'] = type;
    data['url'] = url;
    return data;
  }
}
