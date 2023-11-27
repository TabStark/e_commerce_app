import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class carsoule extends StatefulWidget {
  const carsoule({super.key});

  @override
  State<carsoule> createState() => _carsouleState();
}

class _carsouleState extends State<carsoule> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CarouselSlider(
            items: [
              Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          image: NetworkImage(
                            "https://i.ytimg.com/vi/xqyUdNxWazA/maxresdefault.jpg",
                          ),
                          fit: BoxFit.cover))),
              Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          image: NetworkImage(
                            "https://i.ytimg.com/vi/6Ij9PiehENA/maxresdefault.jpg",
                          ),
                          fit: BoxFit.cover))),
              Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          image: NetworkImage(
                            "https://i.ytimg.com/vi/uJ235iTBkh0/maxresdefault.jpg",
                          ),
                          fit: BoxFit.cover))),
              Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          image: NetworkImage(
                            "https://i.ytimg.com/vi/ql6mhhHCldY/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLC8ZbXFJGXFI0s-aKIwpcy1q8CkkA",
                          ),
                          fit: BoxFit.cover)))
            ],
            options: CarouselOptions(
                height: 200,
                aspectRatio: 16 / 9,
                autoPlay: true,
                enlargeCenterPage: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(seconds: 2),
                viewportFraction: 0.8))
      ],
    );
  }
}
