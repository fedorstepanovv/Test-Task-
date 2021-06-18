import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CountryCard extends StatelessWidget {
  final String name;
  final String subregion;
  final String alpha2code;
  final String flagUrl;
  // final Function onTap;
  const CountryCard(
      {Key key,
      @required this.name,
      @required this.subregion,
      @required this.alpha2code,
      @required this.flagUrl,
    })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onTap,
        
        child: Container(
          color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(name),
                Text(subregion),
                Text(alpha2code),
                SvgPicture.network(flagUrl,height: 50,width: 50,)
              ],
            ),
          ),
        ),
    );
  }
}
