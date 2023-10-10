import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

@immutable
class Tasks {
  final String? name;
  final String? uID;
  //final String? address;
  //final double? rating;
  final String? date;
  //final double? price;
  //final String? leasePeriod;
  //final String? image;
  final bool? isFav;
  const Tasks({
    //this.image,
    this.uID,
    this.name,
    this.date,
    //this.address,
    //this.rating,
    //this.area,
    //this.price,
    //this.leasePeriod,
    this.isFav,
  });

  static List<Tasks> dummytasks = List.generate(
      4,
      (index) => Tasks(
          name: Faker().company.name(),
          uID: const Uuid().v1(),
          // image: Faker().image.image(
          //     width: 500,
          //     height: 500,
          //     keywords: ["house", "home", "rental", "city"]),
           date: Faker().date.toString(),
          // area: Random().nextInt(350),
          // rating: (Random().nextDouble() * 5),
          isFav: false,
          //leasePeriod: "Monthly",
      //    price: Random().nextInt(2000).toDouble()

      )
  );

  @override
  String toString() =>
      "{name:$name,uid:$uID,isFav:$isFav,}";
      //"{name:$name,uid:$uID,price:$price,leasePeriod:$leasePeriod,isFav:$isFav,area:$area,}";

  Tasks copyWith({double? price, bool? newStatus}) => Tasks(
      name: name,
      date: date,
      // area: area,
      // image: image,
      isFav: newStatus ?? isFav,
      // leasePeriod: leasePeriod,
      // price: price ?? this.price,
      // rating: rating,
      uID: uID);
}
