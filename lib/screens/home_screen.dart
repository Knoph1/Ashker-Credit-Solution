import 'package:ashiiker_cs/models/product.dart';
import 'package:flutter/material.dart';

//import '../services/api_services.dart';
import '../widgets/product_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> _products = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    try {
      //final products = await ApiService().getProducts();
      setState(() {
       // _products = products;
        _isLoading = false;
      });
    } catch (e) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BNPL App'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ProductList(products: _products),
    );
  }
}