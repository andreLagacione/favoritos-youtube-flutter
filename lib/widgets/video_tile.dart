import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:youtubefavoritos/api.dart';
import 'package:youtubefavoritos/blocs/favorite_bloc.dart';
import 'package:youtubefavoritos/models/video.dart';

class VideoTile extends StatelessWidget {

  final Video video;
  VideoTile(this.video);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FlutterYoutube.playYoutubeVideoById(
            apiKey: API_KEY,
            videoId: video.id
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 16/9,
              child: Image.network(video.thumb, fit: BoxFit.cover,),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                        child: Text(
                          video.title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                          ),
                          maxLines: 2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          video.channel,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                StreamBuilder<Map<String, Video>>(
                  stream: BlocProvider.of<FavoriteBloc>(context).outFav,
                  initialData: {},
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return IconButton(
                        icon: Icon(
                            snapshot.data.containsKey(video.id) ?
                            Icons.star :
                            Icons.star_border
                        ),
                        color: Colors.white,
                        iconSize: 30,
                        onPressed: () {
                          BlocProvider.of<FavoriteBloc>(context).toggleFavorite(video);
                        },
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
