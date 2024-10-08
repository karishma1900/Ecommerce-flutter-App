import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:ecommerce/models/product.dart';

class ApiService {
  final String url = 'https://fakestoreapi.com/products';

  Future<List<Product>> fetchProducts() async{
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      List<dynamic> body = json.decode(response.body);
      return body.map((dynamic item) => Product.fromJson(item)).toList();

    }else{
      throw Exception('Failed to load products');
    }
  }

}