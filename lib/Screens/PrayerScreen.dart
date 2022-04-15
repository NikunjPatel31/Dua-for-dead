import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Values/Strings.dart';

class PrayerScreen extends StatelessWidget {
  final int language;
  const PrayerScreen({Key? key, this.language = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: CarouselSlider.builder(
              options: CarouselOptions(
                height: double.infinity,
                enlargeCenterPage: true,
              ),
              itemCount: Strings.bodyList.length,
              itemBuilder: (context, index, realindex) {
                return Center(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Container(
                    height: double.infinity,
                    color: Colors.grey,
                    padding: EdgeInsets.symmetric(
                      horizontal: 60,
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: EdgeInsets.only(top: 30),
                            child: Text((() {
                              if (language == 2) {
                                return Strings.bodyListGujarati[index];
                              } else if (language == 3) {
                                return Strings.bodyListHindi[index];
                              } else {
                                return Strings.bodyList[index];
                              }
                            })())),
                        Container(
                          child: Container(
                              padding: EdgeInsets.only(bottom: 30),
                              child: Text((() {
                                if (language == 2) {
                                  return Strings.footerListGujarati[index];
                                } else if (language == 3) {
                                  return Strings.footerListHindi[index];
                                } else {
                                  return Strings.footerList[index];
                                }

                                return "anything but true";
                              })())),
                        ),
                      ],
                    ),
                  ),
                ));
              }),
        ),
      ),
    );
  }
}
