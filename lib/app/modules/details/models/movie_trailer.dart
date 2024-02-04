import '../../../../services/api_response.dart';

List<MoviesTrailer> movieTrailerFromJson(ApiResponse result) {
  if (result.data['results'] != null) {
    return result.data['results']
        .map<MoviesTrailer>((i) => MoviesTrailer.fromJson(i))
        .toList();
  }
  return [];
}

class MoviesTrailer {
  final String? name;
  final String? key;
  final int? size;
  final String? type;
  final bool? official;
  final DateTime? publishedAt;
  final String? id;

  MoviesTrailer({
    this.name,
    this.key,
    this.size,
    this.type,
    this.official,
    this.publishedAt,
    this.id,
  });

  factory MoviesTrailer.fromJson(Map<String, dynamic> json) => MoviesTrailer(
        name: json["name"],
        key: json["key"],
        size: json["size"],
        type: json["type"],
        official: json["official"],
        publishedAt: json["published_at"] == null
            ? null
            : DateTime.parse(json["published_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "key": key,
        "size": size,
        "type": type,
        "official": official,
        "published_at": publishedAt?.toIso8601String(),
        "id": id,
      };
}
