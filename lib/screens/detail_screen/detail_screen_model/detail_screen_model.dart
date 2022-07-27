// To parse this JSON data, do
//
//     final detailScreenApiModel = detailScreenApiModelFromJson(jsonString);

part  of '../detail_screen_bloc/detail_screen_bloc.dart';

DetailScreenApiModel detailScreenApiModelFromJson(String str) => DetailScreenApiModel.fromJson(json.decode(str));

String detailScreenApiModelToJson(DetailScreenApiModel data) => json.encode(data.toJson());

class DetailScreenApiModel {
  DetailScreenApiModel({
    this.statusCode,
    this.message,
    this.data,
  });

  int? statusCode;
  String? message;
  Data? data;

  factory DetailScreenApiModel.fromJson(Map<String, dynamic> json) => DetailScreenApiModel(
    statusCode: json["status_code"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.movie,
  });

  MovieDetails? movie;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    movie: MovieDetails.fromJson(json["movie"]),
  );

  Map<String, dynamic> toJson() => {
    "movie": movie?.toJson(),
  };
}

class MovieDetails {
  MovieDetails({
    this.id,
    this.name,
    this.year,
    this.director,
    this.mainStar,
    this.description,
    this.favoritedByUsers,
    this.genres,
    this.thumbnail,
  });

  int? id;
  String? name;
  String? year;
  String? director;
  String? mainStar;
  String? description;
  int? favoritedByUsers;
  List<String>? genres;
  String? thumbnail;

  factory MovieDetails.fromJson(Map<String, dynamic> json) => MovieDetails(
    id: json["id"],
    name: json["name"],
    year: json["year"],
    director: json["director"],
    mainStar: json["main_star"],
    description: json["description"],
    favoritedByUsers: json["favorited_by_users"],
    genres: List<String>.from(json["genres"].map((x) => x)),
    thumbnail: json["thumbnail"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "year": year,
    "director": director,
    "main_star": mainStar,
    "description": description,
    "favorited_by_users": favoritedByUsers,
    "genres": List<dynamic>.from(genres!.map((x) => x)),
    "thumbnail": thumbnail,
  };
}
