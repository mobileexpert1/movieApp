import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';

import 'package:http/http.dart' as http;

import '../../../api_helper/url_utils.dart';

part 'list_screen_events.dart';

part 'list_screen_states.dart';

part '../list_screen_model/list_screen_model.dart';

class ListScreenBloc extends Bloc<ListScreenEvent, ListScreenState> {
  ListScreenBloc() : super(const ListScreenState()) {
    on<ListScreenFetched>(_onListScreenFetched);
  }

  Future<void> _onListScreenFetched(
    ListScreenFetched event,
    Emitter<ListScreenState> emit,
  ) async {
    try {
      if (state.listScreenStatus == ListScreenStatus.initial) {
        final data = await _fetchListScreen();
        return emit(state.copyWith(
          listScreenStatus: ListScreenStatus.success,
          movieList: data,
        ));
      }
    } catch (e) {
      emit(state.copyWith(listScreenStatus: ListScreenStatus.failure));
    }
  }

  Future<List<Movie>> _fetchListScreen() async {
    final response = await http.get(Uri.parse(movieEndPoint));
    if (response.statusCode == 200) {
      var responseData = listScreenApiModelFromJson(response.body);
      return responseData.data!.movies!;
    }
    throw Exception('error fetching posts');
  }
}
