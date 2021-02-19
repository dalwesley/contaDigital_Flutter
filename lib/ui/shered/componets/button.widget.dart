import 'package:flutter/material.dart';

class TDButton extends StatelessWidget {
  final String text;
  final String image;
  final Function callback;
  final double width;

  TDButton({
    @required this.text,
    @required this.callback,
    this.image,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width != null ? width : 350,
      height: 40,
      decoration: BoxDecoration(
        // border: Border.all(color: backgroundColor),
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      child: FlatButton(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(text, style: Theme.of(context).textTheme.headline1),
            ),
            image != null
                ? Image.asset(
                    image,
                    width: 40,
                  )
                : SizedBox(),
            image != null
                ? SizedBox(
                    width: 10,
                  )
                : SizedBox(),
          ],
        ),
        onPressed: callback,
      ),
    );
  }
}
