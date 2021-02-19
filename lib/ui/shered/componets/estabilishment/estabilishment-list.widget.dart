import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:card/models/estabilishment.model.dart';
import 'package:card/ui/shered/componets/estabilishment/estabilishment-card.widget.dart';
import '../../loader.widget.dart';

class EstabilishmentList extends StatelessWidget {
  final List<EstabilishmentModel> estabilishment;

  EstabilishmentList({@required this.estabilishment});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 500,
      // width: 500,
      child: Loader(
        object: estabilishment,
        callback: list,
      ),
    );
  }

  Widget list() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.count(
        crossAxisCount: 3,
        children: List.generate(estabilishment.length, (index) {
          EstabilishmentModel item = estabilishment[index];
          return EstabilishmentCard(
            item: item,
          );
        }),
      ),
    );
  }
}
