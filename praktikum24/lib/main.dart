import 'package:flutter/material.dart';
// import 'package:praktikum24/widgets/trending.dart';
// import 'package:praktikum24/utils/text.dart';
import 'package:tmdb_api/tmdb_api.dart';

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
  final String readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzYzU0Mzc2OWNmODcwN2E5ZWFmMDI5YmQ2NWIyZGNhOCIsInN1YiI6IjYzMTg1MGE4OGRkYzM0MDA3ZmExOWE0ZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.FMzA_Q3EtCuAkc8Ji-dcOofhQdVO6QgBsN2ujsFZhWk  ';
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
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
          // title: modified_text(text: 'Flutter Movie App ❤️'),
          backgroundColor: Colors.transparent,
        ),
        body: ListView(
          children: [
            // TV(tv: tv),
            // TrendingMovies(
            //   trending: trendingmovies,
            // ),
            // TopRatedMovies(
            // toprated: topratedmovies,
            // ),
          ],
        ));
  }
}
