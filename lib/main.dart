import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:youtubefavoritos/blocs/favorite_bloc.dart';
import 'package:youtubefavoritos/blocs/videos_bloc.dart';
import 'package:youtubefavoritos/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: VideosBloc(),
      child: BlocProvider(
        bloc: FavoriteBloc(),
        child: MaterialApp(
          title: 'FlutterTube',
          debugShowCheckedModeBanner: false,
          home: Home(),
        ),
      )
    );
  }
}