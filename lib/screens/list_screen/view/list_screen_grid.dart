part of 'list_screen.dart';

Widget listScreenGrid({required List<Movie> movieList, required BuildContext ctx}) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Padding(
      padding: const EdgeInsets.only(),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.69,
        ),
        itemCount: movieList.length,
        shrinkWrap: true,
        primary: false,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BlocProvider(
                        create: (_) =>
                            DetailScreenBloc(movieList[index].id.toString())
                              ..add(DetailScreenFetched()),
                        child: const DetailScreen())));
          },
          child: listScreenGridTile(index, movieList, ctx),
        ),
      ),
    ),
  );
}

Widget listScreenGridTile(int index, List<Movie> movieList, BuildContext ctxt) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8)),
            child: CachedNetworkImage(
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                imageUrl: movieList[index]
                    .thumbnail!
                    .replaceAll("/thumb/", "/medium/"),
                errorWidget: (context, url, error) => Container(
                      color: Colors.grey.shade500,
                    )),
          ),
          listScreenGridTileOverlay(),
          listScreenGridTileDetails(
              movieList[index].name!, movieList[index].year!)
        ],
      ),
    ),
  );
}

Widget listScreenGridTileDetails(String movieName, String year) {
  return Positioned(
      bottom: 10,
      left: 10,
      right: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextClass().setText(movieName,
              fontSize: 14,
              maxLines: 3,
              fontWeight: FontWeight.w600,
              textColor: Colors.white),
          TextClass().setText("(" + year + ")",
              fontSize: 12,
              fontWeight: FontWeight.w500,
              textColor: Colors.white),
        ],
      ));
}

Widget listScreenGridTileOverlay() {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(begin: Alignment.bottomRight, stops: const [
          0.1,
          0.75
        ], colors: [
          Colors.black.withOpacity(.9),
          Colors.black.withOpacity(.0)
        ])),
  );
}
