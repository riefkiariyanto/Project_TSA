import 'package:flutter/material.dart';
import 'package:praktikum24/utils/text.dart';
import 'package:praktikum24/widgets/trending.dart';
import 'package:http/http.dart' as http;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.green),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String apikey = '3c543769cf8707a9eaf029bd65b2dca8';
  final String baseUrl =
      'https://api.themoviedb.org/3/movie/550?api_key=3c543769cf8707a9eaf029bd65b2dca8';
  List trendingmovies = [];

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, baseUrl),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    print((trendingresult));
    setState(() {
      trendingmovies = trendingresult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: modified_text(
            text: 'Flutter Movie App',
            color: Colors.white,
            size: 26,
          ),
          backgroundColor: Colors.blueGrey,
        ),
        body: ListView(
          children: [
            TrendingMovies(
              trending: trendingmovies,
            ),
          ],
        ));
  }
}
