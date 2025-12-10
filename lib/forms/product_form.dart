import 'package:flutter/material.dart';
import '../interfaces/product.dart';
import '../services/product_service.dart';

class ProductFormPage extends StatefulWidget {
  final Product? product; // null = create mode

  ProductFormPage({this.product});

  @override
  _ProductFormPageState createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  final ProductService service = ProductService();

  late TextEditingController nameController;
  late TextEditingController priceController;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: widget.product?.name ?? '');
    priceController =
        TextEditingController(text: widget.product?.price.toString() ?? '');
  }

  @override
  Widget build(BuildContext context) {
    bool isEdit = widget.product != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? "Edit Product" : "Create Product"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Name
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Product Name"),
                validator: (value) =>
                value!.isEmpty ? "Name is required" : null,
              ),

              // Price
              TextFormField(
                controller: priceController,
                decoration: InputDecoration(labelText: "Price"),
                keyboardType: TextInputType.number,
                validator: (value) =>
                value!.isEmpty ? "Price is required" : null,
              ),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Cancel button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                    child: Text("Cancel"),
                    onPressed: () => Navigator.pop(context),
                  ),

                  // Save button
                  ElevatedButton(
                    child: Text("Save"),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final product = Product(
                          id: widget.product?.id,
                          name: nameController.text,
                          price: double.parse(priceController.text),
                        );

                        if (isEdit) {
                          await service.updateProduct(product);
                        } else {
                          await service.createProduct(product);
                        }

                        Navigator.pop(context, true); // back to list
                      }
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
