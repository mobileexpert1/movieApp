import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/widgets/text_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/screens/detail_screen/view/detail_screen.dart';
import '../../detail_screen/detail_screen.dart';
import '../list_screen.dart';
part 'list_screen_grid.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);
  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              title: TextClass().setText("Movies", fontSize: 18),
              elevation: 0.0,
            ),
            body: BlocBuilder<ListScreenBloc,ListScreenState>(
              builder: (context,state){
                switch(state.listScreenStatus){
                  case ListScreenStatus.initial:
                    return const Center(child:  CircularProgressIndicator());
                  case ListScreenStatus.success:
                    return Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10,bottom: 20),
                        child: listScreenGrid(movieList: state.movieList, ctx: context)
                    );
                  case ListScreenStatus.failure:
                    return const Center(child: Text("Failed to load"));

                }
              },

            ),
        ),
      ),
    );
  }
}
