import 'package:flutter/material.dart';
import 'package:card/blocs/home.bloc.dart';
import 'package:card/models/cities.model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CityCard extends StatelessWidget {
  final CitiesModel item;

  CityCard({@required this.item});

  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = Provider.of<HomeBloc>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FlatButton(
          //     store.extractState == "15" ? Colors.white : backgroundColor,
          child: Container(
            child: Text(item.name,
                style: item.idCity.toString() == bloc.selectedCategory
                    ? Theme.of(context).textTheme.headline5
                    : Theme.of(context).textTheme.headline4),
          ),
          onPressed: () {
            bloc.changeCategoryByCity(
              item.idCity.toString(),
            );
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => HomeCategoryView(),
            //   ),
            // );
          },
        ),
      ],
    );

    // Card(
    //   shape: RoundedRectangleBorder(
    //     side: BorderSide(color: Colors.white70, width: 1),
    //     borderRadius: BorderRadius.circular(10),
    //   ),
    //   color: item.idCity.toString() == bloc.selectedCategory
    //       ? acceptColor
    //       : Colors.white,
    //   elevation: 1,
    //   child: FlatButton(
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.stretch,
    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
    //       children: [
    //         // Container(
    //         //   child: Text(
    //         //     item.idCity.toString(),
    //         //     style: item.idCity.toString() == bloc.selectedCategory
    //         //         ? TextStyle(
    //         //             fontSize: 15,
    //         //             color: backgroundColor,
    //         //             fontWeight: FontWeight.w700,
    //         //           )
    //         //         : TextStyle(fontSize: 15, color: primaryColor),
    //         //   ),
    //         // ),
    //         Text(
    //           item.name,
    //           style: item.idCity.toString() == bloc.selectedCategory
    //               ? TextStyle(
    //                   fontSize: 11,
    //                   color: backgroundColor,
    //                   fontWeight: FontWeight.w800,
    //                 )
    //               : TextStyle(fontSize: 12, color: primaryColor),
    //           textAlign: TextAlign.left,
    //           // overflow: TextOverflow.ellipsis,
    //           // maxLines: 3,
    //           // softWrap: true,
    //         ),
    //       ],
    //     ),
    //     //     Image.asset("assets/categories/${Settings.theme}/${item.name}.png"),
    //     onPressed: () {
    //       bloc.changeCategoryByCity(
    //         item.idCity.toString(),
    //       );
    //       // Navigator.push(
    //       //   context,
    //       //   MaterialPageRoute(
    //       //     builder: (context) => HomeCategoryView(),
    //       //   ),
    //       // );
    //     },
    //   ),
    // );
  }
}
