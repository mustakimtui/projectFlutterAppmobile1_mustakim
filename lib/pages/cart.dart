import 'package:flutter/material.dart';
import 'package:riadissnapback_store/ui/home.dart';

import 'package:riadissnapback_store/component/cart_product.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.pink,
        title: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
          },
          child: Text('Your Cart')),
        actions: [
          new IconButton(
            icon: Icon(Icons.search, color: Colors.white,),
            onPressed: (){}
          ),
        ],
      ),

      body: new CartProduct(),

      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(child: ListTile(
              title: new Text("Total:"),
              subtitle: new Text("\$230"),
            )),

            Expanded(
              child: new MaterialButton(
                onPressed: (){},
                child: new Text("Check Out", style: TextStyle(color: Colors.white),),
                color: Colors.blue,
                ),
            )
          ],
        ),
      ),
    );
  }
}