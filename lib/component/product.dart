import 'package:flutter/material.dart';
import 'package:riadissnapback_store/pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
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
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: SingleProduct(
            productName: productList[index]['name'],
            productPicture: productList[index]['picture'],
            productOldprice: productList[index]['old_price'],
            productPrice: productList[index]['price'],
            productDescription: productList[index]['description'],
          ),
        );
      }
    );
  }
}

class SingleProduct extends StatelessWidget {
  final productName;
  final productPicture;
  final productOldprice;
  final productPrice;
  final productDescription;

  SingleProduct({
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
                color: Colors.white70,
                child: new Row(
                  children: [
                    Container(
                      height: 40.0,
                      child: Expanded(
                        child: Text(productName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                      child: new Text("\$$productPrice",style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
                    ),
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