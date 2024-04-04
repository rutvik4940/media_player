import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:media_player/screen/video/provider/video_provider.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class VideoPlayScreen extends StatefulWidget {
  const VideoPlayScreen({super.key});

  @override
  State<VideoPlayScreen> createState() => _VideoPlayScreenState();
}

class _VideoPlayScreenState extends State<VideoPlayScreen> {
  VideoProvider? providerR;
  VideoProvider? providerW;


  @override
  Widget build(BuildContext context) {
    providerR = context.read<VideoProvider>();
    providerW = context.watch<VideoProvider>();
    return Scaffold(
      appBar: AppBar(title: Text("Video Player")),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: Chewie(controller: providerW!.chewieController!),
          ),
          SizedBox(height: 10,),
         Padding(
           padding: const EdgeInsets.all(10 ),
           child: SingleChildScrollView(
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start ,
                children: [
                  Text("Name: ${providerW!.videolist[providerW!.index].name}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: () {
                      providerR!.videoPlayre();
                    },
                      child: Text("Description: ${providerW!.videolist[providerW!.index].description }",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
                ],
              ),
           ),
         )
        ],
      ),
    );
  }
}
