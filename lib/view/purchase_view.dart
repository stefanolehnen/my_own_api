import 'package:flutter/material.dart';
import '../controller/purchase_controller.dart';
import '../models/purchase_model.dart';

class PurchaseDetails extends StatefulWidget {
  const PurchaseDetails({super.key});

  @override
  _PurchaseDetailsState createState() => _PurchaseDetailsState();
}

class _PurchaseDetailsState extends State<PurchaseDetails> {
  final PurchaseController _controller = PurchaseController();
  String message = "Enter a URL to fetch purchase details";
  ShoppingDetails? shoppingDetails;
  List<Product>? products;
  final TextEditingController urlController = TextEditingController();
  bool isLoading = false; // Controle de carregamento

  void fetchDetails() async {
    setState(() {
      isLoading = true; // Mostra indicador de carregamento
      message = "Loading...";
    });

    if (urlController.text.isEmpty) {
      setState(() {
        message = "Please enter a valid URL";
        isLoading = false; // Para o carregamento
      });
      return;
    }

    final data = await _controller.fetchPurchaseDetails(urlController.text);

    setState(() {
      if (data != null) {
        shoppingDetails = ShoppingDetails.fromJson(data['shopping_details']);
        products = (data['products'] as List)
            .map((product) => Product.fromJson(product))
            .toList();
        message = "Purchase details loaded!";
      } else {
        message = "Failed to load purchase details";
      }
      isLoading = false; // Para o carregamento
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: urlController,
            decoration: const InputDecoration(
              labelText: 'Enter URL',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: fetchDetails,
            child: const Text('Fetch Purchase Details'),
          ),
          const SizedBox(height: 20),
          isLoading
              ? const Center(
                  child:
                      CircularProgressIndicator()) // Indicador de carregamento
              : shoppingDetails != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Company Name: ${shoppingDetails!.companyName}",
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          "Datetime Purchase: ${shoppingDetails!.datetimePurchase}",
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          "Payment Method: ${shoppingDetails!.paymentMethod}",
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Products:",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        ...products!.map((product) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Name: ${product.name}"),
                                  Text("Code: ${product.code}"),
                                  Text("Quantity: ${product.quantity}"),
                                  Text("Unit: ${product.unit}"),
                                  Text("Unit Price: ${product.unitPrice}"),
                                  Text("Total Price: ${product.totalPrice}"),
                                ],
                              ),
                            )),
                      ],
                    )
                  : Text(
                      message,
                      style: const TextStyle(fontSize: 24),
                    ),
        ],
      ),
    );
  }
}
