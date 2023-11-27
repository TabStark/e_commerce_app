import 'package:e_commerce_app/itemsdetail.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddtoCart extends StatefulWidget {
  const AddtoCart({super.key});

  @override
  State<AddtoCart> createState() => _AddtoCartState();
}

class _AddtoCartState extends State<AddtoCart> {
  @override
  Widget build(BuildContext context) {
    String uid;
    String product_name;
    Stream<QuerySnapshot> getSubCollectionStream(
        String docId, String subCollectioName) {
      setState(() {});
      return FirebaseFirestore.instance
          .collection("Products")
          .doc(docId)
          .collection(subCollectioName)
          .snapshots();
    }

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.white,
              )),
          title: const Text(
            "Add to Cart",
            style: TextStyle(
                color: Colors.white, fontFamily: "applefont", fontSize: 25),
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
              children: [
                StreamBuilder(
                    stream:
                        getSubCollectionStream("hP5jyGaz8HCreUXyq7Hy", "phone"),
                    builder:
                        (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                      if (streamSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }
                      if (streamSnapshot.hasData) {
                        String uid = "hP5jyGaz8HCreUXyq7Hy";
                        String product_name = "phone";
                        return Container(
                            padding: const EdgeInsets.only(
                                top: 0, bottom: 20, left: 10, right: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: _gridview(streamSnapshot,
                                "hP5jyGaz8HCreUXyq7Hy", "phone"));
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
                StreamBuilder(
                    stream:
                        getSubCollectionStream("ThuDgDSM5zCF3vlv6SP2", "watch"),
                    builder:
                        (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                      if (streamSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }
                      if (streamSnapshot.hasData) {
                        String uid = "ThuDgDSM5zCF3vlv6SP2";
                        String product_name = "watch";
                        return Container(
                            padding: const EdgeInsets.only(
                                top: 0, bottom: 20, left: 10, right: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: _gridview(streamSnapshot,
                                "ThuDgDSM5zCF3vlv6SP2", "watch"));
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
                StreamBuilder(
                    stream: getSubCollectionStream(
                        "SHhaQAw3syfx1bWgHqs0", "laptop"),
                    builder:
                        (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                      if (streamSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }
                      if (streamSnapshot.hasData) {
                        String uid = "SHhaQAw3syfx1bWgHqs0";
                        String product_name = "laptop";
                        return Container(
                            padding: const EdgeInsets.only(
                                top: 0, bottom: 20, left: 10, right: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: _gridview(streamSnapshot,
                                "SHhaQAw3syfx1bWgHqs0", "laptop"));
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
                StreamBuilder(
                    stream: getSubCollectionStream(
                        "oqZOheAKXTBLHbBP25Rh", "airpods"),
                    builder:
                        (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                      if (streamSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }
                      if (streamSnapshot.hasData) {
                        String uid = "oqZOheAKXTBLHbBP25Rh";
                        String product_name = "airpods";
                        return Container(
                            padding: const EdgeInsets.only(
                                top: 0, bottom: 20, left: 10, right: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: _gridview(streamSnapshot,
                                "oqZOheAKXTBLHbBP25Rh", "airpods"));
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ],
            ),
          ),
        ));
  }

  _gridview(AsyncSnapshot<QuerySnapshot<Object?>> streamSnapshot, String newUID,
      String newName) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: streamSnapshot.data!.docs.length,
      itemBuilder: (context, index) {
        String uid = newUID;
        String product_name = newName;
        final DocumentSnapshot documentSnapshot =
            streamSnapshot.data!.docs[index];
        if (documentSnapshot['addtocart'] == true) {
          return Column(
            children: [
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ItemDetail(
                            documentSnapshot, "Products", uid, product_name))),
                child: Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  height: 180,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: 180,
                          child: Image.network(documentSnapshot['img'])),
                      Container(
                          width: 200,
                          height: 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                documentSnapshot['version'],
                                style: const TextStyle(
                                    fontFamily: "applefont",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "₹${documentSnapshot['price']}.00",
                                style: TextStyle(
                                    fontFamily: "applefont",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context).primaryColorLight),
                              ),
                              const Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  Icon(
                                    Icons.star_border_outlined,
                                  )
                                ],
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              ),
              Divider()
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
