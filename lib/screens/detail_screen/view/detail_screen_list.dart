part of 'detail_screen.dart';

Widget detailScreenList(BuildContext ctxt, MovieDetails movieDetails) {

  print(movieDetails.thumbnail!);
  print(movieDetails.thumbnail!.replaceAll("/thumb/", "/medium/"));

  return ListView(
    physics: const BouncingScrollPhysics(),
    children: [
      ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: CachedNetworkImage(
            width: MediaQuery.of(ctxt).size.width,
            height: MediaQuery.of(ctxt).size.width + 100,
            fit: BoxFit.fill,
            imageUrl: movieDetails.thumbnail!.replaceAll("/thumb/", "/medium/"),
            errorWidget: (context, url, error) =>
                Container(
                  width: MediaQuery.of(ctxt).size.width,
                  height: MediaQuery.of(ctxt).size.width + 100,
                  color: Colors.grey.shade500,
                ),
          ),
      ),
      movieDetailing(ctxt, movieDetails)
    ],
  );
}

Widget movieDetailing(BuildContext ctx, MovieDetails movieDetails) {
  return Padding(
    padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
    child: ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        TextClass().setText(movieDetails.name ?? "N/A",
            maxLines: 3, fontWeight: FontWeight.w600, fontSize: 16),
        movieDetails.year == "" || movieDetails.year == null
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextClass().setText("(${movieDetails.year})",
                    fontWeight: FontWeight.w600, fontSize: 14),
              ),

        movieDetails.description == "" || movieDetails.description == null
            ? const SizedBox()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  separator(),
                  TextClass().setText("Description :",
                      fontWeight: FontWeight.w600, fontSize: 15),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8, top: 2),
                    child: TextClass().setText(
                        movieDetails.description ?? "N/A",
                        fontWeight: FontWeight.w300,
                        fontSize: 14),
                  ),
                ],
              ),
        separator(),
        movieDetails.mainStar == "" || movieDetails.mainStar == null
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.only(bottom: 5, top: 5),
                child: Row(
                  children: [
                    TextClass().setText("Main Star : ",
                        fontWeight: FontWeight.w600, fontSize: 15),
                    TextClass().setText(movieDetails.mainStar ?? "N/A",
                        fontWeight: FontWeight.w400, fontSize: 14),
                  ],
                )),
        movieDetails.director == "" || movieDetails.director == null
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: Row(
                  children: [
                    TextClass().setText("Director : ",
                        fontWeight: FontWeight.w600, fontSize: 15),
                    TextClass().setText(movieDetails.director ?? "N/A",
                        fontWeight: FontWeight.w400, fontSize: 14),
                  ],
                )),
        separator(),
        movieDetails.genres == null
            ? const SizedBox()
            : movieDetails.genres!.isEmpty
                ? const SizedBox()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextClass().setText("Genres : ",
                          fontWeight: FontWeight.w600, fontSize: 15),
                      movieGenresGrid(movieDetails),
                    ],
                  )
      ],
    ),
  );
}

Widget movieGenresGrid(MovieDetails movieDetails) {
  return Padding(
    padding: const EdgeInsets.only(top: 5),
    child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 7,
      ),
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: movieDetails.genres!.length,
      itemBuilder: (context, i) {
        return SizedBox(
          height: 20,
          child: Row(
            children: [
              const MyBullet(),
              TextClass()
                  .setText(movieDetails.genres![i], fontWeight: FontWeight.w400, fontSize: 12),
            ],
          ),
        );
      },
    ),
  );
}

Widget separator() {
  return Padding(
    padding: const EdgeInsets.only(left: 2, right: 2, bottom: 10, top: 5),
    child: Container(color: Colors.grey, height: 0.3),
  );
}
