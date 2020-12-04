import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

import 'package:riadissnapback_store/component/horizontal_listview.dart';
import 'package:riadissnapback_store/component/product.dart';
import 'package:riadissnapback_store/pages/cart.dart';
import 'package:riadissnapback_store/ui/plan_screen.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    Widget imageCarousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/carousel1.jpg'),
          AssetImage('images/carousel2.jpg'),
          AssetImage('images/carousel3.jpg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds:  1000),
        dotSize: 4.0,
        dotColor: Colors.pink,
        indicatorBgPadding: 2.0,
        dotBgColor: Colors.transparent,
      ),
    );

    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.pink,
        title: Text('RiadisSnapbak Shop'),
        actions: [
          new IconButton(
            icon: Icon(Icons.search, color: Colors.white,),
            onPressed: (){}
          ),
          new IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white,),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => new Cart()));
            }
          )
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: [
            //header nya menu tepi
            InkWell(
              onTap: (){},
                child: new UserAccountsDrawerHeader(
                accountName: Text('Kim Corry'),
                accountEmail: Text ('kimcorry@gmail.com'),
                currentAccountPicture: GestureDetector(
                  child: new CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                ),
                decoration: new BoxDecoration(
                  color: Colors.pink,
                ),
              ),
            ),
          //isinya menu tepi
          InkWell(
            onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context) => new HomePage()));
            },
            child: ListTile(
              title: Text('Home Page'),
              leading: Icon(Icons.home, color: Colors.red,),
            ),
          ),
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('My Account'),
              leading: Icon(Icons.person, color: Colors.red,),
            ),
          ),
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('My Orders'),
              leading: Icon(Icons.shopping_basket, color: Colors.red,),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => new Cart()));
            },
            child: ListTile(
              title: Text('Shoppping Cart'),
              leading: Icon(Icons.shopping_cart, color: Colors.red,),
            ),
          ),
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('Favorites'),
              leading: Icon(Icons.favorite, color: Colors.red,),
            ),
          ),
          InkWell(
            onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context) => PlanShop()));
            },
            child: ListTile(
              title: Text('Plan Shop'),
              leading: Icon(Icons.edit, color: Colors.red,),
            ),
          ),

          Divider(),
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings, color: Colors.blue,),
            ),
          ),
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('About'),
              leading: Icon(Icons.help, color: Colors.green,),
            ),
          ),
          ],
        ),
      ),

      body: new Column(
        children: [
          //carousellnya ya guys
          imageCarousel,

          //buat padding untuk listvew kategorinya
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text('Categories')
          ),

          //untuk list kategorinya dipanggil dari file horizontal_listview.dart
          HorizontalList(),

          //buat padding untuk lisgirdView 
          new Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: new Text('Recent product'))
          ),

          //untuk meenampilkan listGirdViewnya
          Flexible(child: Products()),

        ],
      ),
    );
  }
}