import 'package:flutter/material.dart';
import 'interfaces/product.dart';
import 'services/product_service.dart';
import 'forms/product_form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product CRUD',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ProductListPage(),
    );
  }
}

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final ProductService service = ProductService();
  late Future<List<Product>> products;

  @override
  void initState() {
    super.initState();
    products = service.getProducts();
  }

  void refreshProducts() {
    setState(() {
      products = service.getProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: FutureBuilder<List<Product>>(
        future: products,
        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error: ${snapshot.error}",
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No products found"));
          }

          final data = snapshot.data!;


          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final product = data[index];
              return ListTile(
                title: Text(product.name),
                subtitle: Text("\$${product.price}"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Edit
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () async {
                        // Navigate to product form with existing data
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductFormPage(
                              product: product,
                            ),
                          ),
                        );
                        refreshProducts();
                      },
                    ),
                    // Delete
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () async {
                        await service.deleteProduct(product.id!);
                        refreshProducts();
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),

      // CREATE BUTTON
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ProductFormPage(), // create mode
            ),
          );
          refreshProducts();
        },
      ),
    );
  }
}
