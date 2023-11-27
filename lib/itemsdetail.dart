import 'package:e_commerce_app/itemsdetail.dart';
import 'package:e_commerce_app/showproductlist.dart';
import 'main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemDetail extends StatefulWidget {
  final DocumentSnapshot olddocumentSnapshot;
  String mainCollection;
  String uid;
  String product_name;
  ItemDetail(this.olddocumentSnapshot, this.mainCollection, this.uid,
      this.product_name,
      {super.key});

  @override
  State<ItemDetail> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  late String newMainCollection;
  late String newUID;
  late String newProduct_Name;
  @override
  Widget build(BuildContext context) {
    setState(() {});
    final DocumentSnapshot documentSnapshot = widget.olddocumentSnapshot;
    newMainCollection = widget.mainCollection;
    newUID = widget.uid;
    newProduct_Name = widget.product_name;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
            )),
        title: const Text(
          "Apple",
          style: TextStyle(
              color: Colors.white, fontFamily: "applefont", fontSize: 30),
        ),
        backgroundColor: Theme.of(context).primaryColorLight,
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overScroll) {
          overScroll.disallowIndicator();
          return false;
        },
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(31, 131, 130, 130),
                          borderRadius: BorderRadius.circular(50)),
                      margin: EdgeInsets.only(right: 15),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border_outlined,
                            size: 35,
                            color: Colors.black,
                          )),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(31, 131, 130, 130),
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: IconButton(
                              onPressed: () {},
                              icon: const FaIcon(
                                FontAwesomeIcons.shareFromSquare,
                                size: 25,
                                color: Colors.black,
                              )),
                        )),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                height: 400,
                child: Image.network(documentSnapshot['img']),
              ),

              // ITEM DETAIL
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 223, 241, 223),
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35))),
                child: Container(
                  padding:
                      EdgeInsets.only(left: 20, top: 20, bottom: 90, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: const Color.fromARGB(255, 223, 241, 223),
                        width: 300,
                        child: Text(
                          documentSnapshot['version'],
                          style: const TextStyle(
                              fontFamily: "applefont",
                              fontSize: 23,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        child: const Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 30,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 30,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 30,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 30,
                            ),
                            Icon(
                              Icons.star_border_outlined,
                              size: 30,
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Text(
                          "₹${documentSnapshot['price']}.00",
                          style: TextStyle(
                              fontSize: 27, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          "% offer",
                          style: TextStyle(
                              fontSize: 23,
                              fontFamily: "applefont",
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        height: 150,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              margin: EdgeInsets.only(top: 20),
                              width: 180,
                              height: 150,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color:
                                          Theme.of(context).primaryColorLight),
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "No Cost EMI",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "applefont",
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                      "Upto ₹2,363.98 EMI interest savings on Amazon Pay...",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: "applefont",
                                          fontWeight: FontWeight.w400)),
                                  Text("2 Offer >",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: "applefont",
                                          fontWeight: FontWeight.w600,
                                          color:
                                              Color.fromARGB(255, 6, 139, 247)))
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              margin: EdgeInsets.only(top: 20),
                              width: 180,
                              height: 150,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color:
                                          Theme.of(context).primaryColorLight),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "₹${documentSnapshot['addtocart']}",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "applefont",
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                      "10% off on Axis Bank Credit Card EMI Transactions, up...",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: "applefont",
                                          fontWeight: FontWeight.w400)),
                                  Text("2 Offer >",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: "applefont",
                                          fontWeight: FontWeight.w600,
                                          color:
                                              Color.fromARGB(255, 6, 139, 247)))
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Container(
          width: 150,
          child: FloatingActionButton.extended(
              backgroundColor: Colors.white,
              onPressed: () {
                _addtocartcondition(documentSnapshot);
              },
              label: documentSnapshot['addtocart']
                  ? Text(
                      "Remove Cart",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "applefont",
                          fontSize: 19,
                          fontWeight: FontWeight.w600),
                    )
                  : Text(
                      "Add to Cart",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "applefont",
                          fontSize: 19,
                          fontWeight: FontWeight.w600),
                    )),
        ),
        Container(
          width: 150,
          child: FloatingActionButton.extended(
            backgroundColor: Theme.of(context).primaryColorLight.withOpacity(1),
            onPressed: () {},
            label: Text(
              "Buy Now",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "applefont",
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ]),
    );
  }

  void _addtocartcondition(DocumentSnapshot? documentSnapshot) async {
    bool statur = documentSnapshot!['addtocart']; // Get the current value

    if (statur) {
      await FirebaseFirestore.instance
          .collection(newMainCollection)
          .doc(newUID)
          .collection(newProduct_Name)
          .doc(documentSnapshot.id)
          .update({"addtocart": false});
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Successfully Removed from Cart",
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height - 150,
            right: 20,
            left: 20),
      ));
      print("Updated addtocart to false");
    } else {
      await FirebaseFirestore.instance
          .collection(newMainCollection)
          .doc(newUID)
          .collection(newProduct_Name)
          .doc(documentSnapshot.id)
          .update({"addtocart": true});
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Successfully Added to Cart",
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height - 150,
            right: 20,
            left: 20),
      ));
      print("Updated addtocart to true");
    }
  }
}
