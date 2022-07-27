import 'dart:async';
import 'dart:convert';


import 'package:bloc/bloc.dart';

import 'package:http/http.dart' as http;

import '../../../api_helper/url_utils.dart';

part 'detail_screen_events.dart';

part 'detail_screen_states.dart';

part '../detail_screen_model/detail_screen_model.dart';

class DetailScreenBloc extends Bloc<DetailScreenEvent, DetailScreenState> {
  DetailScreenBloc(String id) :_id=id, super(const DetailScreenState()) {
    on<DetailScreenFetched>(_onDetailScreenFetched);
  }
  final String _id;

  Future<void> _onDetailScreenFetched(
    DetailScreenFetched event,
    Emitter<DetailScreenState> emit,
  ) async {
    try {
      if (state.detailScreenStatus == DetailScreenStatus.initial) {
        final data = await _fetchDetailScreen();

        return emit(state.copyWith(
          detailScreenStatus: DetailScreenStatus.success,
          movieDetails: data,
        ));
      }
    } catch (e) {
      print(e);
      emit(state.copyWith(detailScreenStatus: DetailScreenStatus.failure));
    }
  }

  Future<MovieDetails> _fetchDetailScreen() async {
    final response = await http.get(Uri.parse(movieEndPoint+"/$_id"));
    if (response.statusCode == 200) {
      DetailScreenApiModel responseData = detailScreenApiModelFromJson(response.body);
      return responseData.data!.movie!;
    }
    throw Exception('error fetching posts');
  }
}
