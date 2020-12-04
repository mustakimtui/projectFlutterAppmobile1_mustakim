import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          Category(
            imageLocation: 'images/logolist/baju.png',
            imageCaption: 'Cloths',
          ),

          Category(
            imageLocation: 'images/logolist/sepatu.png',
            imageCaption: 'Shoes',
          ),

          Category(
            imageLocation: 'images/logolist/topi.png',
            imageCaption: 'Hats',
          ),

          Category(
            imageLocation: 'images/logolist/tas.png',
            imageCaption: 'Bags',
          ),

          Category(
            imageLocation: 'images/logolist/aksesoris.png',
            imageCaption: 'Accecoriss',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imageLocation;
  final String imageCaption;

  Category({this.imageLocation, this.imageCaption,});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: (){},
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(
              imageLocation,
              width: 100.0,
              height: 80.0,
            ),
            subtitle: Container(
              alignment:  Alignment.topCenter,
              child: Text(imageCaption, style: new TextStyle(fontSize: 12.0),),
            )
          ),
        ),
      ),
    );
  }
}

