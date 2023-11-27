import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/addtocart.dart';
import 'package:e_commerce_app/carsoule.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/itemsdetail.dart';
import 'package:e_commerce_app/navbar.dart';
import 'package:e_commerce_app/showproductlist.dart';
import 'package:e_commerce_app/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColorLight: Color.fromARGB(210, 0, 36, 17),
        useMaterial3: true,
      ),
      home: const splashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overScroll) {
          overScroll.disallowIndicator();
          return false;
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
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

            SliverPersistentHeader(
              delegate: _searchBar(),
              pinned: true,
            ),

            const SliverToBoxAdapter(
              child: const SizedBox(height: 10),
            ),

            // CAROUSEL
            SliverToBoxAdapter(
              child: Container(
                height: 300,
                width: double.infinity,
                child: carsoule(),
              ),
            ),

            const SliverToBoxAdapter(
              child: const SizedBox(height: 10),
            ),

            // PHONE
            SliverToBoxAdapter(
              child: Container(
                child: StreamBuilder(
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
                                color: Colors.green[100],
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 10, right: 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "New iPhone",
                                        style: TextStyle(
                                            fontFamily: "applefont",
                                            fontSize: 23,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      IconButton(
                                          onPressed: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      showProductList(
                                                          streamSnapshot,
                                                          "Products",
                                                          uid,
                                                          product_name))),
                                          icon: Icon(
                                            Icons.arrow_right_sharp,
                                            size: 40,
                                            color: Theme.of(context)
                                                .primaryColorLight,
                                          ))
                                    ],
                                  ),
                                ),
                                Container(
                                    child: _gridview(streamSnapshot,
                                        "hP5jyGaz8HCreUXyq7Hy", "phone"))
                              ],
                            ));
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),
            ),

            const SliverToBoxAdapter(
              child: const SizedBox(height: 10),
            ),

            // WATCH
            SliverToBoxAdapter(
              child: Container(
                child: StreamBuilder(
                  stream:
                      getSubCollectionStream("ThuDgDSM5zCF3vlv6SP2", "watch"),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (streamSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    if (streamSnapshot.hasData) {
                      String uid = "ThuDgDSM5zCF3vlv6SP2";
                      String product_name = "watch";
                      return Container(
                          padding: const EdgeInsets.only(
                              top: 0, bottom: 20, left: 20, right: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 10, right: 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "New Watch Series",
                                      style: TextStyle(
                                          fontFamily: "applefont",
                                          fontSize: 23,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    IconButton(
                                        onPressed: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    showProductList(
                                                        streamSnapshot,
                                                        "Products",
                                                        uid,
                                                        product_name))),
                                        icon: Icon(
                                          Icons.arrow_right_sharp,
                                          size: 40,
                                          color: Theme.of(context)
                                              .primaryColorLight,
                                        ))
                                  ],
                                ),
                              ),
                              Container(
                                  child: _gridview(streamSnapshot,
                                      "ThuDgDSM5zCF3vlv6SP2", "watch"))
                            ],
                          ));
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ),

            const SliverToBoxAdapter(
              child: const SizedBox(height: 10),
            ),

            // LAPTOP
            SliverToBoxAdapter(
              child: Container(
                child: StreamBuilder(
                  stream:
                      getSubCollectionStream("SHhaQAw3syfx1bWgHqs0", "laptop"),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (streamSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    if (streamSnapshot.hasData) {
                      String uid = "SHhaQAw3syfx1bWgHqs0";
                      String product_name = "laptop";
                      return Container(
                          padding: const EdgeInsets.only(
                              top: 0, bottom: 20, left: 20, right: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "New Apple MacBook",
                                      style: TextStyle(
                                          fontFamily: "applefont",
                                          fontSize: 23,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    IconButton(
                                        onPressed: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    showProductList(
                                                        streamSnapshot,
                                                        "Products",
                                                        uid,
                                                        product_name))),
                                        icon: Icon(
                                          Icons.arrow_right_sharp,
                                          size: 40,
                                          color: Theme.of(context)
                                              .primaryColorLight,
                                        ))
                                  ],
                                ),
                              ),
                              Container(
                                  width: double.infinity,
                                  height: 250,
                                  child: Center(
                                      child: _carsoule(streamSnapshot,
                                          "SHhaQAw3syfx1bWgHqs0", "laptop")))
                            ],
                          ));
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ),

            const SliverToBoxAdapter(
              child: const SizedBox(height: 10),
            ),

            // AIRPODS
            SliverToBoxAdapter(
              child: Container(
                child: StreamBuilder(
                  stream:
                      getSubCollectionStream("oqZOheAKXTBLHbBP25Rh", "airpods"),
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
                              top: 0, bottom: 60, left: 20, right: 5),
                          decoration: BoxDecoration(
                              color: Colors.green[100],
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "New Watch Series",
                                      style: TextStyle(
                                          fontFamily: "applefont",
                                          fontSize: 23,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    IconButton(
                                        onPressed: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    showProductList(
                                                        streamSnapshot,
                                                        "Products",
                                                        uid,
                                                        product_name))),
                                        icon: Icon(
                                          Icons.arrow_right_sharp,
                                          size: 40,
                                          color: Theme.of(context)
                                              .primaryColorLight,
                                        ))
                                  ],
                                ),
                              ),
                              Container(
                                  child: _gridviewOne(streamSnapshot,
                                      "oqZOheAKXTBLHbBP25Rh", "airpods"))
                            ],
                          ));
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),

      // FLOATING BUTTON
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Container(
        height: 60,
        color: Colors.white,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.home,
                  color: Colors.green[600],
                  size: 33,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.category_outlined,
                  size: 33,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.supervised_user_circle_outlined, size: 33)),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications_active_outlined, size: 33)),
            IconButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddtoCart())),
                icon: Icon(Icons.shopping_cart_outlined, size: 33))
          ],
        ),
      ),
    );
  }

// GRID VIEW
  _gridview(AsyncSnapshot<QuerySnapshot<Object?>> streamSnapshot, String uid,
      String productname) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: streamSnapshot.data!.docs.length,
      itemBuilder: (context, index) {
        String newUID = uid;
        String newProduct_Name = productname;
        final DocumentSnapshot documentSnapshot =
            streamSnapshot.data!.docs[index];
        return GridTile(
            child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(boxShadow: const [
            BoxShadow(color: Color.fromARGB(255, 1, 57, 3), blurRadius: 10)
          ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ItemDetail(
                        documentSnapshot, "Products", uid, newProduct_Name))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                  documentSnapshot["img"],
                  scale: 3.5,
                ),
                Text(
                  documentSnapshot["name"],
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ));
      },
    );
  }

// GRID VIEW ONE
  _gridviewOne(AsyncSnapshot<QuerySnapshot<Object?>> streamSnapshot, String uid,
      String productName) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: streamSnapshot.data!.docs.length,
      itemBuilder: (context, index) {
        String newUID = uid;
        String newProduct_Name = productName;
        final DocumentSnapshot documentSnapshot =
            streamSnapshot.data!.docs[index];
        return GridTile(
            child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(boxShadow: const [
            BoxShadow(color: Color.fromARGB(255, 1, 57, 3), blurRadius: 10)
          ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ItemDetail(
                          documentSnapshot,
                          "Products",
                          uid,
                          newProduct_Name,
                        ))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                  documentSnapshot["img"],
                  scale: 8,
                ),
                Text(
                  documentSnapshot["name"],
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ));
      },
    );
  }

  // CAROUSEL VIEW
  _carsoule(AsyncSnapshot<QuerySnapshot<Object?>> streamSnapshot, String uid,
      String productName) {
    return CarouselSlider.builder(
        itemCount: streamSnapshot.data!.docs.length,
        itemBuilder: (context, index, realIndex) {
          String newUID = uid;
          String newProduct_Name = productName;
          final DocumentSnapshot documentSnapshot =
              streamSnapshot.data!.docs[index];
          return Container(
            child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ItemDetail(
                            documentSnapshot,
                            "Products",
                            uid,
                            newProduct_Name,
                          ))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    // color: Colors.green,
                    height: 150,
                    child: Image.network(
                      documentSnapshot['img'],
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    documentSnapshot['name'],
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: "applefont"),
                  )
                ],
              ),
            ),
          );
        },
        options: CarouselOptions(
            height: 250,
            aspectRatio: 16 / 9,
            autoPlay: true,
            enlargeCenterPage: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(seconds: 2),
            viewportFraction: 0.8));
  }
}

class _searchBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      color: Theme.of(context).primaryColorLight,
      padding: EdgeInsets.all(10),
      child: Container(
        // margin: EdgeInsets.only(top: 100),
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.mic_none,
                  size: 30,
                  color: Theme.of(context).primaryColorLight,
                )),
            Container(
              padding: EdgeInsets.only(bottom: 5),
              width: 230,
              child: const TextField(
                decoration: InputDecoration(hintText: "Search"),
                scrollPadding: EdgeInsets.zero,
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  size: 30,
                  color: Theme.of(context).primaryColorLight,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.camera_alt_outlined,
                  size: 30,
                  color: Theme.of(context).primaryColorLight,
                ))
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 70.0;

  @override
  // TODO: implement minExtent
  double get minExtent => 70.0;

  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
