import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:media_player/screen/model/music_model.dart';
import 'package:media_player/screen/music/provider/music_provider.dart';
import 'package:provider/provider.dart';

class PlayMusicPlayerScreen extends StatefulWidget {
  const PlayMusicPlayerScreen({Key? key}) : super(key: key);

  @override
  State<PlayMusicPlayerScreen> createState() => _PlayMusicPlayerScreenState();
}

class _PlayMusicPlayerScreenState extends State<PlayMusicPlayerScreen> {

  HomeProvider? providerR;
  HomeProvider? providerW;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeProvider>().init();
  }
  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
       appBar: AppBar(
         title: Text("${providerW!.musiclist[providerW!.index].name}"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: 300,
                width: 300,
                child: Container(
                  child: Image.asset("${providerW!.musiclist[providerW!.index].image}"),
                ),
              ),
            ),
            SizedBox(height: 10,),
            PlayerBuilder.currentPosition(
              player:providerW!.assetsAudioPlayer,
              builder: (context, position) {
                return
                  Column(
                    children: [
                      Slider(value: position.inSeconds.toDouble(), onChanged: (value) {
                        providerR!.assetsAudioPlayer.seek(Duration(seconds: value.toInt()));
                      },
                        max: providerR!.totalduration.inSeconds.toDouble(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            Text("$position"),
                            Text("${providerR!.totalduration}"),
                         ],
                       ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Transform.rotate(
                            angle: (pi * 2) / 2,
                            child: IconButton(
                              onPressed: () {
                                providerW!.assetsAudioPlayer.previous();
                                providerR!.button(providerR!.index-1);
                              },
                              icon: Icon(Icons.double_arrow),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              if(providerW!.pPlay)
                              {
                                providerR!.assetsAudioPlayer.pause();
                                providerR!.changeMusic(false);
                              }
                              else
                              {
                                providerR!.assetsAudioPlayer.play();
                                providerR!.changeMusic(true);
                              }


                            },
                            icon: Icon(
                                providerR!.pPlay? Icons.pause: Icons.play_arrow  ),
                          ),
                          IconButton(
                            onPressed: () {
                              providerW!.assetsAudioPlayer.next();
                              providerR!.button(providerR!.index+1);

                            },
                            icon: Icon(Icons.double_arrow),
                          ),
                        ],
                      ),
                    ],
                  );
              },
            ),
          ],
        ),
      ),
    );
  }
}
