import 'package:flutter/material.dart';
import 'package:homerent/constant/constant.dart';
import 'package:homerent/model/apt_list_provider.dart';
import 'package:provider/provider.dart';

class ApartmentDetails extends StatelessWidget {
  String cityName;
  String imgUrl;
  String aptName;
  double price;

  ApartmentDetails(
      {Key? key,
      required this.cityName,
      required this.imgUrl,
      required this.aptName,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          color: Colors.white,
          margin: EdgeInsets.only(
            top: height * 0.01,
            left: width * 0.04,
            right: width * 0.04,
          ),
          child: Stack(
            // overflow: Overflow.visible,
            children: [
              TopImageNav(imgUrl: imgUrl),
              ImageViewDetails(
                  height: height,
                  width: width,
                  aptName: aptName,
                  price: price,
                  cityName: cityName),
              Description(height: height, width: width),
              ImageRow(height: height, width: width, imgUrl: imgUrl),
              Positioned(
                bottom: height * 0.01,
                child: Container(
                  height: height * 0.1,
                  width: width * 0.92,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: whiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: grayColor.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ]),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 60,
                        width: width * 0.2,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: primaryColor,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.call,
                            color: whiteColor,
                            size: 40,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 17,
                      ),
                      Container(
                        height: 60,
                        width: width * 0.6,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: primaryColor,
                          // gradient: LinearGradient(
                          //     begin: Alignment.centerLeft,
                          //     end: Alignment.centerRight,
                          //     colors: [whiteColor, primaryDarkColor]),
                        ),
                        child: const Center(
                            child: Text(
                          "Rent Now",
                          style: TextStyle(
                              fontSize: 22,
                              color: whiteColor,
                              fontWeight: FontWeight.w900),
                        )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageRow extends StatelessWidget {
  const ImageRow({
    Key? key,
    required this.height,
    required this.width,
    required this.imgUrl,
  }) : super(key: key);

  final double height;
  final double width;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: height * 0.12,
      child: Container(
        height: height * 0.1,
        width: width * 0.92,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: whiteColor,
            boxShadow: [
              BoxShadow(
                color: grayColor.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ]),
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                      image: NetworkImage(imgUrl), fit: BoxFit.cover),
                ),
              ),
              const SizedBox(
                width: 18,
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                      image: NetworkImage(imgUrl), fit: BoxFit.cover),
                ),
              ),
              const SizedBox(
                width: 18,
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                      image: NetworkImage(imgUrl), fit: BoxFit.cover),
                ),
              ),
              const SizedBox(
                width: 18,
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                      image: NetworkImage(imgUrl), fit: BoxFit.cover),
                ),
              ),
              const SizedBox(
                width: 18,
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                      image: NetworkImage(imgUrl), fit: BoxFit.cover),
                ),
                child: const Center(
                    child: Text(
                  "10+",
                  style: TextStyle(
                      color: whiteColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 20),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: height * 0.24,
      child: Container(
        height: height * 0.15,
        width: width * 0.92,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: whiteColor,
            boxShadow: [
              BoxShadow(
                color: grayColor.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ]),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Descriptions",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 12,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text:
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'),
                    TextSpan(
                        text: ' More..', style: TextStyle(color: primaryColor)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageViewDetails extends StatelessWidget {
  const ImageViewDetails({
    Key? key,
    required this.height,
    required this.width,
    required this.aptName,
    required this.price,
    required this.cityName,
  }) : super(key: key);

  final double height;
  final double width;
  final String aptName;
  final double price;
  final String cityName;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: height * 0.32,
        child: Container(
          height: height * 0.2,
          width: width * 0.82,
          margin: EdgeInsets.only(left: 22),
          decoration: BoxDecoration(
              color: cyanshadeColor.withOpacity(0.5),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          // color: cyanshadeColor.withOpacity(0.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(left: 15, right: 15, bottom: 20),
                child: Row(
                  children: [
                    Text(
                      aptName,
                      style: const TextStyle(
                          color: whiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                    const Spacer(),
                    Text(
                      "\$${price.toInt()}",
                      style: const TextStyle(
                          color: whiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15, bottom: 20),
                child: Text(
                  cityName,
                  style: const TextStyle(
                      color: whiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, bottom: 8),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                              color: cyanshadeColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: const Icon(
                              Icons.bedroom_parent_outlined,
                              color: whiteColor,
                              size: 18,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("3",
                            style: TextStyle(
                              fontSize: 18,
                              color: whiteColor,
                            ))
                      ],
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Row(
                      children: [
                        Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                              color: cyanshadeColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: const Icon(
                              Icons.bathroom,
                              color: whiteColor,
                              size: 18,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("2",
                            style: TextStyle(
                              fontSize: 18,
                              color: whiteColor,
                            ))
                      ],
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Row(
                      children: [
                        Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                              color: cyanshadeColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: const Icon(
                              Icons.photo_size_select_actual,
                              color: whiteColor,
                              size: 18,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("250m",
                            style: TextStyle(
                              fontSize: 18,
                              color: whiteColor,
                            ))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class TopImageNav extends StatelessWidget {
  const TopImageNav({
    Key? key,
    required this.imgUrl,
  }) : super(key: key);

  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.55,
      width: MediaQuery.of(context).size.width,
      // margin: const EdgeInsets.only(top: 35, left: 40),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        image: DecorationImage(image: NetworkImage(imgUrl), fit: BoxFit.cover),
      ),
      child: Row(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(left: 10, top: 10),
              decoration: BoxDecoration(
                  color: grayColor.withOpacity(0.5), shape: BoxShape.circle),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: whiteColor,
                  )),
            ),
          ),
          Spacer(),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.only(right: 10, top: 10),
              decoration: BoxDecoration(
                  color: grayColor.withOpacity(0.5), shape: BoxShape.circle),
              child: IconButton(
                  onPressed: () {
                    // Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.bookmark,
                    color: whiteColor,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
