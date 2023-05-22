import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailTVShowPage extends StatefulWidget {
  final Map<String, dynamic> tvShow;
  final bool isFavorite;

  DetailTVShowPage({required this.tvShow, required this.isFavorite});

  @override
  _DetailTVShowPageState createState() => _DetailTVShowPageState();
}

class _DetailTVShowPageState extends State<DetailTVShowPage> {
  bool _isFavorite = false;
  List<dynamic> _genres = [];

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
    _fetchGenres();
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  void _fetchGenres() async {
    final http.Response response = await http.get(
      Uri.parse('https://api.themoviedb.org/3/genre/tv/list?api_key=481bd6077b5ecae8559330454a45470a'),
    );
    final Map<String, dynamic> responseBody = jsonDecode(response.body);
    setState(() {
      _genres = responseBody['genres'];
    });
  }

  List<String> getGenres() {
    List<String> genreNames = [];
    if (_genres.isNotEmpty) {
      for (var genreId in widget.tvShow['genre_ids']) {
        final genre = _genres.firstWhere((genre) => genre['id'] == genreId, orElse: () => null);
        if (genre != null) {
          genreNames.add(genre['name']);
        }
      }
    }
    return genreNames;
  }

  @override
  Widget build(BuildContext context) {
    final List<String> genreNames = getGenres();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tvShow['name']),
        backgroundColor: Colors.blue[900],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.network(
              'https://image.tmdb.org/t/p/w500${widget.tvShow['backdrop_path']}',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Genre: ${genreNames.isNotEmpty ? genreNames.join(', ') : 'N/A'}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              widget.tvShow['overview'],
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Vote Average: ${widget.tvShow['vote_average']}',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                _toggleFavorite();
                Navigator.pop(context, _isFavorite);
              },
              child: Text(_isFavorite ? 'Remove from Favorites' : 'Add to Favorites'),
            ),
          ),
        ],
      ),
    );
  }
}
