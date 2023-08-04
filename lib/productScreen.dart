import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _HomeScreen3State();
}

class _HomeScreen3State extends State<ProductScreen> {
  late List products = [];
  List img = ['lib/assets/keyboard.png',
  'lib/assets/samsung.png',
  'lib/assets/headphone sony.png',
  'lib/assets/mouse.png',
  'lib/assets/lenovo.png',
  'lib/assets/canon.png',
  'lib/assets/hp.png',
  'lib/assets/dell.png',
  'lib/assets/iphone.png',
  ];

  CollectionReference productref =
      FirebaseFirestore.instance.collection("Product");

  getData() async {
    var response = await productref.get();
    response.docs.forEach((element) {
      setState(() {
        products.add(element.data());
      });
    });
    print(products);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff44BCCF),
        appBar: AppBar(
          backgroundColor: Color(0xff44BCCF),
          elevation: 0,
          title: Text("Electronics Store"),
          centerTitle: false,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
        ),
        body: SafeArea(
            child: Column(children: [
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: Stack(children: [
            Container(
              margin: EdgeInsets.only(top: 70),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
            ),
            ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) => ProductCard(
                index,
              ),
            )
          ]))
        ])));
  }

  Widget ProductCard(int i) => Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        height: 190,
        //color: Colors.amber,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 166,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 15),
                        blurRadius: 25,
                        color: Colors.black12)
                  ]),
            ),
            Positioned(
                top: 0,
                left: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 160,
                  width: 200,
                  child: Image.asset(
                    img[i],
                    fit: BoxFit.cover,
                  ),
                )),
            Positioned(
              bottom: 0,
              right: 0,
              child: SizedBox(
                height: 130,
                width: 200,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        //"jnku",
                        "${products[i]['name']}",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Text(
                      //"ljnjk",
                      "${products[i]['type']}",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(22)),
                      child: Text(//"jhk",
                          "price: \$${products[i]['price']}"),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}

//class ProductCard extends StatelessWidget {
//   const ProductCard({
//     Key? key,
//     required this.i,
//   }) : super(key: key);

//   final int i;
//   //final Product product;

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       margin: EdgeInsets.symmetric(
//         horizontal: 20,
//         vertical: 10,
//       ),
//       height: 190,
//       //color: Colors.amber,
//       child: Stack(
//         alignment: Alignment.bottomCenter,
//         children: [
//           Container(
//             height: 166,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(22),
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                       offset: Offset(0, 15),
//                       blurRadius: 25,
//                       color: Colors.black12)
//                 ]),
//           ),
//           Positioned(
//               top: 0,
//               left: 0,
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 height: 160,
//                 width: 200,
//                 child: Image.asset(
//                   'lib/assets/printer.png',
//                   fit: BoxFit.cover,
//                 ),
//               )),
//           Positioned(
//             bottom: 0,
//             right: 0,
//             child: SizedBox(
//               height: 130,
//               width: size.width - 200,
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: Text(//"jnku",
//                       "${products[i]['name']}",
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   ),
//                   Text("ljnjk",
//                     //"${products[i]['type']}",
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
//                     decoration: BoxDecoration(
//                         color: Colors.amber,
//                         borderRadius: BorderRadius.circular(22)),
//                     child: Text("jhk",
//                       //"price: \$${products[i]['price']}"
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
