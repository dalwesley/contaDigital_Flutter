import 'package:flutter/material.dart';
import 'package:card/blocs/home.bloc.dart';
import 'package:card/themes/light.theme.dart';
import 'package:card/ui/android/views/home-category.view.dart';
import 'package:card/ui/shered/componets/city/city.list.widget.dart';
import 'package:provider/provider.dart';

class HomeCityView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = Provider.of<HomeBloc>(context);
    var size = MediaQuery.of(context).size;
    return Container(
      color: backgroundColor,
      width: size.width,
      height: size.height,
      child: LayoutBuilder(
        builder: (_, constraints) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.black26,
                    offset: new Offset(1, 2.0),
                    blurRadius: 3,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/seta_card.png",
                          width: constraints.maxWidth * 0.08,
                        ),
                        Text(
                          " Onde Comprar ",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Image.asset(
                          "assets/images/seta_card.png",
                          width: constraints.maxWidth * 0.08,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10.0, bottom: 10.0),
                    child: Text(
                      "Selecione uma cidade para exibir as categorias onde você pode usar seu Plantão Card",
                      style: Theme.of(context).textTheme.subtitle2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    color: backgroundColor,
                    height: constraints.maxHeight * 0.075,
                    child: CityList(
                      city: bloc.cities,
                    ),
                  ),
                  Expanded(
                    child: HomeCategoryView(category: bloc.categories),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
