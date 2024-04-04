import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:media_player/screen/model/music_model.dart';

import 'package:provider/provider.dart';

import '../provider/music_provider.dart';

class MusicPlayerScreen extends StatefulWidget {
  const MusicPlayerScreen({Key? key}) : super(key: key);

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
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
                providerR!.changeMusicIndex(index);
              },
            ),
            itemCount: providerR!.musiclist.length,
            itemBuilder: (context, index, realIndex) => InkWell(
              onTap: () {
                providerR!.changeMusicIndex(index);
                Navigator.pushNamed(context, 'musicplay',);
              },
              child: Image.asset(
                  "${providerW!.musiclist[index].image}",
                  fit: BoxFit.cover,
                  height: 200,
                  width: 200),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              providerR!.musiclist.length,
              (index) => Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index == providerR!.index
                            ? Colors.black
                            : Colors.grey),
                    margin: EdgeInsets.all(2),
                  )),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: providerR!.musiclist.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                providerR!.changeMusicIndex(index);
                Navigator.pushNamed(context, 'musicplay',);
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
                      "${providerW!.musiclist[index].image}",
                      height: 70,
                      width: 50,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("${providerW!.musiclist[index].name}"),
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
