// ignore_for_file: sized_box_for_whitespace, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:majorproject/config/config.dart';
import 'package:majorproject/model/ProductModel.dart';

class Cart extends StatefulWidget {
  final List<ProductModel> cart;
  const Cart({super.key, required this.cart});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final box = GetStorage();
  String login_id="";
  @override
  void initState() {
    // TODO: implement initState
    login_id = box.read('login_id');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Text(widget.cart.length.toString()),
          ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => Divider(
                    thickness: 2,
                  ),
              itemBuilder: (context, index) {
                ProductModel pmodel = widget.cart[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 100,
                          child: Image.network(ApiDetails.ip +
                                          "/uploaded_img/" +
                                          pmodel.image),
                        ),
                        Text(
                          pmodel.name + " " + "Qnt : " + pmodel.qty.toString(),
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.cart.removeWhere(
                                    (element) => element.id == pmodel.id);
                              });
                            },
                            child: Icon(Icons.delete))
                      ],
                    ),
                  ),
                );
                // return ListTile(
                //   title: Text(
                //     pmodel.name + " " + "Qnt : " + pmodel.qty.toString(),
                //     style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                //   ),
                //   leading: Container(
                //     padding: EdgeInsets.only(right: 25),
                //     child: Image.network(
                //         "https://i.pinimg.com/originals/60/d0/fd/60d0fd6b94550d0d6f57131e3dcdf1fa.gif"),
                //   ),
                // );
              },
              itemCount: widget.cart.length),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.cart.clear();
                    });
                  },
                  child: Text("Delete Cart")),
              ElevatedButton(
                  onPressed: (() {


                    
                    widget.cart.forEach((element) {
                      print(element.id);
                      GmartApi.proceedtopay(element.id, element.qty.toString(), login_id.toString())
                          .then((response) => {print(response)});
                    });
                    setState(() {
                      widget.cart.clear();
                    });
                  }),
                  child: Text("Proceed to Pay"))
            ],
          )
        ],
      )),
    );
  }
}
