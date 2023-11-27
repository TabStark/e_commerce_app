import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/itemsdetail.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class showProductList extends StatefulWidget {
  final AsyncSnapshot<QuerySnapshot> StreamSnapshot;
  String newuid;
  String newmainCollection;
  String newproduct_name;
  showProductList(this.StreamSnapshot, this.newmainCollection, this.newuid,
      this.newproduct_name,
      {super.key});

  @override
  State<showProductList> createState() => _showProductListState();
}

class _showProductListState extends State<showProductList> {
  late String uid;
  late String mainCollection;
  late String product_name;
  @override
  Widget build(BuildContext context) {
    final AsyncSnapshot<QuerySnapshot> newStreamSnapshot =
        widget.StreamSnapshot;
    setState(() {
      uid = widget.newuid;
      mainCollection = widget.newmainCollection;
      product_name = widget.newproduct_name;
    });

    return Scaffold(
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overScroll) {
          overScroll.disallowIndicator();
          return false;
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Theme.of(context).primaryColorLight,
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
              expandedHeight: 50,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background:
                    Container(color: Theme.of(context).primaryColorLight),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 20,
              ),
            ),
            SliverList.builder(
                itemCount: newStreamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      newStreamSnapshot.data!.docs[index];
                  return InkWell(
                    // onTap: () {
                    //   print(product_name);
                    // },
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ItemDetail(documentSnapshot,
                                mainCollection, uid, product_name))),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          height: 180,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  width: 180,
                                  child:
                                      Image.network(documentSnapshot['img'])),
                              Container(
                                  width: 200,
                                  height: 150,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            color: Theme.of(context)
                                                .primaryColorLight),
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
                        Divider()
                      ],
                    ),
                 
                  );
                })
          ],
        ),
      ),
    );
  }
}
