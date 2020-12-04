import 'package:flutter/material.dart';

class CartProduct extends StatefulWidget {
  @override
  _CartProductState createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  var productOnTheCart = [
    {
      "name": "Sepatu converse",
      "picture": "images/products/conversexoffw.jpg",
      "price": 95,
      "size": "42",
      "color": "black",
      "quantity": 1,  
    },
     {
      "name": "Jacket Semi",
      "picture": "images/products/jacketsemi.jpg",
      "price": 50,
      "size": "L",
      "color": "brown",
      "quantity": 3, 
    },
  ];
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: productOnTheCart.length,
      itemBuilder: (context, index){
        return SingleProductCart(
          productName: productOnTheCart[index]['name'],
          productPicture: productOnTheCart[index]['picture'],
          productPrice: productOnTheCart[index]['price'],
          productSize: productOnTheCart[index]['size'],
          productColor: productOnTheCart[index]['color'],
          productQuantity: productOnTheCart[index]['quantity'],
        );
      });
  }
}

class SingleProductCart extends StatelessWidget {
  final productName;
  final productPicture;
  final productPrice;
  final productSize;
  final productColor;
  final productQuantity;

  SingleProductCart({
    this.productName,
    this.productPicture,
    this.productPrice,
    this.productSize,
    this.productColor,
    this.productQuantity,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.0,
      child: Card(
        child: ListTile(
          leading: new Image.asset(productPicture, width: 100.0, height: 100.0,),
            title: new Text(productName),
            subtitle: new Column(
              children: [
                new Row(
                  children: [
                   Padding(
                     padding: const EdgeInsets.all(0.0),
                     child: new Text("Size:"),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(4.0),
                     child: new Text(productSize, style: TextStyle(color: Colors.pink),),
                   ),

                   Padding(
                     padding: const EdgeInsets.fromLTRB(17.0, 0.0, 0.0, 0.0),
                     child: new Text("Color:"),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(4.0),
                     child: new Text(productColor, style: TextStyle(color: Colors.red),), 
                   )
                  ],
                ),

                new Container(
                  alignment: Alignment.topLeft,
                  child: new Text("\$$productPrice", style: TextStyle(
                    fontSize: 17.0, fontWeight: FontWeight.bold,
                    color: Colors.red),),
                )
              ],
            ),
          
          trailing: new Column(
            children: [
              Expanded(child: new IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: (){}),),  
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                child: new Text("$productQuantity"),
              ),
              Expanded(child: new IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: (){}))
            ],
          ),
        ),
      ),
    );
  }
}