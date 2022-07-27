
part of "detail_screen_bloc.dart";

enum DetailScreenStatus { initial, success, failure }

class DetailScreenState {
  const DetailScreenState({this.detailScreenStatus = DetailScreenStatus.initial, this.movieDetails });

  final DetailScreenStatus detailScreenStatus;
  final MovieDetails? movieDetails;

  DetailScreenState copyWith({
    DetailScreenStatus? detailScreenStatus,
    MovieDetails? movieDetails,
  }) {
    return DetailScreenState(detailScreenStatus: detailScreenStatus ?? this.detailScreenStatus, movieDetails: movieDetails ?? this.movieDetails);
  }
}