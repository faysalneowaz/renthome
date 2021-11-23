import 'package:flutter/material.dart';
import 'package:homerent/model/city.dart';

class AptListProvider extends ChangeNotifier {
  List<City> list = [
    City(
        "Alexandria, Sydney",
        "https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YXBhcnRtZW50fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80",
        "The Den Apartment",
        700.0),
    City(
        "Alexandria, Sydney",
        "https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YXBhcnRtZW50fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80",
        "The Den Apartment",
        800.0),
    City(
        "Alexandria, Sydney",
        "https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YXBhcnRtZW50fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80",
        "The Den Apartment",
        900.0),
    City(
        "Alexandria, Sydney",
        "https://images.pexels.com/photos/2077937/pexels-photo-2077937.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        "The Den Apartment",
        600.0),
    City(
        "Alexandria, Sydney",
        "https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YXBhcnRtZW50fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80",
        "The Den Apartment",
        670.0)
  ];

  addItem(String cityName, String imgUrl, String aptName, double price) async {
    City item = City(cityName, imgUrl, aptName, price);
    list.add(item);
    notifyListeners();
  }
}
