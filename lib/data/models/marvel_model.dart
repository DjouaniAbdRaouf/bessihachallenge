// ignore_for_file: no_leading_underscores_for_local_identifiers

// class CharacterModel {
//   CharacterModel({
//     required this.code,
//     required this.status,
//     required this.copyright,
//     required this.attributionText,
//     required this.attributionHTML,
//     required this.etag,
//     required this.data,
//   });
//   late final int code;
//   late final String status;
//   late final String copyright;
//   late final String attributionText;
//   late final String attributionHTML;
//   late final String etag;
//   late final Data data;

//   CharacterModel.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//     status = json['status'];
//     copyright = json['copyright'];
//     attributionText = json['attributionText'];
//     attributionHTML = json['attributionHTML'];
//     etag = json['etag'];
//     data = Data.fromJson(json['data']);
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['code'] = code;
//     _data['status'] = status;
//     _data['copyright'] = copyright;
//     _data['attributionText'] = attributionText;
//     _data['attributionHTML'] = attributionHTML;
//     _data['etag'] = etag;
//     _data['data'] = data.toJson();
//     return _data;
//   }
// }

// class Data {
//   Data({
//     required this.offset,
//     required this.limit,
//     required this.total,
//     required this.count,
//     required this.results,
//   });
//   late final int offset;
//   late final int limit;
//   late final int total;
//   late final int count;
//   late final List<Results> results;

//   Data.fromJson(Map<String, dynamic> json) {
//     offset = json['offset'];
//     limit = json['limit'];
//     total = json['total'];
//     count = json['count'];
//     results =
//         List.from(json['results']).map((e) => Results.fromJson(e)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['offset'] = offset;
//     _data['limit'] = limit;
//     _data['total'] = total;
//     _data['count'] = count;
//     _data['results'] = results.map((e) => e.toJson()).toList();
//     return _data;
//   }
// }

// class Results {
//   Results({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.modified,
//     required this.thumbnail,
//     required this.resourceURI,
//     required this.comics,
//   });
//   late final int id;
//   late final String name;
//   late final String description;
//   late final String modified;
//   late final Thumbnail thumbnail;
//   late final String resourceURI;
//   late final Comics comics;

//   Results.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     description = json['description'];
//     modified = json['modified'];
//     thumbnail = Thumbnail.fromJson(json['thumbnail']);
//     resourceURI = json['resourceURI'];
//     comics = Comics.fromJson(json['comics']);
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     _data['description'] = description;
//     _data['modified'] = modified;
//     _data['thumbnail'] = thumbnail.toJson();
//     _data['resourceURI'] = resourceURI;
//     _data['comics'] = comics.toJson();
//     return _data;
//   }
// }

// class Thumbnail {
//   Thumbnail({
//     required this.path,
//     required this.extension,
//   });
//   late final String path;
//   late final String extension;

//   Thumbnail.fromJson(Map<String, dynamic> json) {
//     path = json['path'];
//     extension = json['extension'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['path'] = path;
//     _data['extension'] = extension;
//     return _data;
//   }
// }

// class Comics {
//   Comics({
//     required this.available,
//     required this.collectionURI,
//     required this.items,
//     required this.returned,
//   });
//   late final int available;
//   late final String collectionURI;
//   late final List<Items> items;
//   late final int returned;

//   Comics.fromJson(Map<String, dynamic> json) {
//     available = json['available'];
//     collectionURI = json['collectionURI'];
//     items = List.from(json['items']).map((e) => Items.fromJson(e)).toList();
//     returned = json['returned'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['available'] = available;
//     _data['collectionURI'] = collectionURI;
//     _data['items'] = items.map((e) => e.toJson()).toList();
//     _data['returned'] = returned;
//     return _data;
//   }
// }

// class Items {
//   Items({
//     required this.resourceURI,
//     required this.name,
//   });
//   late final String resourceURI;
//   late final String name;

//   Items.fromJson(Map<String, dynamic> json) {
//     resourceURI = json['resourceURI'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['resourceURI'] = resourceURI;
//     _data['name'] = name;
//     return _data;
//   }
// }

//--------------------------------

class CharacterModel {
  CharacterModel({
    required this.id,
    required this.name,
    required this.description,
    required this.modified,
    required this.thumbnail,
    required this.resourceURI,
    required this.comics,
    required this.urls,
  });
  late final int id;
  late final String name;
  late final String description;
  late final String modified;
  late final Thumbnail thumbnail;
  late final String resourceURI;
  late final Comics comics;
  late final List<Urls> urls;

  CharacterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    modified = json['modified'];
    thumbnail = Thumbnail.fromJson(json['thumbnail']);
    resourceURI = json['resourceURI'];
    comics = Comics.fromJson(json['comics']);
    urls = List.from(json['urls']).map((e) => Urls.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['description'] = description;
    _data['modified'] = modified;
    _data['thumbnail'] = thumbnail.toJson();
    _data['resourceURI'] = resourceURI;
    _data['comics'] = comics.toJson();
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

class Thumbnail {
  Thumbnail({
    required this.path,
    required this.extension,
  });
  late final String path;
  late final String extension;

  Thumbnail.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    extension = json['extension'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['path'] = path;
    _data['extension'] = extension;
    return _data;
  }
}

class Comics {
  Comics({
    required this.available,
    required this.collectionURI,
    required this.items,
    required this.returned,
  });
  late final int available;
  late final String collectionURI;
  late final List<Items> items;
  late final int returned;

  Comics.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    collectionURI = json['collectionURI'];
    items = List.from(json['items']).map((e) => Items.fromJson(e)).toList();
    returned = json['returned'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['available'] = available;
    _data['collectionURI'] = collectionURI;
    _data['items'] = items.map((e) => e.toJson()).toList();
    _data['returned'] = returned;
    return _data;
  }
}

class Items {
  Items({
    required this.resourceURI,
    required this.name,
  });
  late final String resourceURI;
  late final String name;

  Items.fromJson(Map<String, dynamic> json) {
    resourceURI = json['resourceURI'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['resourceURI'] = resourceURI;
    _data['name'] = name;
    return _data;
  }
}
