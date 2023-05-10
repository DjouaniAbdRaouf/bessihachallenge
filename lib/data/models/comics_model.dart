// ignore_for_file: no_leading_underscores_for_local_identifiers

class ComicsModel {
  ComicsModel({
    required this.status,
    required this.data,
  });
  late final String status;

  late final Data data;

  ComicsModel.fromJson(dynamic json) {
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.results,
  });

  late final List<Results> results;

  Data.fromJson(Map<String, dynamic> json) {
    results =
        List.from(json['results']).map((e) => Results.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['results'] = results.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Results {
  Results({
    required this.id,
    required this.digitalId,
    required this.title,
    required this.urls,
  });
  late final int id;
  late final int digitalId;
  late final String title;

  late final List<Urls> urls;

  late final List<dynamic> collections;
  late final List<dynamic> collectedIssues;

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    digitalId = json['digitalId'];
    title = json['title'];
    urls = List.from(json['urls']).map((e) => Urls.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['digitalId'] = digitalId;
    _data['title'] = title;

    _data['urls'] = urls.map((e) => e.toJson()).toList();

    return _data;
  }
}

class Urls {
  Urls({
    required this.type,
    required this.url,
  });
  late final String type;
  late final String url;

  Urls.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['url'] = url;
    return _data;
  }
}
