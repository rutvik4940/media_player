import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:media_player/screen/video/provider/video_provider.dart';
import 'package:provider/provider.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({Key? key}) : super(key: key);

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoProvider? providerR;
  VideoProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerR = context.read<VideoProvider>();
    providerW = context.watch<VideoProvider>();
    return Column(
      children: [
        SizedBox(
          height: 220,
          child: CarouselSlider.builder(
            options: CarouselOptions(
              height: 200,
              autoPlay: true,
              enlargeCenterPage: false,
              initialPage: 0,
              viewportFraction: 0.9,
              onPageChanged: (index, reason) {
                providerR!.changeVideoIndex(index);
              },
            ),
            itemCount: providerR!.videolist.length,
            itemBuilder: (context, index, realIndex) => InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  'videoplay',
                );
                providerR!.changeVideoIndex(index);
              },
              child: Image.asset("${providerW!.videolist[index].image}",
                  fit: BoxFit.cover, height: 200, width: 200),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            providerR!.videolist.length,
            (index) => Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      index == providerR!.index ? Colors.black : Colors.grey),
              margin: EdgeInsets.all(2),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: providerR!.videolist.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  'videoplay',
                );
                providerR!.changeVideoIndex(index);
              },
              child: Container(
                height: 70,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      "${providerW!.videolist[index].image}",
                      height: 70,
                      width: 70,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("${providerW!.videolist[index].name}"),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
