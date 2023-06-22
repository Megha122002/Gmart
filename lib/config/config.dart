// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';

import '../model/ProductModel.dart';
import 'package:http/http.dart' as http;

class ApiDetails {
  static const ip = "http://192.168.137.1/gmart";
  //static const ipAdmin = "http://192.168.43.64/devine/admin";
  //static const ip = "https://www.netdemi.com/retreat/apk";
  //static const ipAdmin = "https://www.netdemi.com/retreat/admin";
  //static const google_api_key = "AIzaSyCd3bb5M0MV8SPTeXd4av6YgQr3G-LmOV8";
}

class GmartApi {
  static Future productDetails() async {
    final uri = Uri.parse(ApiDetails.ip + '/productAPI.php');
    var response = await http.post(uri, body: {
      "SUBMIT": "PRODUCT",
    });
    //print("okkk");
    //print(response.body);
    var dataUser = json.decode(response.body);
    List<ProductModel> posts = List<ProductModel>.from(
        dataUser.map((model) => ProductModel.fromJson(model)));
    //print(posts);
    return posts;
  }

  static Future<Map<String, dynamic>> signin(
    String mobile,
    String password,
  ) async {
    final uri = Uri.parse(ApiDetails.ip + '/loginuser.php');
    var response = await http.post(uri, body: {
      "SUBMIT": "LOGIN",
      "mobile": mobile,
      "password": password,
    });
    print(response.body);
    Map<String, dynamic> map = json.decode(response.body);
    return map;
  }

  static Future proceedtopay(
    String product_id,
    String qty,
    String customer_id,
  ) async {
    final uri = Uri.parse(ApiDetails.ip + '/productAPI.php');
    var response = await http.post(uri, body: {
      "SUBMIT": "PROCEEDTOPAY",
      "product_id": product_id,
      "product_qty": qty,
      "customer_id": customer_id,
    });
    return response.body;
  }
}
