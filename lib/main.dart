import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cartelera de Cine'),
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 82, 85, 255),
        ),
        body: MovieList(),
      ),
    );
  }
}

class MovieList extends StatelessWidget {
  final List<Movie> movies = [
    Movie(
      title: 'El Conjuro 1',
      description: 'Temporada Siniesta',
      ageRating: 'M14',
      duration: '112 min',
      subtitleType: 'SUBTITULADA',
      format: '2D',
      times: ['20:50'],
      imageUrl: 'https://elcomercio.pe/resizer/v2/HBTR4HCI4NEF3BCYHZWU6GTOLU.jpg?auth=11a55112008a7faee6a3a395e9c0cc032f03385c76f488bea73e45f4f9f6b921&width=620&quality=75&smart=true',
    ),
    Movie(
      title: 'Terrifier 3',
      description: 'Payaso siniestro',
      ageRating: 'M14',
      duration: '125 min',
      subtitleType: 'DOBLADA',
      format: '2D',
      times: ['20:50', '22:30'],
      imageUrl: 'https://static.wikia.nocookie.net/doblaje/images/6/63/Terrifier_3-poster.jpg/revision/latest?cb=20240910005442&path-prefix=es',
    ),
    Movie(
      title: 'VENOM',
      description: 'El último baile',
      ageRating: 'M14',
      duration: '110 min',
      subtitleType: 'DOBLADA',
      format: '2D',
      times: ['20:50', '22:30', '00:15'],
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSo6_IxilO6D9kPfSZkiqnE97PzqPXQBfSxLQ&s',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return MovieCard(movie: movies[index]);
      },
    );
  }
}

class Movie {
  final String title;
  final String description;
  final String ageRating;
  final String duration;
  final String subtitleType;
  final String format;
  final List<String> times;
  final String imageUrl;

  Movie({
    required this.title,
    required this.description,
    required this.ageRating,
    required this.duration,
    required this.subtitleType,
    required this.format,
    required this.times,
    required this.imageUrl,
  });
}

class MovieCard extends StatelessWidget {
  final Movie movie;

  MovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Container(
                  width: 150,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(movie.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        movie.description,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 6),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              movie.ageRating,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            movie.duration,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                     Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(color: const Color.fromARGB(255, 194, 194, 194)),
                              borderRadius: BorderRadius.circular(4),
                              color: const Color.fromARGB(255, 194, 194, 194),
                            ),
                            child: Text(
                              movie.format,
                              style: TextStyle(color: Colors.white), 
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(color: const Color.fromARGB(255, 194, 194, 194)),
                              borderRadius: BorderRadius.circular(4),
                              color: const Color.fromARGB(255, 194, 194, 194),
                            ),
                            child: Text(
                              movie.subtitleType,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            'ASIENTO: ',
                            style: 
                            GoogleFonts.roboto(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'GENERAL',
                            style: GoogleFonts.roboto(
                              color: Colors.grey[600],
                              fontSize: 12,
                              fontWeight: FontWeight.bold, 
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              '*Los horarios aquí expuestos representan el inicio de cada función',
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 5),
            Wrap(
              spacing: 8.0,
              children: movie.times.map((time) {
                return Chip(
                  label: Text(
                    time,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 160, 152, 152),
                    ),
                  ),
                  backgroundColor: const Color.fromARGB(255, 167, 96, 96),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
