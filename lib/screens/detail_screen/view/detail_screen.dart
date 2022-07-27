import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/widgets/bullet_widget.dart';
import 'package:movieapp/widgets/text_widget.dart';
import '../detail_screen.dart';

part 'detail_screen_list.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailScreenBloc,DetailScreenState>(
      builder: (context,state){
        switch(state.detailScreenStatus){
          case DetailScreenStatus.initial:
            return const Scaffold(body:  Center(child:  CircularProgressIndicator()));
          case DetailScreenStatus.success:
            return   Container(
              color: Colors.white,
              child: SafeArea(
                child: Scaffold(
                    backgroundColor: Colors.white,
                    appBar: AppBar(
                      backgroundColor: Colors.white,
                      centerTitle: true,
                      iconTheme: const IconThemeData(color: Colors.black),
                      title:  Text(state.movieDetails!.name!, style: const TextStyle(color: Colors.black, fontSize: 18.0),),
                      elevation: 0.0,
                    ),
                    body:Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15,bottom: 20),
                        child: detailScreenList(context,state.movieDetails!)
                    ),

                ),
              ),
            );
          case DetailScreenStatus.failure:
            return const Center(child: Text("Failed to load"));

        }
      },

    );


  }
}







