import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef RemoveFromFavoritesCallback = void Function(Map<String, dynamic> tvShow);

class FavoritePage extends StatefulWidget {
  final List<Map<String, dynamic>> favoriteTVShows;
  final RemoveFromFavoritesCallback removeFromFavorites;

  FavoritePage({required this.favoriteTVShows, required this.removeFromFavorites});

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late List<Map<String, dynamic>> _favoriteTVShows;

  @override
  void initState() {
    super.initState();
    _favoriteTVShows = List.from(widget.favoriteTVShows);
  }

  void _removeFromFavorites(Map<String, dynamic> tvShow) {
    setState(() {
      _favoriteTVShows.remove(tvShow);
    });
    widget.removeFromFavorites(tvShow);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite TV Shows'),
        backgroundColor: Colors.blue[900],
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: _favoriteTVShows.length,
          itemBuilder: (BuildContext context, int index) {
            final Map<String, dynamic> tvShow = _favoriteTVShows[index];
            return ListTile(
              leading: Image.network(
                'https://image.tmdb.org/t/p/w200${tvShow['poster_path']}',
                fit: BoxFit.cover,
              ),
              title: Text(tvShow['name']),
              subtitle: Text(tvShow['overview']),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => _removeFromFavorites(tvShow), // Menghapus TV show favorit
              ),
            );
          },
        ),
      ),
    );
  }
}
