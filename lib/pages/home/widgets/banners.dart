import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:chnqoo_diary_mobile/constants/config.dart';
import 'package:flutter/material.dart';

class Banners extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        height: (MediaQuery.of(context).size.width - 32) * 0.25,
        viewportFraction: 0.66,
        enlargeCenterPage: true,
      ),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: '${Config.CDN}/mock/home-banner-${i}.jpg',
                  width: MediaQuery.of(context).size.width - 24,
                  height: double.maxFinite,
                  fit: BoxFit.fill,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
