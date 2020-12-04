import 'package:flutter/material.dart';
import 'package:riadissnapback_store/component/product.dart';
import 'package:riadissnapback_store/ui/home.dart';
import 'package:riadissnapback_store/pages/cart.dart';


class ProductDetails extends StatefulWidget {
  final productDetailName;
  final productDetailPrice;
  final productDetailOldprice;
  final productDetailPicture;
  final productDetaildescription;

  ProductDetails({
    this.productDetailName,
    this.productDetailPrice,
    this.productDetailOldprice,
    this.productDetailPicture,
    this.productDetaildescription,
  });
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
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
          child: Text('Product Details')),
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

      body: new ListView(
        children: [
          new Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.productDetailPicture),
              ),
            footer: new Container(
              color: Colors.white70,
              child: ListTile(
                leading: new Text(widget.productDetailName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                title: new Row(
                  children: [
                    Expanded(
                      child: new Text("\$.${widget.productDetailOldprice}",
                      style: TextStyle(color:Colors.grey, decoration: TextDecoration.lineThrough),)
                    ),
                    Expanded(
                      child: new Text("\$.${widget.productDetailPrice}",
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.pink),)
                    )
                  ],
                ),
              ),
            ),
            ),
          ),
//button pilihan dropdown
          Row(
            children: [
              Expanded(
                child: MaterialButton(onPressed: (){
                  showDialog(context: context,
                  builder:(context){
                    return new AlertDialog(
                      title: new Text("Size"),
                      content: new Text("Choose Size"),
                      actions: [
                        new MaterialButton(onPressed: (){
                          Navigator.of(context).pop(context);
                        },
                        child: new Text("close"),)
                      ],
                    );
                  });
                },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                child: Row(
                  children: [
                    Expanded(
                      child: new Text("Size")
                    ),
                    Expanded(
                      child: new Icon(Icons.arrow_drop_down)
                    )
                  ],
                ),
                )
              ),

              Expanded(
                child: MaterialButton(onPressed: (){
                  showDialog(context: context,
                  builder:(context){
                    return new AlertDialog(
                      title: new Text("Color"),
                      content: new Text("Choose Color"),
                      actions: [
                        new MaterialButton(onPressed: (){
                          Navigator.of(context).pop(context);
                        },
                        child: new Text("close"),)
                      ],
                    );
                  });
                },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                child: Row(
                  children: [
                    Expanded(
                      child: new Text("Color")
                    ),
                    Expanded(
                      child: new Icon(Icons.arrow_drop_down)
                    )
                  ],
                ),
                )
              ),

              Expanded(
                child: MaterialButton(onPressed: (){
                  showDialog(context: context,
                  builder:(context){
                    return new AlertDialog(
                      title: new Text("Quantity"),
                      content: new Text("Choose Quantity"),
                      actions: [
                        new MaterialButton(onPressed: (){
                          Navigator.of(context).pop(context);
                        },
                        child: new Text("close"),)
                      ],
                    );
                  });
                },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                child: Row(
                  children: [
                    Expanded(
                      child: new Text("Quantity")
                    ),
                    Expanded(
                      child: new Icon(Icons.arrow_drop_down)
                    )
                  ],
                ),
                )
              ),

            ],
          ),

//button untuk diklik beli
          Row(
            children: [
              Expanded(
                child: MaterialButton(onPressed: (){},
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 0.2,
                child: new Text("Pesan")
                )
              ),

              new IconButton(icon: Icon(Icons.add_shopping_cart),color: Colors.blue, onPressed: (){}),
              new IconButton(icon: Icon(Icons.favorite_border),color: Colors.blue, onPressed: (){}),
            ],
          ),
          
          Divider(),
          new ListTile(
            title: new Text("Product Details"),
            subtitle: new Text(widget.productDetaildescription),
          ),
          Divider(),
      new Row(
        children: [
          Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
          child: new Text("Product name", style: TextStyle(color: Colors.grey),),),
          Padding(padding: EdgeInsets.all(5.0),
          child: new Text(widget.productDetailName),)
        ],
      ),

      new Row(
        children: [
          Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
          child: new Text("Product Brand", style: TextStyle(color: Colors.grey),),),
          Padding(padding: EdgeInsets.all(5.0),
          child: new Text("Brand X"),)
        ],
      ),
      new Row(
        children: [
          Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
          child: new Text("Product Condition", style: TextStyle(color: Colors.grey),),),
          Padding(padding: EdgeInsets.all(5.0),
          child: new Text("100% NEW"),)
        ],
      ),

      Divider(),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Text("Similar Product"),
      ),

      Container(
        height: 360.0,
        child: SimilarProduct(),
      )
        ],
      ),
    );
  }
}

class SimilarProduct extends StatefulWidget {
  @override
  _SimilarProductState createState() => _SimilarProductState();
}

class _SimilarProductState extends State<SimilarProduct> {
  var productList = [
    {
      "name": "Sepatu converse",
      "picture": "images/products/conversexoffw.jpg",
      "old_price": 120,
      "price": 95,
      "description": "Lorem Ipsum adalah contoh teks atau dummy dalam industri percetakan dan penataan huruf atau typesetting. Lorem Ipsum telah menjadi standar contoh teks sejak tahun 1500an, saat seorang tukang cetak yang tidak dikenal mengambil sebuah kumpulan teks dan mengacaknya untuk menjadi sebuah buku contoh huruf. Ia tidak hanya bertahan selama 5 abad, tapi juga telah beralih ke penataan huruf elektronik, tanpa ada perubahan apapun. Ia mulai dipopulerkan pada tahun 1960 dengan diluncurkannya lembaran-lembaran Letraset yang menggunakan kalimat-kalimat dari Lorem Ipsum, dan seiring munculnya perangkat lunak Desktop Publishing seperti Aldus PageMaker juga memiliki versi Lorem Ipsum"
    },
    {
      "name": "Jacket momotaro",
      "picture": "images/products/jacketmomo.jpg",
      "old_price": 250,
      "price": 180,
      "description": "Lorem Ipsum adalah contoh teks atau dummy dalam industri percetakan dan penataan huruf atau typesetting. Lorem Ipsum telah menjadi standar contoh teks sejak tahun 1500an, saat seorang tukang cetak yang tidak dikenal mengambil sebuah kumpulan teks dan mengacaknya untuk menjadi sebuah buku contoh huruf. Ia tidak hanya bertahan selama 5 abad, tapi juga telah beralih ke penataan huruf elektronik, tanpa ada perubahan apapun. Ia mulai dipopulerkan pada tahun 1960 dengan diluncurkannya lembaran-lembaran Letraset yang menggunakan kalimat-kalimat dari Lorem Ipsum, dan seiring munculnya perangkat lunak Desktop Publishing seperti Aldus PageMaker juga memiliki versi Lorem Ipsum"
    },
    {
      "name": "Kaos bape",
      "picture": "images/products/kaosbape.jpg",
      "old_price": 150,
      "price": 100,
      "description": "Lorem Ipsum adalah contoh teks atau dummy dalam industri percetakan dan penataan huruf atau typesetting. Lorem Ipsum telah menjadi standar contoh teks sejak tahun 1500an, saat seorang tukang cetak yang tidak dikenal mengambil sebuah kumpulan teks dan mengacaknya untuk menjadi sebuah buku contoh huruf. Ia tidak hanya bertahan selama 5 abad, tapi juga telah beralih ke penataan huruf elektronik, tanpa ada perubahan apapun. Ia mulai dipopulerkan pada tahun 1960 dengan diluncurkannya lembaran-lembaran Letraset yang menggunakan kalimat-kalimat dari Lorem Ipsum, dan seiring munculnya perangkat lunak Desktop Publishing seperti Aldus PageMaker juga memiliki versi Lorem Ipsum"
    },
    {
      "name": "Jam Rolex",
      "picture": "images/products/rolex.jpg",
      "old_price": 800,
      "price": 720,
      "description": "Lorem Ipsum adalah contoh teks atau dummy dalam industri percetakan dan penataan huruf atau typesetting. Lorem Ipsum telah menjadi standar contoh teks sejak tahun 1500an, saat seorang tukang cetak yang tidak dikenal mengambil sebuah kumpulan teks dan mengacaknya untuk menjadi sebuah buku contoh huruf. Ia tidak hanya bertahan selama 5 abad, tapi juga telah beralih ke penataan huruf elektronik, tanpa ada perubahan apapun. Ia mulai dipopulerkan pada tahun 1960 dengan diluncurkannya lembaran-lembaran Letraset yang menggunakan kalimat-kalimat dari Lorem Ipsum, dan seiring munculnya perangkat lunak Desktop Publishing seperti Aldus PageMaker juga memiliki versi Lorem Ipsum"
    },
    {
      "name": "Jacket Semi",
      "picture": "images/products/jacketsemi.jpg",
      "old_price": 70,
      "price": 50,
      "description": "jacket semi buatan anak indonseia asli coy, bahannya adem banget asli"
    },
    {
      "name": "Air jordan1",
      "picture": "images/products/jordan.jpg",
      "old_price": 1000,
      "price": 800,
      "description": "Lorem Ipsum adalah contoh teks atau dummy dalam industri percetakan dan penataan huruf atau typesetting. Lorem Ipsum telah menjadi standar contoh teks sejak tahun 1500an, saat seorang tukang cetak yang tidak dikenal mengambil sebuah kumpulan teks dan mengacaknya untuk menjadi sebuah buku contoh huruf. Ia tidak hanya bertahan selama 5 abad, tapi juga telah beralih ke penataan huruf elektronik, tanpa ada perubahan apapun. Ia mulai dipopulerkan pada tahun 1960 dengan diluncurkannya lembaran-lembaran Letraset yang menggunakan kalimat-kalimat dari Lorem Ipsum, dan seiring munculnya perangkat lunak Desktop Publishing seperti Aldus PageMaker juga memiliki versi Lorem Ipsum"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productList.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2
      ),
      itemBuilder: (BuildContext context, int index){
        return SingleProduct(
          productName: productList[index]['name'],
          productPicture: productList[index]['picture'],
          productOldprice: productList[index]['old_price'],
          productPrice: productList[index]['price'],
          productDescription: productList[index]['description'],
        );
      }
    );
  }
}

class SimilarSingleProduct extends StatelessWidget {
  final productName;
  final productPicture;
  final productOldprice;
  final productPrice;
  final productDescription;

  SimilarSingleProduct({
    this.productName,
    this.productPicture,
    this.productOldprice,
    this.productPrice,
    this.productDescription  
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: productName,
        child: Material(
          child: InkWell(
            onTap: ()=> 
            Navigator.of(context).push(
              new MaterialPageRoute(builder: (context)=> new ProductDetails(
                //pemanggilan nilai dari product detail keproduk untuk dihubungkan biar sama nantinya
                productDetailName: productName,
                productDetailPrice: productPrice,
                productDetailOldprice: productOldprice,
                productDetailPicture: productPicture,
                productDetaildescription: productDescription,
              ))),
            child: GridTile(
              footer: Container(
                color: Colors.white,
                child: new Row(
                  children: [
                    Expanded(
                      child: Text(productName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                    ),

                    new Text("\${$productPrice}",style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),)
                  ],
                )
              ),
              child: Image.asset(
                productPicture,
                fit: BoxFit.cover,
              )
            ),
          )
        ),
      ),
    ); 
  }
}