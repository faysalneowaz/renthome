import 'package:flutter/material.dart';
import 'package:homerent/constant/constant.dart';
import 'package:homerent/model/apt_list_provider.dart';
import 'package:homerent/model/city_model.dart';
import 'package:homerent/pages/details/apartment_details.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Consumer<SingleSelectCountry>(builder: (context, c, _) {
        return Container(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          child: DropdownButton<String>(
                              hint: Text("Location"),
                              onChanged: (n) {
                                c.selected = n!;
                              },
                              value: c.selected,
                              items: c.items.map((e) {
                                return DropdownMenuItem<String>(
                                    value: e, child: Text(e));
                              }).toList()),
                        ),
                        const Text.rich(
                          TextSpan(
                            style: TextStyle(
                              fontSize: 17,
                            ),
                            children: [
                              WidgetSpan(
                                child: Icon(
                                  Icons.location_on,
                                  color: primaryColor,
                                ),
                              ),
                              TextSpan(
                                  text: 'Sydney, ',
                                  style: TextStyle(
                                    color: cyanshadeColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  )),
                              TextSpan(
                                  text: 'Australia',
                                  style: TextStyle(color: cyanshadeColor))
                            ],
                          ),
                        )
                      ],
                    ),
                    Spacer(),
                    const Center(
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage(
                            "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  child: const Text(
                    "Recomended",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: secondaryColor),
                  ),
                ),
                Recomended(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Near by You",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: secondaryColor),
                    ),
                    Spacer(),
                    Text(
                      "See all",
                      style: TextStyle(color: primaryColor),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  // padding: EdgeInsets.all(20.0),
                  child:
                      Consumer<AptListProvider>(builder: (context, aptlist, _) {
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: aptlist.list.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.8,
                            margin: const EdgeInsets.only(
                                left: 10, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: grayColor.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 1,
                                    offset: Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ],
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                color: whiteColor),
                            child: Center(
                              child: Row(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    margin: EdgeInsets.only(
                                        left: 10, top: 10, bottom: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15)),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              aptlist.list[index].imgUrl),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 10, bottom: 10, top: 15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          aptlist.list[index].aptName,
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          aptlist.list[index].cityName,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  grayColor.withOpacity(0.5)),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                text:
                                                    "\$${aptlist.list[index].price.toInt()}",
                                                style: TextStyle(
                                                    color: primaryColor,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w700),
                                                children: <TextSpan>[
                                                  new TextSpan(
                                                      text: '/month',
                                                      style: TextStyle(
                                                          color: grayColor,
                                                          fontSize: 14,
                                                          fontWeight: FontWeight
                                                              .normal)),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 26,
                                            ),
                                            Center(
                                                child: Container(
                                                    height: 35,
                                                    width: 35,
                                                    decoration: BoxDecoration(
                                                        color: grayColor
                                                            .withOpacity(0.2),
                                                        // borderRadius: Border.all(Radius.circular(radius))
                                                        shape: BoxShape.circle),
                                                    child: Icon(
                                                      Icons.bookmark_rounded,
                                                      color: primaryColor,
                                                    )))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  }),
                  // color: Colors.red,
                ),
              ],
            ),
          ),
        );
      })),
    );
  }
}

class Recomended extends StatelessWidget {
  const Recomended({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.57,
      width: MediaQuery.of(context).size.width,
      child: Consumer<AptListProvider>(builder: (context, aptlist, _) {
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: aptlist.list.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  var aptdata =
                      Provider.of<AptListProvider>(context, listen: false)
                          .list[index];

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ApartmentDetails(
                              cityName: aptdata.cityName,
                              imgUrl: aptdata.imgUrl,
                              aptName: aptdata.aptName,
                              price: aptdata.price)));
                },
                child: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: MediaQuery.of(context).size.width * 0.7,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        boxShadow: [
                          BoxShadow(
                            color: grayColor.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width * 0.6,
                      margin: const EdgeInsets.only(top: 35, left: 40),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        image: DecorationImage(
                            image: NetworkImage(aptlist.list[index].imgUrl),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.3,
                      margin: const EdgeInsets.only(top: 45, left: 135),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                          color: grayColor.withOpacity(0.5)),
                      child: Center(
                        child: Text(
                          "\$" + "${aptlist.list[index].price.toInt()}",
                          style: const TextStyle(
                              fontSize: 20,
                              color: whiteColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 80,
                        left: 70,
                        child: Text(
                          aptlist.list[index].aptName,
                          style: const TextStyle(
                              fontSize: 20,
                              color: cyanshadeColor,
                              fontWeight: FontWeight.bold),
                        )),
                    Positioned(
                        bottom: 55,
                        left: 95,
                        child: Text(
                          aptlist.list[index].cityName,
                          style: const TextStyle(
                            fontSize: 14,
                            color: grayColor,
                          ),
                        )),
                  ],
                ),
              );
            });
      }),
    );
  }
}
