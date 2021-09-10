// // To parse this JSON data, do
// //
// //     final newsModel = newsModelFromJson(jsonString);
// import 'dart:convert';

// NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

// String newsModelToJson(NewsModel data) => json.encode(data.toJson());

// class NewsModel {
//   NewsModel({
//     this.status,
//     this.totalResults,
//     this.articles,
//   });

//   String status;
//   int totalResults;
//   List<Article> articles;

//   factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
//         status: json["status"],
//         totalResults: json["totalResults"],
//         articles: List<Article>.from(
//             json["articles"].map((x) => Article.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "totalResults": totalResults,
//         "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
//       };
// }

// class Article {
//   Article({
//     this.source,
//     this.author,
//     this.title,
//     this.description,
//     this.url,
//     this.urlToImage,
//     this.publishedAt,
//     this.content,
//   });

//   Source source;
//   String author;
//   String title;
//   String description;
//   String url;
//   String urlToImage;
//   DateTime publishedAt;
//   String content;

//   factory Article.fromJson(Map<String, dynamic> json) => Article(
//         source: Source.fromJson(json["source"]),
//         author: json["author"] == null ? null : json["author"],
//         title: json["title"],
//         description: json["description"],
//         url: json["url"],
//         urlToImage: json["urlToImage"],
//         publishedAt: DateTime.parse(json["publishedAt"]),
//         content: json["content"],
//       );

//   Map<String, dynamic> toJson() => {
//         "source": source.toJson(),
//         "author": author == null ? null : author,
//         "title": title,
//         "description": description,
//         "url": url,
//         "urlToImage": urlToImage,
//         "publishedAt": publishedAt.toIso8601String(),
//         "content": content,
//       };
// }

// class Source {
//   Source({
//     this.id,
//     this.name,
//   });

//   Id id;
//   Name name;

//   factory Source.fromJson(Map<String, dynamic> json) => Source(
//         id: idValues.map[json["id"]],
//         name: nameValues.map[json["name"]],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": idValues.reverse[id],
//         "name": nameValues.reverse[name],
//       };
// }

// enum Id { THE_WALL_STREET_JOURNAL }

// final idValues =
//     EnumValues({"the-wall-street-journal": Id.THE_WALL_STREET_JOURNAL});

// enum Name { THE_WALL_STREET_JOURNAL }

// final nameValues =
//     EnumValues({"The Wall Street Journal": Name.THE_WALL_STREET_JOURNAL});

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }

// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  NewsModel({
    this.data,
    this.meta,
  });

  NewsModelData data;
  Meta meta;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        data: NewsModelData.fromJson(json["data"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "meta": meta.toJson(),
      };
}

class NewsModelData {
  NewsModelData({
    this.id,
    this.type,
    this.attributes,
    this.relationships,
    this.links,
  });

  int id;
  Type type;
  Attributes attributes;
  Relationships relationships;
  Links links;

  factory NewsModelData.fromJson(Map<String, dynamic> json) => NewsModelData(
        id: json["id"],
        type: typeValues.map[json["type"]],
        attributes: Attributes.fromJson(json["attributes"]),
        relationships: Relationships.fromJson(json["relationships"]),
        links: Links.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": typeValues.reverse[type],
        "attributes": attributes.toJson(),
        "relationships": relationships.toJson(),
        "links": links.toJson(),
      };
}

class Attributes {
  Attributes({
    this.name,
    this.description,
    this.parentId,
    this.decathlonId,
    this.slug,
    this.locale,
    this.weather,
    this.icon,
  });

  String name;
  dynamic description;
  int parentId;
  int decathlonId;
  String slug;
  String locale;
  List<dynamic> weather;
  dynamic icon;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        name: json["name"],
        description: json["description"],
        parentId: json["parent_id"],
        decathlonId: json["decathlon_id"],
        slug: json["slug"],
        locale: json["locale"],
        weather: List<dynamic>.from(json["weather"].map((x) => x)),
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "parent_id": parentId,
        "decathlon_id": decathlonId,
        "slug": slug,
        "locale": locale,
        "weather": List<dynamic>.from(weather.map((x) => x)),
        "icon": icon,
      };
}

class Links {
  Links({
    this.self,
  });

  String self;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: json["self"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
      };
}

class Relationships {
  Relationships({
    this.children,
    this.parent,
    this.group,
    this.related,
    this.context,
    this.tags,
    this.images,
  });

  Children children;
  Group parent;
  Group group;
  List<Related> related;
  Children context;
  Images tags;
  Images images;

  factory Relationships.fromJson(Map<String, dynamic> json) => Relationships(
        children: Children.fromJson(json["children"]),
        parent: Group.fromJson(json["parent"]),
        group: Group.fromJson(json["group"]),
        related:
            List<Related>.from(json["related"].map((x) => Related.fromJson(x))),
        context: Children.fromJson(json["context"]),
        tags: Images.fromJson(json["tags"]),
        images: Images.fromJson(json["images"]),
      );

  Map<String, dynamic> toJson() => {
        "children": children.toJson(),
        "parent": parent.toJson(),
        "group": group.toJson(),
        "related": List<dynamic>.from(related.map((x) => x.toJson())),
        "context": context.toJson(),
        "tags": tags.toJson(),
        "images": images.toJson(),
      };
}

class Children {
  Children({
    this.data,
  });

  ChildrenData data;

  factory Children.fromJson(Map<String, dynamic> json) => Children(
        data: ChildrenData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class ChildrenData {
  ChildrenData();

  factory ChildrenData.fromJson(Map<String, dynamic> json) => ChildrenData();

  Map<String, dynamic> toJson() => {};
}

class Group {
  Group({
    this.data,
    this.links,
  });

  GroupData data;
  Links links;

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        data: GroupData.fromJson(json["data"]),
        links: Links.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "links": links.toJson(),
      };
}

class GroupData {
  GroupData({
    this.id,
    this.type,
  });

  int id;
  String type;

  factory GroupData.fromJson(Map<String, dynamic> json) => GroupData(
        id: json["id"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
      };
}

class Images {
  Images({
    this.data,
  });

  List<Datum> data;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.url,
    this.variants,
  });

  String url;
  List<Variant> variants;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        url: json["url"],
        variants: List<Variant>.from(
            json["variants"].map((x) => Variant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "variants": List<dynamic>.from(variants.map((x) => x.toJson())),
      };
}

class Variant {
  Variant({
    this.thumbnail,
    this.medium,
  });

  Medium thumbnail;
  Medium medium;

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        thumbnail: Medium.fromJson(json["thumbnail"]),
        medium: Medium.fromJson(json["medium"]),
      );

  Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail.toJson(),
        "medium": medium.toJson(),
      };
}

class Medium {
  Medium({
    this.url,
  });

  String url;

  factory Medium.fromJson(Map<String, dynamic> json) => Medium(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

class Related {
  Related({
    this.data,
    this.links,
  });

  RelatedData data;
  Links links;

  factory Related.fromJson(Map<String, dynamic> json) => Related(
        data: RelatedData.fromJson(json["data"]),
        links: Links.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "links": links.toJson(),
      };
}

class RelatedData {
  RelatedData({
    this.id,
    this.type,
    this.weight,
  });

  int id;
  Type type;
  String weight;

  factory RelatedData.fromJson(Map<String, dynamic> json) => RelatedData(
        id: json["id"],
        type: typeValues.map[json["type"]],
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": typeValues.reverse[type],
        "weight": weight,
      };
}

enum Type { SPORTS }

final typeValues = EnumValues({"sports": Type.SPORTS});

class Meta {
  Meta({
    this.copyright,
    this.authors,
  });

  String copyright;
  List<String> authors;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        copyright: json["copyright"],
        authors: List<String>.from(json["authors"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "copyright": copyright,
        "authors": List<dynamic>.from(authors.map((x) => x)),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
