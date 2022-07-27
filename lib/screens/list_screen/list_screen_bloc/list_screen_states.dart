part of 'list_screen_bloc.dart';
enum ListScreenStatus { initial, success, failure }

class ListScreenState {
  const ListScreenState({this.listScreenStatus = ListScreenStatus.initial, this.movieList=const <Movie>[] });

  final ListScreenStatus listScreenStatus;
  final List<Movie> movieList;

  ListScreenState copyWith({
    ListScreenStatus? listScreenStatus,
    List<Movie>? movieList,
  }) {
    return ListScreenState(listScreenStatus: listScreenStatus ?? this.listScreenStatus, movieList: movieList ?? this.movieList);
  }
}