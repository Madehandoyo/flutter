import 'package:flutter/material.dart';
//import terlebih dahulu halaman yang diperlukan
import './detailproduk.dart';

class ProdukList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appbar
        appBar: AppBar(title: Text("Product Listing")),
        //body untuk content
        //menampilkan list
        body: ListView(
          shrinkWrap: true,
          //padding
          padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
          //anggota dari list berupa widget children
          children: <Widget>[
            //GestureDetector untuk menangani gesture pengguna
            new GestureDetector(
              //listener  berupa klik 1x
              onTap: () {
                //navigator.push  untuk berpindah halaman
                Navigator.of(context).push(new MaterialPageRoute(
                  //pemanggilan class DetailProduk beserta pengiriman detail produk
                  builder: (BuildContext context) => DetailProduk(
                    name: "E-liquid Tokyo Banana Signature 60 ml ",
                    description: "Tersedia Nic 3 dan Nic 6",
                    price: 185000,
                    image: "liquid1.JPG",
                    star: 5,
                  ),
                ));
              },
              //memanggil class Productbox
              child: ProductBox(
                  //berisi parameter yang diperlukan di class ProductBox
                  name: "E-liquid Tokyo Banana Signature 60 ml ",
                  description: "Tersedia Nic 3 dan Nic 6",
                  price: 185000,
                  image: "liquid1.JPG",
                  star: 5),
            ),
            new GestureDetector(
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => DetailProduk(
                      name: "E-liquid Coconarilla 60 ml",
                      description: "Tersedia Nic 3 dan Nic 6",
                      price: 160000,
                      image: "liquid2.JPG",
                      star: 4,
                    ),
                  ));
                },
                child: ProductBox(
                    name: "E-liquid Coconarilla 60 ml",
                    description: "Tersedia Nic 3 dan Nic 6",
                    price: 160000,
                    image: "liquid2.JPG",
                    star: 4)),
            new GestureDetector(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => DetailProduk(
                    name: "E-liquid TokyoNarilla 60 ml",
                    description: "Tersedia Nic 3 dan Nic 6",
                    price: 160000,
                    image: "liquid3.JPG",
                    star: 3,
                  ),
                ));
              },
              child: ProductBox(
                  name: "E-liquid TokyoNarilla 60 ml",
                  description: "Tersedia Nic 3 dan Nic 6",
                  price: 160000,
                  image: "liquid3.JPG",
                  star: 3),
            ),
            new GestureDetector(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => DetailProduk(
                    name: "E-liquid Custard Creamy Puff 60 ml",
                    description: "Tersedia Nic 3 dan Nic 6",
                    price: 165000,
                    image: "liquid4.JPG",
                    star: 3,
                  ),
                ));
              },
              child: ProductBox(
                  name: "E-liquid Custard Creamy Puff 60 ml",
                  description: "Tersedia Nic 3 dan Nic 6",
                  price: 165000,
                  image: "liquid4.JPG",
                  star: 3),
            ),
            new GestureDetector(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => DetailProduk(
                    name: "POD SMOANT PASITO",
                    description: "Ready Warna Merah,Biru,Hitam,Abu-abu",
                    price: 350000,
                    image: "pod1.JPG",
                    star: 5,
                  ),
                ));
              },
              child: ProductBox(
                name: "POD SMOANT PASITO",
                description: "Ready Warna Merah,Biru,Hitam,Abu-abu",
                price: 350000,
                image: "pod1.JPG",
                star: 5,
              ),
            ),
          ],
        ));
  }
}

//menggunakan widget StatelessWidget
class ProductBox extends StatelessWidget {
  //deklarasi variabel yang diterima dari MyHomePage
  ProductBox(
      {Key key, this.name, this.description, this.price, this.image, this.star})
      : super(key: key);
  //menampung variabel yang diterima untuk dapat digunakan pada class ini
  final String name;
  final String description;
  final int price;
  final String image;
  final int star;
  final children = <Widget>[];

  Widget build(BuildContext context) {
    for (var i = 0; i < star; i++) {
      children.add(new Icon(
        Icons.star,
        size: 10,
        color: Colors.deepOrange,
      ));
    }
    //menggunakan widget container
    return Container(
        //padding
        padding: EdgeInsets.all(10),
        // height: 120,
        //menggunakan widget card
        child: Card(
            //membuat tampilan secara horisontal antar image dan deskripsi
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //children digunakan untuk menampung banyak widget
                children: <Widget>[
              Image.asset(
                "assets/appimages/" + image,
                width: 150,
              ),
              Expanded(
                  //child digunakan untuk menampung satu widget
                  child: Container(
                      padding: EdgeInsets.all(5),
                      //membuat tampilan secara vertikal
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        //ini isi tampilan vertikal tersebut
                        children: <Widget>[
                          //menampilkan variabel menggunakan widget text
                          Text(this.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          Text(this.description),
                          Text(
                            "Price: " + this.price.toString(),
                            style: TextStyle(color: Colors.red),
                          ),
                          //menampilkan widget icon  dibungkus dengan row
                          Row(
                            children: <Widget>[
                              Row(
                                children: children,
                              )
                            ],
                          )
                        ],
                      )))
            ])));
  }
}
