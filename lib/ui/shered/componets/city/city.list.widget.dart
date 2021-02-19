import 'package:card/models/cities.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../loader.widget.dart';
import 'package:card/ui/shered/componets/city/city.card.widget.dart';

class CityList extends StatelessWidget {
  final List<CitiesModel> city;

  CityList({@required this.city});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 500,
      // width: 500,
      child: Loader(
        object: city,
        callback: list,
      ),
    );
  }

  Widget list() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(city.length, (index) {
        CitiesModel item = city[index];
        return CityCard(
          item: item,
        );
      }),
    );
    // GridView.count(
    //   crossAxisCount: 1,
    //   scrollDirection: Axis.horizontal,
    //   children: List.generate(city.length, (index) {
    //     CitiesModel item = city[index];
    //     return CityCard(
    //       item: item,
    //     );
    //   }),
    // );
  }
}
