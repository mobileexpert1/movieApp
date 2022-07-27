// To parse this JSON data, do
//
//     final listScreenApiModel = listScreenApiModelFromJson(jsonString);

part of '../list_screen_bloc/list_screen_bloc.dart';

ListScreenApiModel listScreenApiModelFromJson(String str) => ListScreenApiModel.fromJson(json.decode(str));

String listScreenApiModelToJson(ListScreenApiModel data) => json.encode(data.toJson());

class ListScreenApiModel {
  ListScreenApiModel({
    this.statusCode,
    this.message,
    this.data,
  });

  int? statusCode;
  String? message;
  Data? data;

  factory ListScreenApiModel.fromJson(Map<String, dynamic> json) => ListScreenApiModel(
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
    this.movies,
  });

  List<Movie>? movies;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    movies: List<Movie>.from(json["movies"].map((x) => Movie.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "movies": List<dynamic>.from(movies!.map((x) => x.toJson())),
  };
}

class Movie {
  Movie({
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

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
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
