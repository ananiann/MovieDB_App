import 'package:flutter/material.dart';
import '../model/movie.dart';
import 'package:intl/intl.dart';

class MovieDetail extends StatelessWidget {
  final Movie selectedMovie;
  const MovieDetail({Key? key, required this.selectedMovie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String path;
    double screenWeight =
        MediaQuery.of(context).size.height;

    if (selectedMovie.posterPath != null) {
      path = 'https://image.tmdb.org/t/p/w500${selectedMovie.posterPath}';
    } else {
      path = 'https://image.freeimages.com/images/large-previews/5eb/movie-clapboard-118433';
    }

    var date = selectedMovie.releaseDate ?? "2000-01-01";
    var formatDate = DateTime.parse(date);

    date = DateFormat("d MMM yyyy").format(formatDate);

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMovie.title}'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16),
                height: screenWeight / 1.5,
                child: Image.network(path),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('${selectedMovie.overview}'),
              ),
              Row(
                children: [
                  const SizedBox(width: 16),
                  Text(
                    'Rating : ${selectedMovie.voteAverage}',
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    'Release Date: $date',
                  ),
                  const SizedBox(width: 16),
                ],
              ),
              const SizedBox(height: 16),
              const Text('Created by Aulia Rosa Zahrani - NIM : 21201176'),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ));
  }
}