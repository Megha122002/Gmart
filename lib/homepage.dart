// ignore_for_file: prefer_const_constructors, unnecessary_new, unnecessary_null_comparison

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:majorproject/cart.dart';
import 'package:majorproject/config/config.dart';
import 'package:majorproject/login.dart';
import 'package:majorproject/model/ProductModel.dart';

class home2 extends StatefulWidget {
  const home2({super.key});

  @override
  State<home2> createState() => _home2State();
}

class _home2State extends State<home2> {
  final box = GetStorage();
  List<ProductModel> productModel = [];
  List<ProductModel> cart = [];
  bool loading = true;
  int? item_count = 0;
  String login_id = "";
  @override
  void initState() {
    loading = true;
    login_id = box.read('login_id');

    print("Hello World:" + login_id.toString());
    GmartApi.productDetails().then((response) {
      print(response);
      productModel = response;
      print(productModel.length);
      setState(() {
        loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 191, 246, 164),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 135, 239, 128),
                  Color.fromARGB(255, 12, 168, 17)
                ]),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  login_id == null
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Login(),
                                  ));
                            });
                          },
                          icon: Icon(Icons.login))
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              box.remove('login_id');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Login(),
                                  ));
                            });
                          },
                          icon: Icon(Icons.logout)),
                  Text(
                    "GMart",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Cart(cart: cart),
                            ));
                      },
                      icon: Badge(
                          badgeContent: Text(
                            cart.length.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          badgeStyle: BadgeStyle(
                            shape: BadgeShape.square,
                            badgeColor: Colors.blue,
                            padding: EdgeInsets.all(5),
                            borderRadius: BorderRadius.circular(4),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                            elevation: 0,
                          ),
                          child: Icon(Icons.shopping_cart)))
                ],
              ),
            ),
            loading
                ? Column(
                    children: [CircularProgressIndicator()],
                  )
                : Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: GridView.builder(
                      itemCount: productModel.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (BuildContext context, int index) {
                        ProductModel pmodel = productModel[index];
                        return new Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [Colors.yellow, Colors.red]),
                              borderRadius: BorderRadius.circular(25)),
                          padding: EdgeInsets.all(12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  height: 70,
                                  width: 50,
                                  child: Image.network(ApiDetails.ip +
                                      "/uploaded_img/" +
                                      pmodel.image)),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    pmodel.name,
                                    style: TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Rs." + pmodel.price,
                                    style: TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  if (login_id == "" || login_id == null) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Login(),
                                        ));
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          final TextEditingController qty =
                                              TextEditingController();
                                          return AlertDialog(
                                            title: Text("Add to cart"),
                                            content: Wrap(children: [
                                              TextFormField(
                                                autofocus: true,
                                                controller: qty,
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration:
                                                    const InputDecoration(
                                                        labelText: 'Qty'),
                                              )
                                            ]),
                                            actions: [
                                              TextButton(
                                                child: Text("Cancel"),
                                                onPressed: () {
                                                  Navigator.of(context,
                                                          rootNavigator:
                                                              true)
                                                      .pop();
                                                },
                                              ),
                                              TextButton(
                                                child: Text("Add"),
                                                onPressed: () {
                                                  var content = cart.where(
                                                      (items) =>
                                                          items.id ==
                                                          pmodel.id);
                                                  setState(() {
                                                    if (content.isEmpty) {
                                                      cart.add(ProductModel(
                                                          id: pmodel.id,
                                                          name: pmodel.name,
                                                          price:
                                                              pmodel.price,
                                                          image:
                                                              pmodel.image,
                                                          qty: qty.text));
                                                      print(cart);
                                                    } else {
                                                      cart[cart.indexWhere(
                                                              (items) =>
                                                                  items
                                                                      .id ==
                                                                  pmodel
                                                                      .id)] =
                                                          ProductModel(
                                                              id: pmodel.id,
                                                              name: pmodel
                                                                  .name,
                                                              price: pmodel
                                                                  .price,
                                                              image: pmodel
                                                                  .image,
                                                              qty:
                                                                  qty.text);
                                                      print("update" +
                                                          qty.text);
                                                    }
      
                                                    item_count =
                                                        cart.length;
                                                    Navigator.of(context,
                                                            rootNavigator:
                                                                true)
                                                        .pop();
                                                  });
                                                },
                                              ),
                                            ],
                                          );
                                        });
                                  }
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: ((context) => Cart())));
                                },
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Colors.white,
                                      Colors.grey
                                    ]),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  height: 40,
                                  width: 100,
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Add to Bag",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )
          ],
        ),
      ),
    ));
  }
}
